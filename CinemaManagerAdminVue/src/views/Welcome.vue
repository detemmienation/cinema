<!--
 * @Description: 
 * @Author: Rabbiter
 * @Date: 2023-02-24 18:08:34
-->
<template>
    <div id="welcome">
        <!-- <div style="width: 100%;height: 60px;">
      <h1 style="font-size: 32px;"></h1>
    </div> -->
        <div id="bk">欢迎访问影院管理后台</div>
    </div>
</template>

<script>
export default {
    name: "Welcome",
};
</script>

<style scoped>
#welcome {
    background: url("../assets/welcome.jpg");
    background-size: cover;
    height: 100%;
    width: 100%;
}
#bk {
    color: black;
    margin: 0;
    text-align: center;
    font-size: 36px;
    padding-top: 100px;
}
</style>