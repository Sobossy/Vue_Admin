<template>
  <div class="box">
    <el-form
        :model="queryParams"
        ref="queryForm"
        :inline="true"
    >
      <el-form-item label="账户名称" prop="name">
        <el-input
            v-model="queryParams.name"
            placeholder="请输入名称"
            clearable
            size="small"
        />
      </el-form-item>
      <el-form-item>
        <el-button
            type="primary"
            icon="el-icon-search"
            size="small"
            @click="handleQuery"
        >搜索</el-button>
      </el-form-item>
    </el-form>
    <el-button icon="el-icon-plus" type="primary" plain size="small" @click="openDialog">添加账号</el-button>

    <el-table :data="moreArr" v-loading="loading">
      <el-table-column label="编号" align="center" prop="id" />
      <el-table-column label="账号名称" align="center" prop="name">
        <template slot-scope="scope">
          {{scope.row.name}}
        </template>
      </el-table-column>
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="更新时间" align="center" prop="updateTime"  />
      <el-table-column label="创建时间" align="center" prop="createTime"  />
      <el-table-column align="center" label="操作">
        <template slot-scope="scope">
          <el-button size="mini" @click="handleEdit(scope.$index, scope.row)">编辑</el-button>
          <el-button size="mini" type="danger" @click="handleDelete(scope.$index, scope.row)">删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    <pagination
        v-show="total > 0"
        :total="total"
        :page.sync="queryParams.page"
        :limit.sync="queryParams.size"
        @pagination="getMore"
    />

    <el-dialog title="操作框" :visible.sync="dialogVisible" width="40%">
      <el-form class="demo-form-inline" label-width="80px" :model="form" :rules="rules" ref="ruleForm">
        <el-form-item label="账号名称" prop="name">
          <el-input v-model="form.name" placeholder="请输入账号名称" />
        </el-form-item>
        <el-form-item label="备注说明">
          <el-input v-model="form.remark" placeholder="请输入备注" />
        </el-form-item>
      </el-form>

      <div slot="footer" class="dialog-footer" v-loading="addLoading">
        <el-button @click="dialogVisible = false">取 消</el-button>
        <el-button :type="form.id ? 'warning' : 'primary'" @click="affirm">{{
            form.id ? "确认修改" : "确认添加"
        }}</el-button>
      </div>
    </el-dialog>
  </div>
</template>
<script>
import { addMore, getMore, upMore, delMore } from "@/api/admin";
import {formatDate} from "@/utils";
export default {
  name:"More",
  data () {
    return {
      queryParams:{
        page:1,
        size:10
      },
      total:0,
      loading:false,
      addLoading:false,
      moreArr: [],
      dialogVisible: false,
      form: {
        name: "",
        remark: ""
      },
      search: "",
      rules: {
        name: [
          { required: true, message: '请输入账号名称', trigger: 'blur' },
          { min: 2, max: 15, message: '长度在 2 到 15 个字符', trigger: 'blur' }
        ]
      },
      isChangePwd: false
    }
  },
  created () {
    this.getMore();
  },
  methods: {
    formatterCreateTime(row){
      return formatDate(row.createTime);
    },
    async getMore () {
      this.loading=true;
      let {data,total} = await getMore(this.queryParams);
      this.loading=false;
      this.moreArr = data;this.total=total;
    },
    handleQuery(){
      this.queryParams.page=1;
      this.getMore()
    },
    async affirm () {
      this.$refs['ruleForm'].validate(async (valid) => {
        if (!valid) return;
        try {
          this.addLoading=true;
          !this.form.id&&await addMore(this.form);
          this.form.id&&await upMore(this.form);
          this.addLoading=false;
          this.$message.success(this.form.id?"修改成功！":"添加成功！")
          this.getMore();
          this.dialogVisible = false;
        }catch (e) {
          this.addLoading=false;
        }
      });
    },
    openDialog () {
      this.form = {};
      this.dialogVisible = true;
    },
    handleEdit (i, row) {
      this.form={...row}
      this.dialogVisible = true;

    },
    handleDelete (index, row) {
      this.$confirm('此操作将永久删除该账号, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'error'
      }).then(async () => {
        await delMore({ id: row.id });
        this.getMore();
        this.$message({
          message: '删除成功！',
          type: 'success'
        });
      })
    },
  }
}
</script>
<style lang="scss" scoped>
.boxs {
  padding: 20px;
}
</style>
