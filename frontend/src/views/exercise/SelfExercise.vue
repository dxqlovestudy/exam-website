<template>
  <div class="self_exercise" v-if="Object.keys(questions).length !== 0">
    <el-container>
      <el-header
        ><ExamTabBar :size="size" :examId="examId" v-if="size > 0"></ExamTabBar
      ></el-header>
      <el-container>
        <el-aside :width="widthChange" class="father-aside">
          <el-button
            type="primary"
            class="fold-aside-btn"
            icon="el-icon-s-fold"
            @click="foldAside"
            circle
          ></el-button>
          <ExamSideBar :questions="questions"></ExamSideBar>
        </el-aside>
        <el-main><ExamQues :questions="questions"></ExamQues></el-main>
      </el-container>
    </el-container>
  </div>
  <div v-else v-loading.fullscreen.lock="true"></div>
</template>
<script>
import { ref,defineComponent } from "vue";
import { useStore } from "vuex";
import { getExerciseQuestions, exerciseExit } from "@/network/api/user";
// import { beforeunload } from "@/network/api/user";
import config from "@/config"
export default defineComponent({
  setup(){
    let size = ref(0);
    const examId = ref("");
    async function init() {
      const res = await getExerciseQuestions();
      console.log("res: ", res);
      size.value = res.data.questions.length;
      examId.value = res.data.examId;
      questions.value = res.data.questions;
      store.commit("setQuestions", questions.value);
    }
    // 获取练习题目等相关信息
        init();
    // 监听浏览器关闭与刷新
    // onMounted(() => {
    //   // window.addEventListener("beforeunload", (e) => {
    //   //   e = e || window.event;
    //   //   if (e) e.returnValue = "";
    //   //   return "";
    //   // });
    //   window.addEventListener("unload", (e) => {
    //     exerciseExit(questions.value);
    //   });
    // });
    // 获取练习题目等相关信息
    let questions = ref({});
    const store = useStore();
    questions.value = store.getters.getQuestions;

    // 折叠侧边栏
    const widthChange = ref("25%")
    const foldAside = ()=>{
      widthChange.value =
              widthChange.value == "25%" ? "12.5%" : "25%"

    }
    return {
      widthChange,
      foldAside,
      questions,
      store,
      size,
      examId,
      init,
    }
  }
})

</script>
<style lang="less" scoped>
.self_exercise {
  min-width: 1200px;
  position: relative;
  .el-main {
    background-color: #fff;
    border-radius: 10px;
  }
}
/*侧边栏*/
.father-aside{
  position: relative;
  overflow-x: hidden;
}
.fold-aside-btn{
  position: absolute;
  right: 0;
}
</style>
