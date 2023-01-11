<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="navbar.jsp"%>
<%@include file="SideNavbar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="container mt-5 ml-5 mr-5 text-center">

<div class="card mb-3">
  <img src="https://cdn-icons-png.flaticon.com/512/2202/2202112.png" class="rounded mx-auto d-block" alt="..." width="100" height="100">
  <div class="card-body">
    <h3 class="card-title">Username: <%=user.getUsername() %></h3>
    <h5 class="card-title">Email: <%=user.getEmail() %></h5>
    <h5 class="card-title">Firstname: <%=user.getFirstName() %></h5>
    <h5 class="card-title">Lastname: <%=user.getLastName() %></h5>
    <h5 class="card-title">phoneNumber: <%=user.getPhone() %></h5>
   
  </div>
</div>
</div>
</body>
</html>