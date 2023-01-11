<%@page import="java.util.List"%>
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

<div class="jumbotron text-success">
  <h1 class="display-4">Hello, <%=user.getUsername() %></h1>
  <p class="lead">This is a simple hero unit, a simple jumbotron-style component for calling extra attention to featured content or information.</p>
 </div>

<div class="container mt-2">
<table class="table ">
  <thead class="thead-light">
    <tr>
    
      <th scope="col">username</th>
      <th scope="col">firstname</th>
      <th scope="col">lastname</th>
      <th scope="col">email</th>
      <th scope="col">Enable</th>
       <th scope="col">phone</th>
    </tr>
  </thead>
 <%
 List<User> user1=(List<User>) request.getAttribute("allUser");
		  for(User u:user1){
			
 %>
 
 <tbody>
    <tr>
     
      <td><%=u.getUsername() %></td>
      <td><%=u.getFirstName() %></td>
      <td><%=u.getLastName() %></td>
       <td><%=u.getEmail() %></td>
        <td>active</td>
         <td><%=u.getPhone() %></td>
    </tr>
  </tbody>
 
 <%} %>
</table>
</div>
</body>
</html>