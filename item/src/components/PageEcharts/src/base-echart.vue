<template>
  <div class="base-echart">
    <div class="echart" ref="echartRef"></div>
  </div>
</template>
<script>
import * as echarts from "echarts";
import ChinaJSON from "../data/china.json";

export default {
  props: ["option"],
  create() {
    echarts.registerMap("china", ChinaJSON);
  },
  mounted() {
    const echartRef = this.$refs.echartRef;
    const echartInstance = echarts.init(echartRef, "light", {
      renderer: "canvas",
    });

    // 第一次进行setOption
    // this.$watch(this.options, () => {
    echartInstance.setOption(this.option);
    // });

    // 监听window缩放
    window.addEventListener("resize", () => {
      echartInstance.resize();
    });
  },
};
</script>
<style scoped lang="scss">
.base-echart {
  color: skyblue;
}
.echart {
  height: 300px;
}
</style>
