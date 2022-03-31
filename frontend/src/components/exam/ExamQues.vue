<template>
  <div class="exam_ques">
    <div class="title">
      <div class="question_type">{{ questionType }}</div>
      <div class="question_number">{{ questionNumber }}</div>
    </div>
    <div class="question_detail">
      <div class="choice_question">
        <div class="choice_question_describe question_describe">
          {{ index }}. {{ questionContent }}
        </div>
        <!-- 選擇題 单选 答题 选项 -->
        <div
          class="choice_question_option"
          v-if="type === 'exercise' && !isMoreChoice"
        >
          <el-radio-group v-model="studentAnswer" @change="selectOption">
            <el-radio
              label="A"
              v-if="currentQuestion && currentQuestion.optionA"
              >A. {{ currentQuestion.optionA }}</el-radio
            >
            <el-radio
              label="B"
              v-if="currentQuestion && currentQuestion.optionB"
              >B. {{ currentQuestion.optionB }}</el-radio
            >
            <el-radio
              label="C"
              v-if="currentQuestion && currentQuestion.optionC"
              >C. {{ currentQuestion.optionC }}</el-radio
            >
            <el-radio
              label="D"
              v-if="currentQuestion && currentQuestion.optionD"
              >D. {{ currentQuestion.optionD }}</el-radio
            >
          </el-radio-group>
        </div>
        <!-- 選擇題 多选 答题 选项 -->
        <div v-else-if="type === 'exercise' && isMoreChoice">
          <el-checkbox-group v-model="studentMoreAnswer" @change="selectOption">
            <el-checkbox label="A">{{ currentQuestion.optionA }}</el-checkbox>
            <el-checkbox label="B">{{ currentQuestion.optionB }}</el-checkbox>
            <el-checkbox label="C">{{ currentQuestion.optionC }}</el-checkbox>
            <el-checkbox label="D">{{ currentQuestion.optionD }}</el-checkbox>
          </el-checkbox-group>
        </div>
        <!-- 選擇題 查看卷子 选项 -->
        <div class="choice_question_option" v-if="type === 'review'">
          <el-radio-group>
            <Radio
              :success="answer.indexOf('A') !== -1"
              :error="
                studentAnswer.indexOf('A') !== -1 && answer.indexOf('A') === -1
              "
              v-if="currentQuestion.optionA"
              >A. {{ currentQuestion.optionA }}</Radio
            >
            <Radio
              :success="answer.indexOf('B') !== -1"
              :error="
                studentAnswer.indexOf('B') !== -1 && answer.indexOf('B') === -1
              "
              v-if="currentQuestion.optionB"
              >B. {{ currentQuestion.optionB }}</Radio
            >
            <Radio
              :success="answer.indexOf('C') !== -1"
              :error="
                studentAnswer.indexOf('C') !== -1 && answer.indexOf('C') === -1
              "
              v-if="currentQuestion.optionC"
              >C. {{ currentQuestion.optionC }}</Radio
            >
            <Radio
              :success="answer.indexOf('D') !== -1"
              :error="
                studentAnswer.indexOf('D') !== -1 && answer.indexOf('D') === -1
              "
              v-if="currentQuestion.optionD"
              >D. {{ currentQuestion.optionD }}</Radio
            >
          </el-radio-group>
        </div>
      </div>
    </div>
    <div class="exam_analy" v-if="type === 'review'">
      <div
        :class="[
          'radio',
          { success: answer === studentAnswer, error: answer != studentAnswer },
        ]"
      >
        你的选择：{{ studentAnswer }}
      </div>
      <div class="answer">正确答案：{{ answer }}</div>
      <div class="analy">
        解析：{{
          "如果DHCP服务器全局地址池中的IP地址与中继设备上连接的客户端的VLANIF接口的IP地址不在同一网段， 则会引起DHCP故障。"
        }}
      </div>
    </div>
    <div class="feedback">
      <el-button type="info" round @click="before" :disabled="!isBefore"
        >上一题</el-button
      >
      <el-button type="primary" round @click="after" :disabled="!isAfter"
        >下一题</el-button
      >
      <el-button
        type="warning"
        round
        @click="impeach"
        v-if="type === 'exercise'"
        >存疑</el-button
      >
    </div>
  </div>
