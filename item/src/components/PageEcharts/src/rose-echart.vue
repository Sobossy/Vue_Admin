<template>
  <div class="rose-echart">
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
    roseData: Array,
  },
  data() {
    return {
      option: this.generateOption(),
    };
  },
  created() {
    this.$watch("roseData", () => {
      this.option = this.generateOption();
    });
  },
  methods: {
    generateOption() {
      return {
        toolbox: {
          show: true,
          feature: {
            mark: { show: true },
            dataView: { show: true, readOnly: false },
            restore: { show: true },
            saveAsImage: { show: true },
          },
        },
        tooltip: {
          trigger: "item",
        },
        series: [
          {
            name: "访问来源",
            type: "pie",
            radius: [10, 160],
            center: ["50%", "50%"],
            bottom: "-15%",
            roseType: "area",
            itemStyle: {
              borderRadius: 8,
            },
            data: this.roseData,
            label: {
              show: false,
            },
          },
        ],
      };
    },
  },
};
</script>
<style scoped lang="scss">
.rose-echart {
  color: skyblue;
}
</style>
