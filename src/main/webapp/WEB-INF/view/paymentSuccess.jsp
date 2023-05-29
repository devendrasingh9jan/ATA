<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Success</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
<form:form name="form" action="${pageContext.request.contextPath}/passenger/status" modelAttribute="bookingId">
    <h2>Payment Success</h2>
    <p>Thank you for your payment!</p>
    <p>Your payment has been successfully processed.</p>
    <p>Booking ID: ${bookingId}</p>
    <p>For any inquiries, please contact our support team.</p>
    <button type="submit" class="btn btn-primary">Status</button>
</form:form>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
