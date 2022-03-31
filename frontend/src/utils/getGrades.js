export function getGrades(questions) {
  const size = questions.length;
  let correctSize = 0;
  let score = 0;
  let totalScore = 0;
  questions.forEach((item) => {
    if (item.stuAnswer === item.answer) {
      item.status = 1;
      correctSize++;
      score += item.score;
    } else if (isSubAnswer(item.answer, item.stuAnswer)) item.status = 2;
    else item.status = 3;
    totalScore += item.score;
  });
  return {
    correctSize,
    errorSize: size - correctSize,
    score,
    totalScore,
  };
}
// 判断多选题答案包含关系
function isSubAnswer(answer, stuAnswer) {
  // console.log("stuAnswer: ", stuAnswer);
  if (stuAnswer === undefined || stuAnswer === null) return false;
  for (const c of stuAnswer) if (answer.indexOf(c) === -1) return false;
  return true;
}

// 提交前将数组中对象改为
// interface question{
//     questionId: String,
//     answer: String
// }

export function convertQuestions(questions) {
  const submitQuestions = [];
  questions.forEach((question) => {
    const questionId = question.questionId;
    const stuAnswer = question.stuAnswer;
    submitQuestions.push({
      questionId,
      stuAnswer,
    });
  });
  console.log("submitQuestions: ", submitQuestions);
  return submitQuestions;
}
