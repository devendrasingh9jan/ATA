<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h2>Payment</h2>
    <form:form action="/payment/submit" method="POST" modelAttribute="paymentForm">
        <div class="form-group">
            <label for="amount">Amount</label>
            <form:input path="amount" id="amount" class="form-control" required="true" />
        </div>
        <div class="form-group">
            <label for="cardNumber">Card Number</label>
            <form:input path="cardNumber" id="cardNumber" class="form-control" required="true" />
        </div>
        <div class="form-group">
            <label for="expiryDate">Expiry Date</label>
            <form:input path="expiryDate" id="expiryDate" class="form-control" required="true" />
        </div>
        <div class="form-group">
            <label for="cvv">CVV</label>
            <form:input path="cvv" id="cvv" class="form-control" required="true" />
        </div>
        <button type="submit" class="btn btn-primary">Pay</button>
    </form:form>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
