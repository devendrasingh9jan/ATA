<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vehicle Booking</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <jsp:include page="headerUser.jsp"></jsp:include>
    <br><br><br>
    <h2>Vehicle Booking</h2>
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <label for="source">Source</label>
                    <input type="text" class="form-control" id="source" name="source" value="${passenger.booking.vehicle.source}" readonly>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label for="destination">Destination</label>
                    <input type="text" class="form-control" id="destination" name="destination" value="${passenger.booking.vehicle.destination}" readonly>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <label for="plateNo">Vehicle Plate No</label>
                    <input type="text" class="form-control" id="plateNo" name="plateNo" value="${passenger.booking.vehicle.plateNo}" readonly>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label for="paidAmount">Payable Amount</label>
                    <input type="text" class="form-control" id="paidAmount" name="paidAmount" value="${passenger.booking.vehicle.price}" readonly>
                </div>
            </div>
        </div>
    </div>

    <form:form name="form" action="${pageContext.request.contextPath}/payment/pay" method="post" modelAttribute="passenger">
        <div class="form-group">
            <label for="name">Name</label>
            <input type="text" class="form-control" id="name" name="name" placeholder="Enter your name" required>
        </div>
        <div class="form-group">
            <label for="age">Age</label>
            <input type="text" class="form-control" id="age" name="age" placeholder="Enter your age" required>
        </div>
        <label>Card Details:</label>
        <div class="form-group">
            <label for="cardNumber">Card Number</label>
            <input type="text" class="form-control" id="cardNumber" name="card.cardNumber" required>
        </div>
        <div class="form-group">
            <label for="expiryDate">Expiry Date</label>
            <input type="text" class="form-control" id="expiryDate" name="card.expiryDate" required>
        </div>
        <div class="form-group">
            <label for="CVV">CVV</label>
            <input type="text" class="form-control" id="cvv" name="card.cvv" required>
        </div>
        <input type="hidden" name="travellingDate" value="${passenger.travellingDate}" readonly>
        <input type="hidden" name="source" value="${passenger.booking.vehicle.source}" readonly>
        <input type="hidden" name="destination" value="${passenger.booking.vehicle.destination}" readonly>
        <input type="hidden" name="booking.vehicle.plateNo" value="${passenger.booking.vehicle.plateNo}" readonly>
        <input type="hidden" name="paidAmount" value="${passenger.booking.vehicle.price}" readonly>

        <button type="submit" class="btn btn-primary">Pay</button>
</form:form>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
