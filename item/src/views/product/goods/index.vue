<template>
  <div class="box">
    <el-form :model="queryParams" ref="queryForm" :inline="true">
      <el-form-item label="所属类别" prop="categoryId">
        <el-select
          v-model="queryParams.categoryId"
          placeholder="请选择所属类别"
          size="small"
        >
          <el-option
            v-for="item in categoryList"
            :key="item.id"
            :label="item.name"
            :value="item.id"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="商品信息" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入商品名称"
          clearable
          size="small"
        />
      </el-form-item>
      <el-form-item label="生产地址" prop="address">
        <el-input
          v-model="queryParams.address"
          placeholder="请输入商品名称"
          clearable
          size="small"
        />
      </el-form-item>
      <el-form-item label="价格区间">
        <el-input-number
          v-model="queryParams.minPrice"
          :precision="2"
          :step="0.1"
          :min="0"
        />-
        <el-input-number
          v-model="queryParams.maxPrice"
          :precision="2"
          :step="0.1"
        />
      </el-form-item>
      <el-form-item label="销量区间">
        <el-input-number v-model="queryParams.minSellAmount" :min="0" />-
        <el-input-number v-model="queryParams.maxSellAmount" />
      </el-form-item>
      <el-form-item label="收藏数区间">
        <el-input-number v-model="queryParams.minFavorites" :min="0" />-
        <el-input-number v-model="queryParams.maxFavorites" />
      </el-form-item>
      <el-form-item>
        <el-button
          type="primary"
          icon="el-icon-search"
          size="small"
          @click="handleQuery"
          >查询</el-button
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

    <el-table :data="goodsArr" style="width: 100%" v-loading="loading">
      <el-table-column type="index" align="center" label="序号" />
      <el-table-column label="名称" align="center" prop="name" />
      <el-table-column label="价格" align="center" prop="price" />
      <el-table-column label="图片" align="center" prop="url">
        <template slot-scope="scope">
          <el-image
            style="width: 70px; height: 70px"
            :src="scope.row.url"
            :preview-src-list="[scope.row.url]"
            fit="cover"
          >
          </el-image>
        </template>
      </el-table-column>
      <el-table-column label="库存" align="center" prop="inventory" />
      <el-table-column label="销量" align="center" prop="sellAmount" />
      <el-table-column label="收藏数" align="center" prop="favorites" />
      <el-table-column label="生产地址" align="center" prop="address" />
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
      @pagination="getGoods"
    />
    <el-dialog title="操作框" :visible.sync="dialogVisible" width="40%">
      <el-form
        class="demo-form-inline"
        label-width="80px"
        :model="form"
        :rules="rules"
        ref="ruleForm"
      >
        <el-form-item label="所属类别" prop="categoryId">
          <el-select
            v-model="form.categoryId"
            placeholder="请选择所属类别"
            size="small"
          >
            <el-option
              v-for="item in categoryList"
              :key="item.id"
              :label="item.name"
              :value="item.id"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="名称" prop="name">
          <el-input v-model="form.name" placeholder="请输入名称" />
        </el-form-item>
        <el-form-item label="价格" prop="price">
          <el-input v-model="form.price" placeholder="请输入价格" />
        </el-form-item>
        <el-form-item label="库存" prop="inventory">
          <el-input v-model="form.inventory" placeholder="请录入库存" />
        </el-form-item>
        <el-form-item label="销量" prop="sellAmount">
          <el-input v-model="form.sellAmount" placeholder="请录入销量" />
        </el-form-item>
        <el-form-item label="收藏数" prop="favorites">
          <el-input v-model="form.favorites" placeholder="请录入收藏数" />
        </el-form-item>
        <el-form-item label="生产地址" prop="address">
          <el-input v-model="form.address" placeholder="请输入生产地址" />
        </el-form-item>
        <el-form-item label="图片" prop="url">
          <upFile
            ref="upFile"
            :fileList="fileList"
            :limit="1"
            :multiple="false"
            accept=".jpg,.png,.gif,.jpeg"
            :size="1"
          ></upFile>
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
  addGoods,
  getGoods,
  upGoods,
  delGoods,
  getCategory,
} from "@/api/product";
import { formatUTC } from "@/utils";
import upFile from "@/components/upFile";
export default {
  components: { upFile },
  name: "Goods",
  data() {
    return {
      queryParams: {
        page: 1,
        size: 10,
      },
      categoryList: [],
      total: 0,
      loading: false,
      addLoading: false,
      goodsArr: [],
      dialogVisible: false,
      search: "",
      form: {},
      rules: {
        name: [
          { required: true, message: "请输入商品名称", trigger: "blur" },
          {
            min: 2,
            max: 15,
            message: "长度在 2 到 15 个字符",
            trigger: "blur",
          },
        ],
        price: [{ required: true, message: "请输入价格", trigger: "blur" }],
        inventory: [{ required: true, message: "请录入库存", trigger: "blur" }],
        sellAmount: [
          { required: true, message: "请录入销量", trigger: "blur" },
        ],
        favorites: [
          { required: true, message: "请录入收藏数", trigger: "blur" },
        ],
        address: [
          { required: true, message: "请输入生产地址", trigger: "blur" },
        ],
        // url: [{ required: true, message: "请选择参考图片", trigger: "change" }],
      },
      fileList: [],
      options: [],
    };
  },
  async created() {
    await this.getGoods();
    this.getCategoryList();
  },
  methods: {
    formatTimeUTC(utcString, format = "YYYY-MM-DD HH:mm:ss") {
      return formatUTC(utcString, format);
    },
    handleChange(value) {
      console.log(value);
    },
    resetForm() {
      this.form = { status: 1 };
    },
    // 编辑
    handleEdit(index, row) {
      this.resetForm();
      this.form = { ...row };
      this.dialogVisible = true;
      this.$nextTick(() => {
        this.$set(this, "fileList", [{ name: "", url: row.url }]);
      });
    },
    // 删除
    handleDelete(index, row) {
      this.$confirm("确定删除该类别？", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "error",
      }).then(async () => {
        await delGoods({ id: row.id });
        this.getGoods();
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
          let list = this.$refs.upFile.getFileRes();
          if (list.length === 0) {
            this.form.url = "";
          } else this.form.url = list[0].url;
          this.addLoading = true;
          this.form.id
            ? await upGoods({ ...this.form })
            : await addGoods({ ...this.form });
          this.addLoading = false;
          this.$message.success(this.form.id ? "修改成功！" : "添加成功！");
          console.log("form", this.form);
          this.getGoods();
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
    async getGoods() {
      this.loading = true;
      const { data, total } = await getGoods(this.queryParams);
      this.loading = false;
      this.goodsArr = data;
      this.total = total;
    },
    handleQuery() {
      this.queryParams.page = 1;
      this.getGoods();
    },
    async getCategoryList() {
      const { data } = await getCategory({
        page: 1,
        size: 1000,
      });
      console.log("data", data);
      this.categoryList = data;
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
, getCategory
