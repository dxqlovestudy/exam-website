<template>
  <div class="score">
    <el-card class="box-card">
      <div class="diagram" ref="diagram"></div>
      <div class="info">
        <div class="name">姓名：黄京旺</div>
        <div class="total_score">得分：{{ scoreContext }}</div>
        <div class="start_time">开始时间：{{ startTime }}</div>
        <div class="end_time">总用时：{{ totalTime }}</div>
        <el-button class="btn" type="primary" round @click="toReview"
          >查看卷子</el-button
        >
      </div>
    </el-card>
  </div>
</template>
<script setup>
import { ref, onMounted, inject } from "vue";
import { useRoute, useRouter } from "vue-router";
import { useStore } from "vuex";
import { getExerciseReview } from "@/network/api/user";
// 导入更改卷子函数
import { getGrades } from "@/utils/getGrades";
// 导入时间转化函数
import { format, timestamp } from "@/utils/transformTime";
const route = useRoute();
const store = useStore();
// 考试ID
// const examId = parseInt(route.params.id);
const examId = route.params.id;
// 引入echarts
const echarts = inject("echarts");
// 考试信息
const questions = ref([]);
const startTime = ref();
const totalTime = ref();
const endTime = ref();
const diagram = ref();
const scoreContext = ref(0);
async function init() {
  if (examId === "0") {
    // 获取本地考试记录
    questions.value = store.getters.getQuestions;
    startTime.value = store.getters.getStartTime;
    totalTime.value = store.getters.getTotalTime;
    endTime.value = store.getters.getEndTime;
  } else {
    // 获取指定examId的考试信息
    const res = await getExerciseReview(examId);
    console.log("res: ", res);
    if (res.code === 201) {
      const data = res.data;
      questions.value = data.questions;
      totalTime.value = data.spendTime;
      startTime.value = data.startTime;
      // 将问题存入vuex中
      store.commit("setQuestions", data.questions)
    }
  }
  totalTime.value = format(totalTime.value);
  startTime.value = timestamp(startTime.value);
  store.commit("setQuestions", questions.value);
  const { correctSize, errorSize, score, totalScore } = getGrades(
    questions.value
  );
  scoreContext.value = `${score} / ${totalScore} 分`;
  var myChart = echarts.init(diagram.value);
  const option = {
    title: {
      text: score,
      textStyle: {
        color: "#01c4a3",
        fontSize: 40,
      },
      subtext: `总分：${totalScore}分`,
      subtextStyle: {
        color: "#909090",
      },
      itemGap: -10, // 主副标题距离
      left: "center",
      top: "center",
    },
    angleAxis: {
      max: totalScore, // 满分
      clockwise: true, // 逆时针
      // 隐藏刻度线
      axisLine: {
        show: false,
      },
      axisTick: {
        show: false,
      },
      axisLabel: {
        show: false,
      },
      splitLine: {
        show: false,
      },
    },
    radiusAxis: {
      type: "category",
      // 隐藏刻度线
      axisLine: {
        show: false,
      },
      axisTick: {
        show: false,
      },
      axisLabel: {
        show: false,
      },
      splitLine: {
        show: false,
      },
    },
    polar: {
      center: ["50%", "50%"],
      radius: "140%", //图形大小
    },
    series: [
      {
        type: "bar",
        data: [
          {
            name: "作文得分",
            value: score,
            itemStyle: {
              normal: {
                color: new echarts.graphic.LinearGradient(1, 0, 0, 0, [
                  {
                    offset: 0,
                    color: "#aaf14f",
                  },
                  {
                    offset: 1,
                    color: "#0acfa1",
                  },
                ]),
              },
            },
          },
        ],
        coordinateSystem: "polar",
        roundCap: true,
        barWidth: 25,
        barGap: "-100%", // 两环重叠
        z: 2,
      },
      {
        // 灰色环
        type: "bar",
        data: [
          {
            value: totalScore,
            itemStyle: {
              color: "#e2e2e2",
              shadowColor: "rgba(0, 0, 0, 0.2)",
              shadowBlur: 5,
              shadowOffsetY: 2,
            },
          },
        ],
        coordinateSystem: "polar",
        roundCap: true,
        barWidth: 25,
        barGap: "-100%", // 两环重叠
        z: 1,
      },
    ],
  };
  // 绘制图表
  myChart.setOption(option);
}
onMounted(async () => {
  await init();
});
// 查看卷子详情
const router = useRouter();
function toReview() {
  router.push("/review");
}
</script>
<style lang="less" scoped>
.score {
  width: 70%;
  min-width: 1000px;
  margin: 100px auto;

  .box-card {
    min-height: 500px;
    display: flex;
    align-items: center;
    :deep(.el-card__body) {
      display: flex;
    }
    .diagram {
      width: 300px;
      height: 300px;
    }
    .info {
      margin-left: 150px;
      & > div {
        padding: 20px 0;
        font-weight: bolder;
      }
      .btn {
        display: block;
        margin: 20px auto 0;
      }
    }
  }
}
</style>
