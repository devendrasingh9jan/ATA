<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="/js1/darkmode-js.min.js"></script>
<link rel="stylesheet" type="text/css" href="/css1/bootstrap.min.css" />
<script type="text/javascript" src="/js1/jquery.min.js"></script>
<script type="text/javascript" src="/js1/popper.min.js"></script>
<script type="text/javascript" src="/js1/bootstrap.min.js"></script>
<title>ATA</title>
<style>
body {
	background: #C5E1A5;
}

form {
	width: 60%;
	margin: 60px auto;
	background: #efefef;
	padding: 60px 120px 80px 120px;
	text-align: center;
	-webkit-box-shadow: 2px 2px 3px rgba(0, 0, 0, 0.1);
	box-shadow: 2px 2px 3px rgba(0, 0, 0, 0.1);
}

label {
	display: block;
	position: relative;
	margin: 40px 0px;
}

.label-txt {
	position: absolute;
	top: -1.6em;
	padding: 10px;
	font-family: sans-serif;
	font-size: .8em;
	letter-spacing: 1px;
	color: rgb(120, 120, 120);
	transition: ease .3s;
}

.input {
	width: 100%;
	padding: 10px;
	background: transparent;
	border: none;
	outline: none;
}

.line-box {
	position: relative;
	width: 100%;
	height: 2px;
	background: #BCBCBC;
}

.line {
	position: absolute;
	width: 0%;
	height: 2px;
	top: 0px;
	left: 50%;
	transform: translateX(-50%);
	background: #8BC34A;
	transition: ease .6s;
}

.input:focus+.line-box .line {
	width: 100%;
}

.label-active {
	top: -3em;
}
</style>
</head>

<body onload='document.form.username.focus()'>
	<br>
	<h3 align="center">Register New User</h3>

	<div id="registerEmployee">
		<form:form name="form" action="/register" method="POST" modelAttribute="user">
			<input type="hidden" value="${dbUser}" id="dbuser">
			<label>
				<p class="label-txt">ENTER EMAIL</p><br> <form:input path="username"
					id="username" placeholder="abcd.xyz@gmail.com" class="input"
					required="required" />
				<div class="line-box">
					<div class="line"></div>
				</div>
			</label>

			<label>
				<p class="label-txt">ENTER PASSWORD</p><br> <form:input path="password" type="password"
					class="input" required="required" />
				<div class="line-box">
					<div class="line"></div>
				</div>
			</label>

			<input type="submit" value="Submit"
				onclick="ValidateEmail(document.form.username);" />
		</form:form>
	</div>
	<script>
		function ValidateEmail(inputText) {
			var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
			if (inputText.value.match(mailformat)) {
				user = document.getElementById("username").value;
				user_domain = user.endsWith(".com");
				dbuser = document.getElementById("dbuser").value;
				checkuser = dbuser.includes(user)
				document.form.username.focus();
				if (checkuser == true) {
					alert("UserId Already Exists");
					return false;
				}
				if (user_domain == true) {
					return true;
				} else {
					alert("Email Id should ends with .com");
					return false;
				}

			} else {
				alert("Invalid Email Address!");
				document.form.username.focus();
				return false;
			}
		}

</script>
</body>
</html>
