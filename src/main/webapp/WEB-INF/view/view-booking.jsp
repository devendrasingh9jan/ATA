<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking List</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script type="text/javascript" src="/js1/font.js"></script>
    <link rel="stylesheet" type="text/css" href="/css/font-awesome.min.css" />
</head>
<body>
<div class="container">
    <jsp:include page="headerUser.jsp"></jsp:include>
    <br><br><br>
    <h2>Booking List</h2>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>Booking Date</th>
            <th>Source</th>
            <th>Destination</th>
            <th>Vehicle No</th>
            <th>Status</th>
            <th>Amount</th>
            <th>Cancel Booking</th>
            <th>Print Receipt</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="booking" items="${bookings}">
            <tr>
                <td>${booking.bookingDate}</td>
                <td>${booking.source}</td>
                <td>${booking.destination}</td>
                <td>${booking.vehicle.plateNo}</td>
                <td>${booking.status}</td>
                <td>${booking.vehicle.price}</td>
                <td style="color: green" class="text-center"><a
                        href="/passenger/cancel/booking?bookingId=${booking.id}">
                    <i class="fa fa-times-circle" aria-hidden="true"></i></a></td>
                <td style="color: green" class="text-center"><a
                        href="/passenger/booking/receipt?bookingId=${booking.id}">
                    <i class="fa fa-print" aria-hidden="true"></i></a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

