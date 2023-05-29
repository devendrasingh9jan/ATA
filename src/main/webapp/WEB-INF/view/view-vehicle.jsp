<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script type="text/javascript" src="/js1/font.js"></script>
    <link rel="stylesheet" type="text/css" href="/css/font-awesome.min.css" /><title>ATA</title>
</head>

<body>
<div class="container">
    <jsp:include page="header.jsp"></jsp:include>
    <br><br><br>
    <h1>Vehicle Details</h1>
    <table class="table">
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
            <th>Delete</th>
            <th>Update</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${vehicleList}" var="vehicle">
        <tr>
            <td>${vehicle.type}</td>
            <td>${vehicle.travelsName}</td>
            <td>${vehicle.brand}</td>
            <td>${vehicle.plateNo}</td>
            <td>${vehicle.travelDate}</td>
            <td>${vehicle.source}</td>
            <td>${vehicle.destination}</td>
            <td>${vehicle.price}</td>
            <td style="color: green" class="text-center"><a
                    href="/vehicle/delete?id=${vehicle.id}">
                <i class="fa fa-trash" aria-hidden="true"
                    onclick=""> </i></a></td>
            <td class="text-center"><a
                    href="/vehicle/update?id=${vehicle.id}" id='mylink'>
                <i class="fa fa-pencil" aria-hidden="true"></i></a></td>
        </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>

</html>
