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

    <el-table :data="userArr" style="width: 100%" v-loading="loading">
      <el-table-column type="index" label="序号" width="50" />
      <el-table-column label="编号" align="center" prop="id" />
      <el-table-column
        label="类别名称"
        align="center"
        prop="name"
        :formatter="formatMore"
      />
      <el-table-column label="状态" align="center" prop="name">
        <template slot-scope="scope">
          <el-tag v-if="scope.row.status === 1" size="mini" effect="dark"
            >正常</el-tag
          >
          <el-tag v-else size="mini" effect="dark" type="danger">禁用</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="更新时间" align="center" prop="updateTime" />
      <el-table-column label="创建时间" align="center" prop="createTime" />
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
      @pagination="getUser"
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
          <el-input v-model="form.name" placeholder="请输入用户名称" />
        </el-form-item>

        <el-form-item label="状态" prop="status">
          <el-select v-model="form.status" placeholder="请选择状态">
            <el-option label="正常" :value="1"> </el-option>
            <el-option label="禁用" :value="0"> </el-option>
          </el-select>
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
import {
  getUser,
  addUser,
  upUser,
  delUser,
  getMoreAll,
  upUserPwd,
  getRolesAll,
  upTheme,
} from "@/api/admin";
import { formatDate } from "@/utils";
import upFile from "@/components/upFile";
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
      userArr: [],
      dialogVisible: false,
      themeOpen: false,
      rolesArr: [],
      moreArr: [],
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
  async created() {
    await this.getRoles();
    await this.getMoreAll();
    this.getUser();
  },
  methods: {
    formatterCreateTime(row) {
      return formatDate(row.createTime);
    },
    resetForm() {
      this.form = { status: 1 };
    },
    handleEdit(index, row) {
      this.resetForm();
      this.form = { ...row };
      this.$set(this.form, "rolesId", row.rolesId.split(","));
      this.dialogVisible = true;
      this.$nextTick(() => {
        this.$set(this, "fileList", [{ name: "", url: row.url }]);
      });
    },
    async affirm() {
      this.$refs["ruleForm"].validate(async (valid) => {
        if (!valid) return;
        try {
          let list = this.$refs.upFile.getFileRes();
          if (list.length === 0) {
            this.form.url = "";
          } else this.form.url = list[0].url;
          this.addLoading = true;
          let rolesId = this.form.rolesId.join(",");
          this.form.id && (await upUser({ ...this.form, rolesId }));
          this.addLoading = false;
          this.$message.success(this.form.id ? "修改成功！" : "添加成功！");
          this.getUser();
          this.dialogVisible = false;
        } catch (e) {
          this.addLoading = false;
        }
      });
    },
    openDialog() {
      this.resetForm();
      this.dialogVisible = true;
      this.$nextTick(() => {
        this.$refs.upFile.clearFiles();
      });
    },
    async getMoreAll() {
      const { data } = await getMoreAll();
      this.moreArr = data;
    },
    async getUser() {
      this.loading = true;
      const { data, total } = await getUser(this.queryParams);
      this.loading = false;
      this.userArr = data;
      this.total = total;
    },
    handleQuery() {
      this.queryParams.page = 1;
      this.getUser();
    },
  },
  components: { upFile },
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
