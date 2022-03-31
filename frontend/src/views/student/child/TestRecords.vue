<template>
  <div class="test_records">
    <!--    左侧考试列表组件-->
    <div class="exam-list">
      <ExamList></ExamList>
    </div>
    <!--    右侧网络系统管理等组件-->
    <div class="aside">
      <Category></Category>
    </div>
  </div>
</template>
<script setup>
import Category from "./Category.vue";
import ExamList from "./ExamList.vue";
import { ref, reactive ,watch } from "vue";
import { getExamList } from "@/network/api/user";

// const handleCurrentChange = (cpage,examListvalue,dataArr)=>{
//   const start = (cpage-1)*8
//   const end = cpage*8
//   examListvalue = dataArr.slice(start,end)
//   console.log(examList.value)
// }
</script>
<style lang="less" scoped>
.test_records {
  width: 100%;
  max-width: 960px;
  margin: 4.5rem auto 0;
  border-radius: 2px;
  position: relative;
  .exam-list {
    background-color: #fff;
    width: 600px;
    margin-right: 22rem;
    //
    min-height: 300px;
  }
  .aside {
    // background-color: #fff;
    position: absolute;
    top: 0;
    right: 0;
    width: 21rem;
    height: 500px;
  }
}
</style>
