## 一、项目预览地址

- #### vue+node 后台管理预览地址：<a href="http://vuenode.yknba.cn/" target="_blank">点击进入效果预览</a>

- 默认账号：admin

- 默认密码：666666

## 二、项目启动

- ### 前端页面启动

1. ##### #克隆项目

   ```
   git clone https://github.com/Sobossy/Vue_Admin.git
   ```

2. ##### #进入目录

   ```
   cd item
   ```

3. ##### #安装依赖（建议使用 node 版本 16 以下 10 以上）

   ```
   npm install
   ```

4. ##### #启动项目

   ```
   npm run dev
   ```

- ### 数据库导入

1. ##### #创建数据库

   1. 创建数据库 名：**vue_admin**
   2. 基字符集 选：默认（default） 或者 utf8
   3. 排序规则 选：默认（default） 或者 utf8_general_ci

2. ##### #导入数据库

   1. 将 APP/数据库 文件夹的 vue_admin.sql 导入新建的 vue_admin 库中。

3. ##### #数据库配置信息

   ```
   //配置文件在APP/poo.js 中，请根据自身环境配置
   const pool=mysql.createPool({
   	host:"127.0.0.1",
   	port:3306,//端口
   	user:"root",//账户名
   	password:"root",//登录密码
   	database:"vue_admin",//数据库名称
   	connectionLimit:15
   });
   ```

- ### 后端服务启动

1. ##### #克隆项目（如果已经执行了前端页面启动的克隆，可略过这点）

   ```
   git clone https://github.com/Sobossy/Vue_Admin.git
   ```

2. ##### #进入目录

   ```
   cd APP
   ```

3. ##### #安装依赖

   ```
   npm install
   ```

4. ##### #启动服务

   ```
   npm run dev
   ```

## 三、功能简明

- #### 前端功能

  > - [x]     ​			***动态路由***
  > - [x] ​ **_菜单管理_**
  > - [x] ​ **_用户管理_**
  > - [x] ​ **_角色管理_**
  > - [x] ​ **_多账号管理_**
  > - [x] ​ **_字典管理_**
  > - [x] ​ **_主题自定义_**
  > - [x] ​ **_菜单权限_**
  > - [x] ​ **_角色权限_**

- #### 后端功能

  > - [x]     ​			***jsonwebtoken（token）***
  > - [x] ​ **_菜单权限拦截_**
  > - [x] ​ **_角色权限拦截_**
  > - [x] ​ **_错误日志 log`_**

## 四、效果截图

![登录](https://foruda.gitee.com/images/1681197680240561436/dfbf1881_8986810.png '登录.png')  
| ![用户管理](https://foruda.gitee.com/images/1681197937191145993/c434e92e_8986810.png '用户管理.png') | ![主题修改](https://foruda.gitee.com/images/1681263456631597583/3077263f_8986810.png '主题修改.png') |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| ![菜单管理](https://foruda.gitee.com/images/1681197808163981644/96f27575_8986810.png '菜单管理.png') | ![菜单修改](https://foruda.gitee.com/images/1681197825348384952/281da67c_8986810.png '菜单修改.png') |
| ![角色管理](https://foruda.gitee.com/images/1681197773630264222/4ec415e3_8986810.png '角色管理.png') | ![字典管理](https://foruda.gitee.com/images/1681197948454663203/788cbd7e_8986810.png '字典管理.png') |
