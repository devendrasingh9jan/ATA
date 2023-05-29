<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Passenger Details</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <jsp:include page="header.jsp"></jsp:include>
    <br><br><br>
    <h1>Passenger Details</h1>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>Name</th>
            <th>Age</th>
            <th>Travelling Date</th>
            <th>Source</th>
            <th>Destination</th>
            <th>Vehicle Type</th>
            <th>Vehicle No</th>
            <th>Paid Amount</th>
            <th>Booking Status</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${passengers}" var="passenger">
            <tr>
                <td>${passenger.name}</td>
                <td>${passenger.age}</td>
                <td>${passenger.travellingDate}</td>
                <td>${passenger.source}</td>
                <td>${passenger.destination}</td>
                <td>${passenger.booking.vehicle.type}</td>
                <td>${passenger.booking.vehicle.plateNo}</td>
                <td>${passenger.paidAmount}</td>
                <td>${passenger.booking.status}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
