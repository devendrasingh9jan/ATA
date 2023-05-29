<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="sat, 01 Dec 2001 00:00:00 GMT">
<title>ATA</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
</head>
<style>

        body{
            content: '';
            position: fixed;
            width: 100vw;
            height: 100vh;
            background-position: center center;
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;
			background-color: #efefef;
        }


.container{
height: 100%;
align-content: center;
}

  input {
    font-size: 1.05em;
    font-weight: 300;
    margin-top: 18px;
    padding: 8px 8px;
    width: 288px;
    margin-left: 70px;
  }
  .input-group-text{

    padding: 10px 10px;
    margin-top: 19px;
    margin-left: 35px;
    position: absolute;


  }
  .card-footer{
    font-size: 1.05em;
    font-weight: 300;
    margin-top: 18px;
    padding: 5px 5px;
    width: 288px;
    margin-left: 100px;
  }
  .btn float-right login_btn{
  	padding: 5px 5px;
    width: 288px;
    margin-left: 70px;
  }

.card{
height: 370px;
margin-top: 100px;
margin-left: 480px;
width: 400px;
background-color: rgba(0,0,0,0.5) !important;
}

.card-header h1{
color: white;
margin-left: 15px;
margin-bottom: 18px;
position:relative;
}



input:focus{
outline: 0 0 0 0  !important;
box-shadow: 0 0 0 0 !important;

}

.remember{
color: white;
margin-left: 25px;
}

.remember input
{
width: 20px;
height: 20px;
margin-left: 15px;
margin-right: 5px;
}

.login_btn{
color: black;
background-color: #28a745;
width: 100px;
margin-left: 270px;
}

.login_btn:hover{
color: black;
background-color: white;
}

.links{
color: white;
}

.links a{
margin-left: 10px;
color: #28a745;
}
/* ANIMATIONS */

/* Simple CSS3 Fade-in-down Animation */
.fadeInDown {
  -webkit-animation-name: fadeInDown;
  animation-name: fadeInDown;
  -webkit-animation-duration: 1s;
  animation-duration: 1s;
  -webkit-animation-fill-mode: both;
  animation-fill-mode: both;
}

@-webkit-keyframes fadeInDown {
  0% {
    opacity: 0;
    -webkit-transform: translate3d(0, -100%, 0);
    transform: translate3d(0, -100%, 0);
  }
  100% {
    opacity: 1;
    -webkit-transform: none;
    transform: none;
  }
}

@keyframes fadeInDown {
  0% {
    opacity: 0;
    -webkit-transform: translate3d(0, -100%, 0);
    transform: translate3d(0, -100%, 0);
  }
  100% {
    opacity: 1;
    -webkit-transform: none;
    transform: none;
  }
}

/* Simple CSS3 Fade-in Animation */
@-webkit-keyframes fadeIn { from { opacity:0; } to { opacity:1; } }
@-moz-keyframes fadeIn { from { opacity:0; } to { opacity:1; } }
@keyframes fadeIn { from { opacity:0; } to { opacity:1; } }

.fadeIn {
  opacity:0;
  -webkit-animation:fadeIn ease-in 1;
  -moz-animation:fadeIn ease-in 1;
  animation:fadeIn ease-in 1;

  -webkit-animation-fill-mode:forwards;
  -moz-animation-fill-mode:forwards;
  animation-fill-mode:forwards;

  -webkit-animation-duration:1s;
  -moz-animation-duration:1s;
  animation-duration:1s;
}

.fadeIn.first {
  -webkit-animation-delay: 0.4s;
  -moz-animation-delay: 0.4s;
  animation-delay: 0.4s;
}

.fadeIn.second {
  -webkit-animation-delay: 0.6s;
  -moz-animation-delay: 0.6s;
  animation-delay: 0.6s;
}

.fadeIn.third {
  -webkit-animation-delay: 0.8s;
  -moz-animation-delay: 0.8s;
  animation-delay: 0.8s;
}

.fadeIn.fourth {
  -webkit-animation-delay: 1s;
  -moz-animation-delay: 1s;
  animation-delay: 1s;
}

/* Simple CSS3 Fade-in Animation */
.underlineHover:after {
  display: block;
  left: 0;
  bottom: -10px;
  width: 0;
  height: 2px;
  background-color: #56baed;
  content: "";
  transition: width 0.2s;
}

.underlineHover:hover {
  color: #0d0d0d;
}

.underlineHover:hover:after{
  width: 100%;
}



/* OTHERS */

*:focus {
    outline: none;
} 

#icon {
  width:60%;
}

.errorblock {
	color: #ff0000;
	margin-left: 100px;
}

</style>
<body>
<div class="wrapper fadeInDown">
<div class="container">
	<div class="d-flex justify-content-center h-100">
		<div class="card">
			<div class="card-header">
				<h1>Sign In</h1>
			</div>
			<div class="card-body">
				 <%
		String errorString = (String) request.getAttribute("error");
		if (errorString != null && errorString.trim().equals("true")) {
			out.println("<span class=\"errorblock\"><b>Incorrect Credentials.Please try again</b>");
		}
	%> 
			
				<form name='loginForm' action="/authenticate" method='POST'  modelAttribute="user">
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fa fa-user"></i></span>
						</div>
						<input type="text" name='username' class="form-control" placeholder="Email">
						
					</div>
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fa fa-key"></i></span>
						</div>
						<input type="password" name='password'class="form-control" placeholder="Password">
					</div>
					<div class="row align-items-center remember">
						<input type="checkbox">Remember Me
					</div>
					<div class="form-group">
						<input type="submit" value="submit" name="submit" class="btn float-right login_btn" />
					</div>
				</form>
			</div>
			<div class="card-footer">
				<div class="d-flex justify-content-center links">
					Don't have an account?<a href="/registration" style="text-decoration:none"><b>Sign Up</b></a>
				</div>
				<div class="d-flex justify-content-center links">
					<a href="/forgetPassword" style="text-decoration:none"><b>Forgot your password?</b></a>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
</body>
</html>