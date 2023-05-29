<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<style>
		.form-gap {
			padding-top: 70px;
		}

		input {
			padding: 8px 8px;
			width: 288px;
			margin-left: 10px;
		}
	</style>
	<title>ATA</title>
</head>
<body>
<div class="form-gap"></div>
<div align="center" class="container">
	<div class="">
		<div class="col-sm-4 col-md-offset-4">
			<form:form name="form" method="POST" action="/changePassword" modelAttribute="user">
				<input type="hidden" id="username" name="username" value="${user.username}" />
				<label><b>New Password</b></label>
				<div class="form-group pass_show">
					<input type="password" value="" class="form-control" required="required" name="password1"
						   id="password1" placeholder="New Password">
				</div>
				<br>
				<label><b>Confirm Password</b></label>
				<div class="form-group pass_show">
					<input type="password" value="" class="form-control" required="required" name="confirm_password"
						   id="confirm_password" placeholder="Confirm Password">
				</div>
				<br>
				<div class="form-group">
					<input name="recover-submit" class="btn btn-lg btn-primary btn-block" value="Reset Password"
						   onclick="checkPassword()" type="button">
				</div>
			</form:form>
		</div>
	</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript">
	function checkPassword() {
		var username = document.getElementById("username").value;
		var password1 = document.getElementById("password1").value;
		var password2 = document.getElementById("confirm_password").value;

		// If password not entered
		if (password1 == '')
			alert("Please enter Password");

		// If confirm password not entered
		else if (password2 == '')
			alert("Please enter confirm password");

		// If passwords do not match
		else if (password1 != password2) {
			alert("Password did not match: Please try again...");
		}

		// If passwords match, send the form
		else {

			var formData = new FormData();
			formData.append("username", username);
			formData.append("password", password1);

			fetch("/changePassword", {
				method: "POST",
				body: formData
			})
					.then(response => {
						if (response.ok) {
							alert("Password updated successfully");
							// Handle the response or redirect to a new page
						} else {
							console.error("Failed to create user");
							// Handle the error
						}
					})
					.catch(error => {
						console.error("Error:", error);
						// Handle the error
					});
		}
	}
</script>

</body>
</html>
