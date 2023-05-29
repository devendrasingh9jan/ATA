<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vehicle Search</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script type="text/javascript" src="/js1/font.js"></script>
    <link rel="stylesheet" type="text/css" href="/css/font-awesome.min.css" />
    <style>
        .container {
            margin-top: 50px;
        }
    </style>
</head>
<body>
<div class="container">
    <jsp:include page="headerUser.jsp"></jsp:include>
    <br>
    <h2>Vehicle Search</h2>
    <form>
        <div class="form-row">
            <div class="col-md-5 mb-3">
                <label for="source">Source</label>
                <input type="text" class="form-control" id="source" name="source" placeholder="Enter source" required>
            </div>
            <div class="col-md-5 mb-3">
                <label for="destination">Destination</label>
                <input type="text" class="form-control" id="destination" name="destination" placeholder="Enter destination" required>
            </div>

            <div class="col-md-2 mb-3">
                <label>&nbsp;</label>
                <button class="form-control btn btn-primary btn-block" type="button" onclick="filterVehicles()">Search</button>
            </div>
        </div>
    </form>

    <h3>Available Vehicles</h3>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>Type</th>
            <th>Travels Name</th>
            <th>Brand</th>
            <th>Plate No</th>
            <th>Travel Date</th>
            <th>Source</th>
            <th>Destination</th>
            <th>Price</th>
            <th>Book</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${vehicleList}" var="vehicle">
            <tr class="vehicle" data-source="${vehicle.source}" data-destination="${vehicle.destination}">
                <td>${vehicle.type}</td>
                <td>${vehicle.travelsName}</td>
                <td>${vehicle.brand}</td>
                <td>${vehicle.plateNo}</td>
                <td>${vehicle.travelDate}</td>
                <td>${vehicle.source}</td>
                <td>${vehicle.destination}</td>
                <td>${vehicle.price}</td>
                <td style="color: green" class="text-center"><a
                        href="/passenger/book/vehicle?vehicleId=${vehicle.id}">
                    <i class="fa fa-road" aria-hidden="true"></i></a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    function filterVehicles() {
        var source = document.getElementById("source").value.toLowerCase();
        var destination = document.getElementById("destination").value.toLowerCase();
        var vehicles = document.getElementsByClassName("vehicle");

        for (var i = 0; i < vehicles.length; i++) {
            var vehicle = vehicles[i];
            var vehicleSource = vehicle.getAttribute("data-source").toLowerCase();
            var vehicleDestination = vehicle.getAttribute("data-destination").toLowerCase();

            if (vehicleSource.includes(source) && vehicleDestination.includes(destination)) {
                vehicle.style.display = "table-row"; // Show the vehicle
            } else {
                vehicle.style.display = "none"; // Hide the vehicle
            }
        }
    }
</script>
</body>
</html>
