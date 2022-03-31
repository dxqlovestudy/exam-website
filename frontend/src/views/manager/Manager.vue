<template>
  <div class="manager">
    <el-tabs type="border-card">
      <el-tab-pane label="增加题目"><AddQuestions></AddQuestions></el-tab-pane>
      <el-tab-pane label="题目列表"><QuestionList></QuestionList></el-tab-pane>
    </el-tabs>
  </div>
</template>
<script setup>
import AddQuestions from "./child/AddQuestions.vue";
import QuestionList from "./child/QuestionList.vue";
</script>
<style lang="less" scoped>
.manager {
  width: 70%;
  min-width: 900px;
  margin: 50px auto 0;
  :deep(.el-tabs__content) {
    min-height: 500px;
  }
}
</style>
