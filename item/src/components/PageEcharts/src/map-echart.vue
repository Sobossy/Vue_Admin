<template>
  <div class="map-echart">
    <BaseEchart :option="option"></BaseEchart>
  </div>
</template>
<script>
import BaseEchart from "./base-echart.vue";
import { convertData } from "../untils/convert-data";

export default {
  components: {
    BaseEchart,
  },
  props: ["mapData"],
  data() {
    return {
      option: this.generateOption(),
    };
  },
  created() {
    this.$watch("mapData", () => {
      this.option = this.generateOption();
    });
  },
  methods: {
    generateOption() {
      return {
        backgroundColor: "#fff",
        title: {
          text: "全国销量统计",
          left: "center",
          textStyle: {
            color: "#fff",
          },
        },
        tooltip: {
          trigger: "item",
          formatter: function (params) {
            return params.name + " : " + params.value[2];
          },
        },
        visualMap: {
          min: 0,
          max: 60000,
          left: 20,
          bottom: 20,
          calculable: true,
          text: ["高", "低"],
          inRange: {
            color: [
              "rgb(70, 240, 252)",
              "rgb(250, 220, 46)",
              "rgb(245, 38, 186)",
            ],
          },
          textStyle: {
            color: "#fff",
          },
        },
        geo: {
          map: "china",
          roam: "scale",
          emphasis: {
            areaColor: "#f4cccc",
            borderColor: "rgb(9, 54, 95)",
            itemStyle: {
              areaColor: "#f4cccc",
            },
          },
        },
        series: [
          {
            name: "销量",
            type: "scatter",
            coordinateSystem: "geo",
            data: convertData(this.mapData),
            symbolSize: 12,
            emphasis: {
              itemStyle: {
                borderColor: "#fff",
                borderWidth: 1,
              },
            },
          },
          {
            type: "map",
            map: "china",
            geoIndex: 0,
            aspectScale: 0.75,
            tooltip: {
              show: false,
            },
          },
        ],
      };
    },
  },
};
</script>
<style scoped lang="scss"></style>
