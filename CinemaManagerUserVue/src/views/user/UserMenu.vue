<!--
 * @Description: 
 * @Author: Rabbiter
 * @Date: 2023-02-24 18:08:34
-->
<template>
    <el-container>
        <el-aside width="200px">
            <div style="margin: 5px 5px 5px 20px; font-size: 26px">
                <i class="iconfont icon-r-user1" style="font-size: 32px"> </i
                >个人中心
            </div>
            <el-menu
                :default-active="$route.path"
                class="el-menu-vertical-demo"
                :router="true"
            >
                <el-menu-item
                    :index="item.path"
                    v-for="item in menuList"
                    :key="item.id"
                >
                    <i :class="item.icon" style="font-size: 30px"> </i>
                    <b style="font-size: 22px"> {{ item.name }}</b>
                </el-menu-item>
            </el-menu>
        </el-aside>
        <el-main>
            <router-view></router-view>
        </el-main>
    </el-container>
</template>
<script>
export default {
    name: "UserMenu",
    data() {
        return {
            url: "",
            menuList: [
                {
                    id: 1,
                    name: "基本信息",
                    path: "/user",
                    icon: "iconfont icon-r-paper",
                },
                {
                    id: 2,
                    name: "我的订单",
                    path: "/bill",
                    icon: "iconfont icon-r-shield",
                },
            ],
        };
    },
};
</script>

<style scoped>
.el-container {
    border: 1px solid #e1e1e1;
    width: 1200px;
    margin: 0 auto;
}

.el-aside h1 {
    margin-left: 25%;
    font-size: 24px;
}
</style>
