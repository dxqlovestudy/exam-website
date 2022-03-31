<template>
  <div class="list">
    <ExamListItem
      v-for="item in examList"
      :item="item"
      @click="toReview(item)"
    ></ExamListItem>
    <!--     分页 -->
    <div class="block">
      <el-pagination
              layout="prev, pager, next"
              :total="100"
              :page-size="8"
      >
      </el-pagination>
    </div>
  </div>
</template>
<script setup>
import { ref, reactive ,watch } from "vue";
import { useRouter } from "vue-router";
import ExamListItem from "@/components/exam/ExamListItem.vue";
import { getExamList } from "@/network/api/user";

const examList = ref([]);
//随机生成该考生的若干考试信息
async function init() {
  const res = await getExamList();
  // console.log("ExamList res: ", res);
  examList.value = res.data
  return res.data
}
const result = init();
const dataList = result.then(resolve=>{
  console.log("这个是pro的返回结果",resolve);
  const data = reactive({
    pageTotal: resolve.length,//数据总条数
    currentPage: 1,//当前开始页
  })
  //页面变化时的处理函数
  const handleCurrentChange = (cpage)=>{
    const start = (cpage-1)*8
    const end =  cpage*8
    examList.value = resolve.slice(start,end)
    console.log(examList.value)
    // this.$emit('handleCurrentChange',cpage,examList.value,dataArr)
  }
  return {data,handleCurrentChange}
})

const Router = useRouter();
async function toReview(exam) {
  const examRecordingId = exam.examRecordingId;
  Router.push(`/score/${examRecordingId}`);
}
</script>
<style lang="less" scoped></style>
