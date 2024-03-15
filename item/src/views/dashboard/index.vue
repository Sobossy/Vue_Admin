<template>
  <!-- <div class="dashboard-container">
    <div class="title">农药销售后台管理系统</div>
  </div> -->

  <div class="dashboard">
    <!-- <el-row :gutter="10">
      <template v-for="(item, index) in amountList">
        <el-col :span="6" :xs="24" :sm="12" :md="12" :lg="6">
          <CountCard :countObj="item" :count-num="index"></CountCard>
        </el-col>
      </template>
    </el-row> -->

    <el-row :gutter="10">
      <el-col :span="7">
        <ChartCard>
          <PieEchart :pie-data="showGoodsCategoryCount"></PieEchart>
        </ChartCard>
      </el-col>
      <el-col :span="10">
        <ChartCard>
          <MapEchart :mapData="showGoodsAddressSale"></MapEchart>
        </ChartCard>
      </el-col>
      <el-col :span="7">
        <ChartCard>
          <RoseEchart :rose-data="showGoodsCategoryCount"></RoseEchart>
        </ChartCard>
      </el-col>
    </el-row>

    <el-row :gutter="10">
      <el-col :span="12">
        <ChartCard>
          <LineEchart v-bind="showGoodsCategorySale" />
        </ChartCard>
      </el-col>
      <el-col :span="12">
        <ChartCard>
          <BarEchart v-bind="showGoodsCategoryFavor" />
        </ChartCard>
      </el-col>
    </el-row>
  </div>
</template>

<script>
import CountCard from "./components/CountCard.vue";
import ChartCard from "./components/ChartCard.vue";
import {
  goodsCategoryCount,
  goodsAddressSale,
  amountList,
  goodsCategorySale,
  goodsCategoryFavor,
} from "./config.js";
import {
  PieEchart,
  RoseEchart,
  MapEchart,
  LineEchart,
  BaseEchart,
  BarEchart,
} from "@/components/PageEcharts";
export default {
  name: "Dashboard",
  components: {
    PieEchart,
    RoseEchart,
    MapEchart,
    LineEchart,
    BaseEchart,
    BarEchart,
    CountCard,
    ChartCard,
  },
  props: {},
  computed: {
    showGoodsCategoryCount: function () {
      return goodsCategoryCount.map((item) => ({
        name: item.name,
        value: item.goodsCount,
      }));
    },
    showGoodsCategorySale: function () {
      const labels = goodsCategorySale.map((item) => item.name);
      const values = goodsCategorySale.map((item) => item.goodsSale);
      return { labels, values };
    },
    showGoodsCategoryFavor: function () {
      const labels = goodsCategoryFavor.map((item) => item.name);
      const values = goodsCategoryFavor.map((item) => item.goodsFavor);
      return { labels, values };
    },
    showGoodsAddressSale: function () {
      return goodsAddressSale.map((item) => ({
        name: item.address,
        value: item.count,
      }));
    },
  },
  data() {
    return {
      amountList: amountList,
    };
  },
  created() {},
  methods: {},
};
</script>
<style scoped lang="scss">
/* .dashboard-container {
  padding: 50px 20px;
  text-align: center;
}
.title {
  font-size: 46px;
  font-weight: 700;
} */
.dashboard {
  color: red;
}

.el-row {
  margin-bottom: 10px;
}
</style>
