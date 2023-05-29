<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  <title>Create Vehicle</title>
</head>

<body>
<div class="container">
    <jsp:include page="header.jsp"></jsp:include>
    <br><br><br>
    <c:choose>
        <c:when test="${empty vehicle.id}"><h1>Create Vehicle</h1></c:when>
        <c:otherwise><h1>Update Vehicle</h1></c:otherwise>
    </c:choose>
<form:form name="form" action="${pageContext.request.contextPath}/vehicle/save" method="post" modelAttribute="vehicle">
    <input type="hidden" name="id" value="${vehicle.id}">
    <div class="form-group">
      <label for="type">Type</label>
      <input type="text" class="form-control" id="type" name="type" value="${vehicle.type}" required>
    </div>
    <div class="form-group">
      <label for="travelsName">Travels Name</label>
      <input type="text" class="form-control" id="travelsName" name="travelsName" value="${vehicle.travelsName}" required>
    </div>
    <div class="form-group">
      <label for="brand">Brand</label>
      <input type="text" class="form-control" id="brand" name="brand" value="${vehicle.brand}" required>
    </div>
    <div class="form-group">
      <label for="plateNo">Plate No</label>
      <input type="text" class="form-control" id="plateNo" name="plateNo" value="${vehicle.plateNo}" required>
    </div>
    <div class="form-group">
      <label for="travelDate">Travel Date</label>
      <input type="date" class="form-control" id="travelDate" name="travelDate" value="${vehicle.travelDate}" required>
    </div>
    <div class="form-group">
      <label for="source">Source</label>
      <input type="text" class="form-control" id="source" name="source" value="${vehicle.source}" required>
    </div>
    <div class="form-group">
      <label for="destination">Destination</label>
      <input type="text" class="form-control" id="destination" name="destination" value="${vehicle.destination}" required>
    </div>
    <div class="form-group">
      <label for="price">Price</label>
      <input type="number" step="0.01" class="form-control" id="price" name="price" value="${vehicle.price}" required>
    </div>
    <button type="submit" class="btn btn-primary">
        <c:choose>
            <c:when test="${empty vehicle.id}">Create</c:when>
            <c:otherwise>Update</c:otherwise>
        </c:choose>
    </button>
</form:form>
</div>
</body>

</html>
