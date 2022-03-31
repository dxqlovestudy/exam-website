<template>
  <div class="radio">
    <span class="radio_input">
      <span
        class="radio_inner"
        :class="{ success: props.success, error: props.error }"
      ></span>
    </span>
    <span
      class="radio_label"
      :class="{ success: props.success, error: props.error }"
      ><slot></slot
    ></span>
  </div>
</template>
<script setup>
const props = defineProps({
  success: {
    type: Boolean,
    default: false,
  },
  error: {
    type: Boolean,
    default: false,
  },
});
</script>
<style lang="less" scoped>
.radio {
  color: #606266;
  font-weight: 500;
  position: relative;
  cursor: pointer;
  align-items: center;
  white-space: nowrap;
  outline: 0;
  font-size: 14px;
  user-select: none;
  margin-right: 30px;
  height: 40px;
  .radio_input {
    white-space: nowrap;
    cursor: pointer;
    outline: 0;
    display: inline-flex;
    position: relative;
    vertical-align: middle;
    .radio_inner {
      border: 1px solid #dcdfe6;
      border-radius: 100%;
      width: 14px;
      height: 14px;
      position: relative;
      cursor: pointer;
      display: inline-block;
      box-sizing: border-box;
    }
    .radio_inner::after {
      width: 4px;
      height: 4px;
      border-radius: 50%;
      background-color: #fff;
      content: "";
      position: absolute;
      left: 50%;
      top: 50%;
      transform: translate(-50%, -50%) scale(1);
    }
    .radio_inner.success {
      border-color: #409eff;
      background: #409eff;
    }
    .radio_inner.error {
      border-color: #f56c6c;
      background: #f56c6c;
    }
  }
  .radio_label {
    font-size: 14px;
    padding-left: 10px;
  }
  .radio_label.success {
    color: #409eff;
  }
  .radio_label.error {
    color: #f56c6c;
  }
}
</style>
