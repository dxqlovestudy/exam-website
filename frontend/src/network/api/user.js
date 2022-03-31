import axios from "../index";
export function studentLogin(account, password, identity) {
  return axios.post("/login", {
    account,
    password,
    identity,
  });
}

export function getExerciseQuestions(questionNum = 100) {
  return axios.post("/exercise/random", {
    questionNum,
  });
}

export function submitExercise(questionAnswers, totalTime, examId) {
  return axios.post("/exercise/submit", {
    questionAnswers,
    totalTime,
    examId,
  });
}

export function beforeunload() {
  return axios.post("http://localhost:8888/submit/exit");
}

// 考试中途退出
export function exerciseExit(questions) {
  console.log("exerciseExit=================>");
  return fetch("http://localhost:8888/submit/exit", {
    method: "POST",
    body: JSON.stringify(questions),
    headers: { "Content-Type": "application/json" },
    keepalive: true,
  });
  const formData = new FormData();
  formData.append("name", JSON.stringify(questions.value));
  window.navigator.sendBeacon("http://localhost:8888//api/exercise/submit", formData);
}

// 获取更改后的卷子
export function getExerciseReview(examId) {
  return axios.get(`exercise/question/info/${examId}`);
}

// 获取该学生考试列表
export function getExamList() {
  return axios.get("exercise/exam/info");
}
