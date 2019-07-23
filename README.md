# SelectiveSystem
# 基于JavaWeb的学生选课系统（个人开发）<br>
•	开发软件：idea、tomcat、mysql<br>
•	开发环境：spring、springMVC、Mybatis <br>
•	项目描述：使用java web为核心部位，使用SSM框架。后台传输json。并且设计了安全权限登录问题。前端分为学生端、教师端和管理员端，使用分页功能，优化了大量数据的效率<br>
•	项目功能：<br>
安全权限功能：在前端使用js进行密码加密，后端使用shiro权限管理，并且再次加密密码，使得数据库存储的用户密码为非对称密钥<br>
会话功能：对用户长时间不操作定时下线，防止用户离开被操作，禁止用户不同ip登录，导致用户数据出错<br>
选课功能：教师添加自己信息和给学生选课成绩打分，管理者负责课程、课程老师的选择并且可以修改学生选课成绩和课程，并生成对应选课信息，学生可以选择对应老师对应的课程，并且可以查看选课成绩<br>
***
[image]([https://github.com/chiihero/SelectiveSystem/blob/master/readme/1.png])
[image]([https://github.com/chiihero/SelectiveSystem/blob/master/readme/2.png])
[image]([https://github.com/chiihero/SelectiveSystem/blob/master/readme/3.png])

1. 加密
对于用户的密码进行了加密，为了减轻服务器的负载优化性能，在前端采用了高强度的加密方式使得整体性能需求集中在用户身上，后端采用了较为低强度的加密方式，并且在加密方式使用加盐使得密码更加难以破解，而且整体都是使用单向加密方式，使得密码加密不可逆。
前端
```java
try {
	var shaObj = new jsSHA("SHA3-512", "TEXT", {numRounds: parseInt("4096", 10)});
	shaObj.update(encrypt_str);
	encrypt_str = shaObj.getHash("HEX");
} catch (e) {
	alert(e.message)
}
return hex_md5(encrypt_str);
```
后端
使用了shiro自带的加密模块，在xml文件中定义加密
```xml
<bean id="credentialsMatcher" 
class="org.apache.shiro.authc.credential.HashedCredentialsMatcher">
	<property name="hashAlgorithmName" value="SHA-512"/>
	<property name="hashIterations" value="1024"/>
</bean>
```
2. 权限
采用了shiro，Shiro可以帮助我们完成：认证、授权、加密、会话管理、与Web集成、缓存
在本项目中使用了
2.1.	Authentication
身份认证/登录，验证用户是不是拥有相应的身份；
```java
UsernamePasswordToken upToken = (UsernamePasswordToken) token;
String username = upToken.getUsername();
Admin admin = userService.getAdminInfoById(username);
if (admin == null) {
	throw new UnknownAccountException("没找到帐号");
}
//交给AuthenticatingRealm使用CredentialsMatcher进行密码匹配
SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(
	admin.getAno(),//principal,
	admin.getPassword(),//credentials,
ByteSource.Util.bytes(admin.getAno()),//credentialsSalt,
getName()//realmName
);
```
2.2.	Authorization
授权，即权限验证，验证某个已认证的用户是否拥有某个权限；即判断用户是否能做事情，常见的如：验证某个用户是否拥有某个角色。或者细粒度的验证某个用户对某个资源是否具有某个权限；
```java
String username = (String) principals.getPrimaryPrincipal();
Admin admin = userService.getAdminInfoById(username);//从数据库获取信息
Set<String> roles = new HashSet<>();
if (admin != null) {
	roles.add("admin");//赋予管理员权限
	roles.add("teacher");//赋予教师权限
	roles.add("student");//赋予学生权限
}
SimpleAuthorizationInfo info = new SimpleAuthorizationInfo(roles);
```
2.3.	Session Manager
会话管理，即用户登录后就是一次会话，在没有退出之前，它的所有信息都在会话中；会话可以是普通JavaSE环境的，也可以是如Web环境的；
```xml
<!-- Shiro去掉URL中的JSESSIONID -->
<property name="sessionIdUrlRewritingEnabled" value="false"/>
<property name="globalSessionTimeout" value="1500000"/><!-- 毫秒 -->
<property name="deleteInvalidSessions" value="true"/>
<property name="sessionValidationSchedulerEnabled" value="true"/>
<property name="sessionValidationScheduler" ref="sessionValidationScheduler"/>
<property name="sessionDAO" ref="sessionDAO"/>
<property name="sessionIdCookieEnabled" value="true"/>
<property name="sessionIdCookie" ref="sessionIdCookie"/>
```
2.4.	Cryptography
加密，保护数据的安全性，如密码加密存储到数据库，而不是明文存储；
2.5.	Caching
缓存，比如用户登录后，其用户信息、拥有的角色/权限不必每次去查，这样可以提高效率；
2.6.	Remember Me
记住我，这个是非常常见的功能，即一次登录后，下次再来的话不用登录了。   
2.4.	Realm
可以有1个或多个Realm，可以认为是安全实体数据源，即用于获取安全实体的；可以是JDBC实现，也可以是LDAP实现，或者内存实现等等；由用户提供；在应用中都需要实现自己的Realm；
 
3.	模糊查询、表格显示
在jsp页面设置table控件
```html
<table id="grid-data" class="table table-condensed table-hover table-striped">
    <thead>
    <tr>
        <th data-column-id="sno" data-identifier="true">学号</th>
        <th data-column-id="sname">姓名</th>
        <th data-column-id="ssex">性别</th>
        <th data-column-id="sage">年龄</th>
        <th data-column-id="sdept">系别</th>
        <th data-column-id="commands" data-formatter="commands" data-sortable="false">修改</th>
    </tr>
    </thead>
</table>
```
在js部分设置好就可以通过ajax来获取数据库的数据
```js
 $("#grid-data").bootgrid({
	ajax: true,
	sorting :false,
	post: function () {
		/* To accumulate custom parameter with the request object */
		return {
			// id: "b0df252a-0d64-40e5-5555-c9e93b4befed"
		};
	},
	url: "/admin/AllStudentUser",
	formatters: {
		"commands": function (column, row) {
			return "<button type=\"button\"  class=\"btn btn-info\" data-row-id=\"" + row.sno + "\" onclick=\"window.location.href='/admin/StudentInfo?sno=" + row.sno + "'\"><span class=\"fa fa-pencil\"></span>ÐÞ¸Ä</button>";
		}
	}
});
```
4.	报表
本程序使用的是在前端使用js的方式生成报表，而不是后端生成。前端通过使用tableExport来实现出报表功能，我们通过调用js语句去触发
```js
$(".table").tableExport({
        type:'xlsx',
        fileName:tableTitle+"_"+getNowFormatDate(),
        ignoreColumn:[length],
        bootstrap: true,
});
```
而且在其中我们可以设置许多自定义的设置，包括了标题、格式、行数、列数、文件名等等的设置。
4.	前端与后端的通信
4.1.	前端
第一种使用了form表单方式传递数据
```html
<form id="loginform" action="/login/signIn" method="post">
<input type="text" class="form-control" id="username" name="username" placeholder="请输入学号">
<input type="password" class="form-control" id="password" name="password" placeholder="请输入5~24位密码"/>
</form>
```
第二种采用了ajax的方法，这是一种异步传输方式，可以只刷新局部页面，可以大大的减少页面资源的消耗
```js
$.ajax({
	url: URL,
	aysnc: false,
	type: TYPE,
	contentType: "application/json; charset=utf-5",
	data: PARAMS,
	success: function (data) {
		// return data;
		return true;
	},
	error: function (XMLHttpRequest, textStatus, errorThrown) {
		alert("请求失败，消息：" + textStatus + "  " + errorThrown);
		return false;
	}
});
```
4.2.	后端
在 Spring MVC 应用程序中，RequestDispatcher (在 Front Controller 之下) 这个 servlet 负责将进入的 HTTP 请求路由到控制器的处理方法。
@RequestMapping()使用注解的方式可以将特定的请求或者请求模式映射到控制器上，然后通过简单的实体类获取前端发送的信息。
后端给前端数据的方式：
1.	通过Model（org.springframework.ui.Model），它是一个接口，包含addAttribute方法，其实现类是ExtendedModelMap。通过这个方法我们可以赋值进去，例如model.addAttribute("message", "用户名或密码错误");
在jsp页面上通过${ message }就可以获取到对应的值
2.	session，通过session这个会话级的方式传递需要的数据，通过注解的方式将model的值放进session上，例如@SessionAttributes({"message "})//放到Session属性列表中，以便这个属性可以跨请求访问
在jsp页面上通过${sessionScope.username}

5.3 数据库与后端
这里使用了mybatis的框架，MyBatis 是支持定制化 SQL、存储过程以及高级映射的持久层框架，其主要就完成封装JDBC操作和利用反射打通Java类与SQL语句之间的相互转换。
前端通过调用请求get或者post触发映射到控制器上，控制器通过调用写好的mapper方法操作数据库，而mapper是mybatis的方法映射文件，对应的xml文件可以书写具体的sql语句控制数据库的增删查改
```java
public interface StudentMapper {
int insert(Student record);
}
```
```xml
<insert id="insert" parameterType="com.chii.www.pojo.Student">
    insert into student (sno, sname, ssex, sage, sdept,password)
    values (#{sno,jdbcType=CHAR},
            #{sname,jdbcType=VARCHAR},
            #{ssex,jdbcType=CHAR},
            #{sage,jdbcType=INTEGER},
            #{sdept,jdbcType=VARCHAR},
            #{password,jdbcType=VARCHAR})
</insert>
```