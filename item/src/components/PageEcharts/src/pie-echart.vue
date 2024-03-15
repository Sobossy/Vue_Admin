<template>
  <div class="pie-echart">
    <BaseEchart :option="option"></BaseEchart>
  </div>
</template>
<script>
import BaseEchart from "./base-echart.vue";

export default {
  components: {
    BaseEchart,
  },
  props: {
    pieData: Array,
  },
  data() {
    return {
      option: this.generateOption(),
    };
  },
  created() {
    this.$watch("pieData", () => {
      this.option = this.generateOption();
    });
  },
  methods: {
    generateOption() {
      return {
        tooltip: {
          trigger: "item",
        },
        legend: {
          orient: "horizontal",
          left: "left",
        },
        series: [
          {
            name: "访问来源",
            type: "pie",
            radius: "50%",
            bottom: "-10%",
            data: this.pieData,
            emphasis: {
              itemStyle: {
                shadowBlur: 10,
                shadowOffsetX: 0,
                shadowColor: "rgba(0, 0, 0, 0.5)",
              },
            },
          },
        ],
      };
    },
  },
};
</script>
<style scoped lang="scss"></style>
