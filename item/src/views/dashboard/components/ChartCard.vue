<template>
  <div class="chart-card">
    <el-card class="box-card" :header="header">
      <slot>默认的内容</slot>
    </el-card>
  </div>
</template>
<script>
export default {
  name: "ChartCard",
  components: {},
  props: {
    header: "卡片的头部标题",
  },
  methods: {},
};
</script>
<style scoped lang="scss"></style>
