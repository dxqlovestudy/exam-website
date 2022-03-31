import { createStore } from "vuex";

const store = createStore({
  state() {
    return {
      questions: [],
      currentIndex: 1,
      hasAnswer: 0,
      endTime: 0,
      // 卷子回顾
      // 当前题目正确与否
      currentBoolean: null,
      startTime: 0, // 考试开始时间
      totalTime: 0,
    };
  },
  getters: {
    getHasAnswer(state) {
      return state.hasAnswer;
    },
    getCurrentBoolean(state) {
      return state.currentBoolean;
    },
    getCurrentIndex(state) {
      return state.currentIndex;
    },
    getQuestions(state) {
      return state.questions;
    },
    getStartTime(state) {
      return state.startTime;
    },
    getTotalTime(state) {
      return state.totalTime;
    },
    getEndTime(state) {
      return state.endTime;
    },
  },
  mutations: {
    setTotalTime(state, totalTime) {
      state.totalTime = totalTime;
    },
    setStartTime(state, startTime) {
      state.startTime = startTime;
    },
    setEndTime(state, endTime) {
      state.endTime = endTime;
    },
    setHasAnswer(state, hasAnswer) {
      state.hasAnswer = hasAnswer;
    },
    setQuestions(state, questions) {
      state.questions = questions;
    },
    setOneAnswer(state, payload) {
      const question = state.questions[payload.index - 1];
      // console.log("question: ", question);
      if (
        question.stuAnswer === null &&
        state.hasAnswer < state.questions.length &&
        question.questionId === payload.questionId
      )
        state.hasAnswer++;
      question.stuAnswer = payload.value;
      question.status = payload.status;
    },
    setOneStatus(state, payload) {
      state.questions[payload.index - 1].status = payload.status;
    },
    setCurrentIndex(state, payload) {
      state.currentIndex = payload;
    },
    setCurrentIndexBefore(state) {
      if (state.currentIndex <= 1) return;
      state.currentIndex -= 1;
    },
    setCurrentIndexAfter(state) {
      if (state.currentIndex >= state.questions.length) return;
      state.currentIndex += 1;
    },
    setCurrentBoolean(state, currentBoolean) {
      state.currentBoolean = currentBoolean;
    },
    clear(state) {
      state.currentIndex = 1;
      state.hasAnswer = 0;
    },
  },
});

export default store;
