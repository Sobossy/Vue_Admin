<template>
  <div class="count-card">
    <div class="header">
      <span class="title">{{ title }}</span>
      <el-tooltip :content="tips" placement="top" effect="light">
        <el-icon><Warning /></el-icon>
      </el-tooltip>
    </div>
    <div class="content">
      <span ref="count1Ref">{{ number1 }}</span>
    </div>
    <div class="footer">
      <span>{{ subtitle }}</span>
      <span ref="count2Ref">{{ number2 }}</span>
    </div>
  </div>
</template>
<script>
import { CountUp } from "countup.js";
export default {
  name: "CountCard",
  components: {},
  // props: {
  //   title: "商品总销量",
  //   tips: "所有的商品总销量",
  //   number1: 509989,
  //   number2: 509989,
  //   subtitle: "商品总销量",
  //   countNum: 3,
  // },
  props: {
    countObj: Object,
    countNum: String,
  },
  computed: {},
  data() {
    return {
      count1Ref: 0,
      count2Ref: 0,
      title: countObj.title ?? "",
      tips: countObj.tips ?? "",
      number1: countObj.number1 ?? 0,
      number2: countObj.number2 ?? 0,
      subtitle: countObj.subtitle ?? "",
    };
  },
  mounted() {
    const countOption = {
      prefix: this.countNum === 3 ? "￥" : "",
    };
    const countUp1 = new CountUp(this.count1Ref, this.number1, countOption);
    countUp1.start();
    const countUp2 = new CountUp(this.count2Ref, this.number2, countOption);
    countUp2.start();
  },
  methods: {},
};
</script>
<style scoped lang="scss">
.count-card {
  display: flex;
  flex-direction: column;
  padding: 0 20px;
  height: 130px;
  background: white;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);

  .header {
    display: flex;
    height: 38px;
    font-size: 14px;
    color: rgba(0, 0, 0, 0.45);
    justify-content: space-between;
    align-items: flex-end;
  }

  .content {
    display: flex;
    align-items: center;
    flex: 1;
    margin-left: 0px;
    font-size: 26px;
    color: rgba(0, 0, 0, 0.85);
  }

  .footer {
    display: flex;
    height: 38px;
    line-height: 38px;
    font-size: 14px;
    letter-spacing: 1px;
    color: rgba(0, 0, 0, 0.85);
    border-top: 1px solid #f0f0f0;
  }
}
</style>
