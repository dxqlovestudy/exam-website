<template>
  <div class="submit_confirm">
    <el-scrollbar height="300px">
      <div class="questions">
        <div v-for="(item, i) in questions">
          <div
            class="question-number"
            :class="{
              finish: questions[i].status === 1,
              warning: questions[i].status === 2,
            }"
            @click="toDetail(i)"
          >
            {{ i + 1 }}
          </div>
        </div>
      </div>
    </el-scrollbar>
  </div>
</template>
<script setup>
const props = defineProps({
  questions: {
    type: Array,
    default: [],
  },
});
const questions = props.questions;
console.log("questions: ", questions);
const emit = defineEmits(["toDetail"]);
// console.log(status);
function toDetail(i) {
  emit("toDetail", i + 1);
}
</script>
<style lang="less" scoped>
.submit_confirm {
  .el-scrollbar {
    .questions {
      display: flex;
      flex-wrap: wrap;
      .question-number {
        cursor: pointer;
        width: 50px;
        height: 50px;
        border-radius: 50%;
        line-height: 50px;
        font-weight: bolder;
        background-color: cornsilk;
        text-align: center;
        margin: 10px;
        color: #bebebe;
        background-color: #f6f6f6;
      }
      .finish {
        color: #f7fef0;
        background: linear-gradient(to bottom, #25d49e, #29c89c);
      }
      .warning {
        color: #f7fef0;
        background: linear-gradient(to bottom, #faad14, #cc8a05);
      }
    }
  }
}
</style>