</template>
<script setup>
import { watch, ref } from "vue";
import { useStore } from "vuex";
// import Radio from "../Radio.vue";
const props = defineProps({
  questions: {
    type: Object,
    default: {},
  },
  type: {
    type: String,
    default: "exercise",
  },
});
const store = useStore();
// 所有题目数量
const size = props.questions.length;
// 当前题目信息
const currentQuestion = ref({});
// 题目描述
let questionContent = ref("");
let questionId = ref("0");
// 题目类型
let questionType = ref("选择题");
let questionNumber = ref(`第1 / ${size}题`);
// 当前题目答案
const answer = ref("");
// 学生答案
const studentAnswer = ref("");
const studentMoreAnswer = ref([]);
// 当前题目索引
let index = ref(1);
// 当前题目是否为多选题
const isMoreChoice = ref(false);
// 根据当前题目索引判断题目类型
function changeInfo() {
  studentAnswer.value =
    (currentQuestion.value && currentQuestion.value.stuAnswer) || "";
  answer.value = currentQuestion.value && currentQuestion.value.answer;
  questionContent.value =
    currentQuestion.value && currentQuestion.value.questionContent;
  questionId.value = currentQuestion.value && currentQuestion.value.questionId;
  // 判断是否为判断题
  if (!currentQuestion.value.optionC) questionType.value = "判断题";
  else questionType.value = "单选题";
  // 判断是否有多选题
  if (answer.value.length > 1) {
    isMoreChoice.value = true;
    questionType.value = "多选题";
    if (studentAnswer.value === null || studentAnswer.value === undefined)
      studentMoreAnswer.value = [];
    else studentMoreAnswer.value = studentAnswer.value.split("");
  } else isMoreChoice.value = false;
  console.log("studentAnswer: ", studentAnswer.value);
  console.log("answer: ", answer.value);
}

// 判断是否有上一题或者下一题
const isBefore = ref(false);
const isAfter = ref(true);
watch(
  () => store.getters.getCurrentIndex,
  (currentIndex) => {
    // 判断是否有上下题
    if (currentIndex <= 1) {
      isBefore.value = false;
      isAfter.value = true;
    } else if (currentIndex >= size) {
      isAfter.value = false;
      isBefore.value = true;
    } else {
      isBefore.value = true;
      isAfter.value = true;
    }
    index.value = currentIndex;
    currentQuestion.value = store.getters.getQuestions[currentIndex - 1];
    console.log("currentQuestion: ", currentQuestion.value);
    changeInfo();
    // console.log(stuAnswer.value);
    questionNumber.value = `第${currentIndex} / ${size}题`;
  },
  {
    immediate: true,
  }
);
// 选中选项的回调
function selectOption(value) {
  if (isMoreChoice.value) {
    value = value.sort().join("");
    console.log("value: ", value);
    store.commit("setOneAnswer", {
      index: index.value,
      value,
      questionId: questionId.value,
      status: 1,
    });
  } else
    store.commit("setOneAnswer", {
      index: index.value,
      value,
      questionId: questionId.value,
      status: 1,
    });
}

// 存疑按钮的回调
function impeach() {
  store.commit("setOneStatus", {
    index: index.value,
    status: 2,
  });
}
// 上一题
function before() {
  store.commit("setCurrentIndexBefore");
}
// 下一题
function after() {
  store.commit("setCurrentIndexAfter");
}
</script>
<style lang="less" scoped>
.exam_ques {
  .title {
    display: flex;
    color: darkgray;
    margin-bottom: 20px;
    .question_type {
      margin-right: 10px;
    }
    .question_number {
      margin-left: 10px;
    }
  }
  .question_detail {
    .question_describe {
      margin-bottom: 10px;
    }
    .el-radio-group {
      display: flex;
      flex-flow: column;
    }
    .el-checkbox-group {
      display: flex;
      flex-flow: column;
    }
  }
  .exam_analy {
    margin-top: 20px;
    font-weight: 500;
    font-size: 18px;
    & > div {
      margin: 10px 0;
    }
    .answer {
      color: #faad14;
    }
    .radio.success {
      color: #409eff;
    }
    .radio.error {
      color: #f56c6c;
    }
  }
  .feedback {
    margin-top: 50px;
  }
}
</style>
