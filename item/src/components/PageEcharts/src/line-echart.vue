<template>
  <div class="line-echart">
    <BaseEchart :option="option" />
  </div>
</template>
<script>
import BaseEchart from "./base-echart.vue";

export default {
  components: {
    BaseEchart,
  },
  props: ["labels", "values"],
  data() {
    return {
      option: this.generateOption(),
    };
  },
  created() {
    this.$watch(
      () => [this.labels, this.values],
      () => {
        this.option = this.generateOption();
      }
    );
  },
  methods: {
    generateOption() {
      return {
        tooltip: {
          trigger: "axis",
          axisPointer: {
            type: "cross",
            label: {
              backgroundColor: "#6a7985",
            },
          },
        },
        legend: {},
        grid: {
          left: "3%",
          right: "4%",
          bottom: "3%",
          containLabel: true,
        },
        xAxis: [
          {
            type: "category",
            boundaryGap: false,
            data: this.labels,
          },
        ],
        yAxis: [
          {
            type: "value",
          },
        ],
        series: [
          {
            name: "分类销量统计",
            type: "line",
            stack: "总量",
            areaStyle: {},
            emphasis: {
              focus: "series",
            },
            data: this.values,
          },
        ],
      };
    },
  },
};
</script>
<style scoped lang="scss"></style>
