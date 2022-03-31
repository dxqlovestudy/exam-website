<template>
  <div class="self_exercise" v-if="Object.keys(questions).length !== 0">
    <el-container>
      <el-container>
        <el-aside :width="widthChange" class="father-aside">
          <el-button
              type="primary"
              class="fold-aside-btn"
              icon="el-icon-s-fold"
              @click="foldAside"
              circle
          ></el-button>
          <ExamSideBar :questions="questions" type="review"></ExamSideBar>
        </el-aside>
        <el-main
          ><ExamQues :questions="questions" type="review"></ExamQues
        ></el-main>
      </el-container>
    </el-container>
  </div>
  <div v-else v-loading.fullscreen.lock="true"></div>
</template>
<script>
import { ref,defineComponent } from "vue";
import { useStore } from "vuex";
export default defineComponent({
  setup(){
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
      store
    }
  }
})
</script>
<style lang="less" scoped>
.self_exercise {
  margin-top: 50px;
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
