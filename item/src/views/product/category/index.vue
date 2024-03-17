<template>
  <div class="box">
    <el-form :model="queryParams" ref="queryForm" :inline="true">
      <el-form-item label="商品分类" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入商品类名"
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
          >搜索</el-button
        >
      </el-form-item>
    </el-form>
    <el-button
      icon="el-icon-plus"
      type="primary"
      plain
      size="small"
      @click="openDialog"
      >添加商品类别</el-button
    >

    <el-table :data="categoryArr" style="width: 100%" v-loading="loading">
      <el-table-column type="index" align="center" label="序号" />
      <el-table-column label="类别名称" align="center" prop="name">
        <template slot-scope="scope">
          <el-link type="primary" @click="handleGoods(scope.row.id)">{{
            scope.row.name
          }}</el-link>
        </template>
      </el-table-column>
      <el-table-column label="状态" align="center" prop="status">
        <template slot-scope="scope">
          <el-tag v-if="scope.row.status === 1" size="mini" effect="dark"
            >正常</el-tag
          >
          <el-tag v-else size="mini" effect="dark" type="danger">禁用</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="备注" align="center" prop="remarks" width="350" />
      <el-table-column
        label="更新时间"
        align="center"
        prop="updateTime"
        width="150"
      >
        <template #default="scope">
          <span>{{ formatTimeUTC(scope.row.updateTime) }}</span>
        </template>
      </el-table-column>
      <el-table-column
        label="创建时间"
        align="center"
        prop="createTime"
        width="150"
      >
        <template #default="scope">
          <span>{{ formatTimeUTC(scope.row.createTime) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" width="350">
        <template slot-scope="scope">
          <el-button
            size="mini"
            v-if="scope.row.admin !== 1"
            @click="handleEdit(scope.$index, scope.row)"
            >编辑</el-button
          >
          <el-button
            size="mini"
            v-if="scope.row.admin !== 1"
            type="danger"
            @click="handleDelete(scope.$index, scope.row)"
            >删除</el-button
          >
        </template>
      </el-table-column>
    </el-table>
    <pagination
      v-show="total > 0"
      :total="total"
      :page.sync="queryParams.page"
      :limit.sync="queryParams.size"
      @pagination="getCategory"
    />
    <el-dialog title="操作框" :visible.sync="dialogVisible" width="40%">
      <el-form
        class="demo-form-inline"
        label-width="80px"
        :model="form"
        :rules="rules"
        ref="ruleForm"
      >
        <el-form-item label="类别名称" prop="name">
          <el-input v-model="form.name" placeholder="请输入类别名称名称" />
        </el-form-item>

        <el-form-item label="状态" prop="status">
          <el-select v-model="form.status" placeholder="请选择状态">
            <el-option label="正常" :value="1"> </el-option>
            <el-option label="禁用" :value="0"> </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="备注说明">
          <el-input v-model="form.remarks" placeholder="请输入备注" />
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
import {
  addCategory,
  getCategory,
  upCategory,
  delCategory,
} from "@/api/product";
import { formatUTC } from "@/utils";
export default {
  name: "Category",
  data() {
    return {
      queryParams: {
        page: 1,
        size: 10,
      },
      total: 0,
      loading: false,
      addLoading: false,
      categoryArr: [],
      dialogVisible: false,
      search: "",
      form: {},
      rules: {
        name: [
          { required: true, message: "请输入用户名称", trigger: "blur" },
          {
            min: 2,
            max: 15,
            message: "长度在 2 到 15 个字符",
            trigger: "blur",
          },
        ],
        rolesId: [
          { required: true, message: "请选择用户角色", trigger: "change" },
        ],
        moreId: [
          { required: true, message: "请选择归属账号", trigger: "change" },
        ],
      },
      fileList: [],
    };
  },
  created() {
    this.getCategory();
  },
  methods: {
    formatTimeUTC(utcString, format = "YYYY-MM-DD HH:mm:ss") {
      return formatUTC(utcString, format);
    },
    resetForm() {
      this.form = { status: 1 };
    },
    // 编辑
    handleEdit(index, row) {
      this.resetForm();
      this.form = { ...row };
      this.dialogVisible = true;
    },
    // 删除
    handleDelete(index, row) {
      this.$confirm("确定删除该类别？", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "error",
      }).then(async () => {
        await delCategory({ id: row.id });
        this.getCategory();
        this.$message({
          message: "删除成功！",
          type: "success",
        });
      });
    },

    // 确定修改
    async affirm() {
      this.$refs["ruleForm"].validate(async (valid) => {
        if (!valid) return;
        try {
          this.addLoading = true;
          this.form.id
            ? await upCategory({ ...this.form })
            : await addCategory({ ...this.form });
          this.addLoading = false;
          this.$message.success(this.form.id ? "修改成功！" : "添加成功！");
          this.getCategory();
          this.dialogVisible = false;
        } catch (e) {
          this.addLoading = false;
        }
      });
    },
    openDialog() {
      this.resetForm();
      this.dialogVisible = true;
    },
    async getCategory() {
      this.loading = true;
      const { data, total } = await getCategory(this.queryParams);
      this.loading = false;
      this.categoryArr = data;
      this.total = total;
    },
    handleQuery() {
      this.queryParams.page = 1;
      this.getCategory();
    },
    handleGoods(id) {
      this.$router.push({ path: "/product/product/goods", query: { id } });
    },
  },
};
</script>
<style scoped lang="scss">
.boxs {
  padding: 20px;
}
.color-title {
  margin-bottom: 10px;
  color: #000;
}
</style>
