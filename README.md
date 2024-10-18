## 影响力
### 本地部署

前端：
- 在终端中打开`CinemaManagerUserVue/CinemaManagerAdminVue`，执行`npm install`
- 下载完依赖项后，执行`npm run-script serve`，即可看到前端的入口：
```
  App running at:
  - Local:   http://localhost:9232/ 
  - Network: http://192.168.1.107:9232/
```

后端：
- 新建数据库`cinema_manager`，导入`CinemaManagerApi/cinema_manager.sql`
- 在`CinemaManagerApi/src/main/resources/application.yml`中修改数据库的用户名与密码
- 确保数据库已连接，运行`CinemaManagerApi/src/main/java/com/rabbiter/cm/CinemaManagerApplication.java`
- 此时终端若无报错，前端页面应正常显示电影封面等数据