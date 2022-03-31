<template>
  <div>
    <el-form ref="formRef" :model="form" :rules="rules" label-width="120px">
      <el-form-item label="题目描述" prop="description">
        <el-input v-model="description"></el-input>
      </el-form-item>
      <el-form-item label="所属知识点" prop="knowledge" class="konwledge">
        <el-input v-model="knowledge"></el-input>
      </el-form-item>
      <el-form-item label="题目难度" prop="difficulty">
        <el-select v-model="difficulty" placeholder="请选择题目难度">
          <el-option label="简单" value="简单"></el-option>
          <el-option label="中等" value="中等"></el-option>
          <el-option label="困难" value="困难"></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="正确答案" prop="answer">
        <el-select v-model="answer" placeholder="请选择正确答案">
          <el-option
            v-for="item in alphabet.slice(0, currentIndex + 1)"
            :key="item"
            :label="item"
            :value="item"
          ></el-option>
        </el-select>
      </el-form-item>
      <el-form-item
        v-for="(answer, index) in answers"
        :key="answer.key"
        :label="'选项' + answer.option"
        :prop="'answers.' + index + '.value'"
        :rules="{
          required: true,
          message: '请输入选项描述',
          trigger: 'blur',
        }"
      >
        <el-input v-model="answer.value"></el-input>
      </el-form-item>
      <div class="btns">
        <el-button @click="addAnswer" v-show="currentIndex < alphabetSize - 1"
          >新增选项</el-button
        >
        <el-button @click="removeAnswer">删除最后一项</el-button>
        <el-button @click="onSubmit" type="primary">提交</el-button>
      </div>
    </el-form>
  </div>
</template>
<script setup>
import { reactive, ref, toRaw } from "vue";
import axios from "axios";
const difficulty = ref("");
const answer = ref("");
const description = ref("");
const answers = reactive([
  {
    key: "A",
    value: "",
    option: "A",
  },
  {
    key: "B",
    value: "",
    option: "B",
  },
  {
    key: "C",
    value: "",
    option: "C",
  },
  {
    key: "D",
    value: "",
    option: "D",
  },
]);
// 所属知识点
const knowledge = ref("");
const form = reactive({
  description,
  difficulty,
  answers,
  answer,
  knowledge,
});
const rules = {
  description: [
    {
      required: true,
      message: "请输入题目描述",
      trigger: "blur",
    },
  ],
  knowledge: [
    {
      required: true,
      message: "请输入知识点分类",
      trigger: "blur",
    },
  ],
};
// 选项
const alphabet = ["A", "B", "C", "D", "E", "F"];
const alphabetSize = ref(alphabet.length);
const formRef = ref();
function onSubmit() {
  formRef.value.validate(async (valid) => {
    if (valid) {
      console.log("submit!");
      postData();
    } else {
      console.log("error!");
    }
  });
  // console.log(form.description);
  // console.log(form.difficulty);
  // console.log(toRaw(answers));
  // console.log(form.answer);
}
let currentIndex = ref(3);
function removeAnswer() {
  answers.pop();
  currentIndex.value--;
}
function addAnswer() {
  answers.push({
    key: alphabet[currentIndex.value + 1],
    value: "",
    option: alphabet[currentIndex.value + 1],
  });
  currentIndex.value++;
}
//3/31添加，目的向后端传试题库，未完成
function postData() {
  let params = {
    "analyse":description,
    "ansNum": alphabetSize,
    "answer": answer,
    "optionA": answers['A'],
    "optionB": answers['B'],
    "optionC": answers['C'],
    "optionD": answers['D'],
    "optionE": answers['E'],
    "optionF": answers['F'],
    "optionG": answers['G'],
    // questionContent: knowledge,
    "questionContent": knowledge,
    "topics": [1]
  };
  let vm = this;
  axios.post(
      "http://localhost:8080/api/addQuestion/addSysQuestion",
      JSON.stringify(params),
      {
        headers: {
          'token':eyJhbGciOiJIUzUxMiJ9.eyJleHAiOjE2NDg2OTE4ODksInVzZXJJZCI6IjE0NzQ2NTI4Nzg4ODU5NzgxMTQiLCJpYXQiOjE2NDg2MDU0ODl9.Q2Ww1RHLhE1pwInOydegJO95Mwco5nKrgQ9xqWpHE1IGBMdAKOy4SSmD7uRhubfVvxjO9YiiUiToG9X9TBsKhg,
        },
        body: {
          params
        }
      }
  )
  .then(function (response){
    console.log(response)//成功
  })
  .then(function (error){
    console.log(error)
  })

}
</script>
<style lang="less" scoped>
.konwledge {
  :deep(.el-input) {
    width: 200px;
  }
}
</style>
