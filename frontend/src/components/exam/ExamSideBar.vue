<template>
  <div class="exam_slide_bar">
    <div class="title">
      <div class="name">姓名：{{ nickname }}</div>
    </div>
    <el-scrollbar ref="scrollbar" height="550px" always>
      <div class="tf" v-if="size !== 0">
        <div class="tf_title solid">题目</div>
        <SlideItem
          v-for="(item, i) in props.questions"
          :key="item.questionId"
          :number="i + 1"
          :score="16"
          :questionId="item.questionId"
        ></SlideItem>
      </div>
    </el-scrollbar>
  </div>
</template>
<script setup>
import SlideItem from "./SlideItem.vue";

// 3/25日Mercurio修改
// 目的，将做题界面的姓名和数据库连接，未完成
import axios from "axios";
const props = defineProps({
  questions: {
    type: Object,
    default: {},
  },
});
const size = props.questions.length;

// axios.get('http://localhost:8080/getSelfInfo',)
//     .then(function (data){
//       console.log('........')
//       console.log(data)
//     }
// )
axios.get('http://localhost:8080/getSelfInfo',{
  params: {
    'nickname':"nickname"
  }
})
    .then(function (response) {
      console.log(response);
    })
    .catch(function (error) {
      console.log(error);
    });

</script>
<style lang="less" scoped>
.exam_slide_bar {
  width: 90%;
  min-height: 550px;
  padding: 10px;
  background-color: #fff;
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
  border-radius: 4px;
  display: inline-block;
  margin-left: 10px;
  vertical-align: top;
  .title {
    display: flex;
    justify-content: space-between;
    margin-bottom: 10px;
  }
  .solid {
    border-bottom: 1px solid #d3d3d3;
    padding-bottom: 10px;
    margin-bottom: 10px;
  }
}
</style>
