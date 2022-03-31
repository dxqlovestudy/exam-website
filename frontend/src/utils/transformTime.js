import moment from "moment";
function getString(t) {
  t = parseInt(t);
  let m = "";
  if (t > 0) {
    if (t < 10) {
      m = "0" + t;
    } else {
      m = t + "";
    }
  } else {
    m = "00";
  }
  return m;
}

// 转化时间格式
export function format(t) {
  console.log(t);
  if (t < 60000) {
    return (t % 60000) / 1000 + "秒";
  } else if (t >= 60000 && t < 3600000) {
    return (
      getString((t % 3600000) / 60000) + ":" + getString((t % 60000) / 1000)
    );
  } else {
    return (
      getString(t / 3600000) +
      ":" +
      getString((t % 3600000) / 60000) +
      ":" +
      getString((t % 60000) / 1000)
    );
  }
}

export function timestamp(t) {
  return moment(t).format("MMMM Do YYYY, hh:mm:ss a");
}

export function formatMsgTime(timespan) {
  var dateTime = new Date(timespan); // 将传进来的字符串或者毫秒转为标准时间
  var year = dateTime.getFullYear();
  var month = dateTime.getMonth() + 1;
  var day = dateTime.getDate();
  var hour = dateTime.getHours();
  var minute = dateTime.getMinutes();
  // var second = dateTime.getSeconds()
  var millisecond = dateTime.getTime(); // 将当前编辑的时间转换为毫秒
  var now = new Date(); // 获取本机当前的时间
  var nowNew = now.getTime(); // 将本机的时间转换为毫秒
  var milliseconds = 0;
  var timeSpanStr;
  milliseconds = nowNew - millisecond;
  if (milliseconds <= 1000 * 60 * 1) {
    // 小于一分钟展示为刚刚
    timeSpanStr = "刚刚";
  } else if (1000 * 60 * 1 < milliseconds && milliseconds <= 1000 * 60 * 60) {
    // 大于一分钟小于一小时展示为分钟
    timeSpanStr = Math.round(milliseconds / (1000 * 60)) + "分钟前";
  } else if (
    1000 * 60 * 60 * 1 < milliseconds &&
    milliseconds <= 1000 * 60 * 60 * 24
  ) {
    // 大于一小时小于一天展示为小时
    timeSpanStr = Math.round(milliseconds / (1000 * 60 * 60)) + "小时前";
  } else if (
    1000 * 60 * 60 * 24 < milliseconds &&
    milliseconds <= 1000 * 60 * 60 * 24 * 15
  ) {
    // 大于一天小于十五天展示位天
    timeSpanStr = Math.round(milliseconds / (1000 * 60 * 60 * 24)) + "天前";
  } else if (
    milliseconds > 1000 * 60 * 60 * 24 * 15 &&
    year === now.getFullYear()
  ) {
    timeSpanStr = month + "-" + day + " " + hour + ":" + minute;
  } else {
    timeSpanStr = year + "-" + month + "-" + day + " " + hour + ":" + minute;
  }
  return timeSpanStr;
}
