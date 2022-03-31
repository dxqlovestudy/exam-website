<template>
  <div class="exam-list-item">
    <div class="exam_hint">
      <div class="name">nickname</div>
      <div class="dividing"></div>
      <div class="submit-time">{{ submitTime }}</div>
    </div>
    <div class="exam_title">{{ title }}</div>
    <div class="exam_info">
      <div class="score">总分：{{ totalScore }}</div>
<!--      <div class="dividing"></div>-->
<!--      <div class="accuracy">正确率：{{ `80%` }}</div>-->
    </div>
  </div>
</template>
<script setup>
// prop:["itemList"]
import {reactive} from "vue"
import { formatMsgTime } from "@/utils/transformTime";
const props = defineProps({
  item: {
    type: Object,
    default: {},
  },
});
const examType = {
  random: "随机组卷",
};
const item = props.item;
const submitTime = formatMsgTime(parseInt(item.submitTime));
const title = examType[item.examType];
const totalScore = item.totalScore;
</script>
<style lang="less" scoped>
.exam-list-item {
  cursor: pointer;
  height: 87px;
  padding: 10px;
  &:hover {
    background-color: #fafafa;
  }
  .dividing {
    width: 1px;
    height: 14px;
    background: #e5e6eb;
    margin: 0 8px;
  }
  .exam_hint {
    display: flex;
    align-items: center;
    font-size: 13px;
    color: #86909c;
  }
  .exam_title {
    margin: 15px 0;
    font-weight: 700;
    font-size: 16px;
    color: #1d2129;
    overflow: hidden;
    text-overflow: ellipsis;
  }
  .exam_info {
    display: flex;
    align-items: center;
    font-weight: 400;
    font-size: 13px;
    color: #86909c;
    padding-bottom: 12px;
    border-bottom: 1px solid #e5e6eb;
  }
}
</style>
