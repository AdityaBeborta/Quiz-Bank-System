<%@page import="com.backend.entity.Category"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>user home page</title>
</head>
<style>
<style>
body {
  font-family: "Lato", sans-serif;
  
}

.sidenav {
  height: 100%;
  width: 300px;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  background-color: #111;
  overflow-x: hidden;
  padding-top: 20px;
}

.sidenav a {
  padding: 6px 6px 6px 32px;
  text-decoration: none;
  font-size: 25px;
  color: #818181;
  display: block;
}

.sidenav a:hover {
  color: #f1f1f1;
}

.main {
  margin-left: 200px; /* Same as the width of the sidenav */
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}
</style>
<body>
<div id="mySidenav" class="sidenav">
	<a href="#" style="color: yellow;">Categories</a>
	
 
  <%
  List<Category> list=(List<Category>) request.getAttribute("allCategory");
  for(Category c:list){
  %>
 <a href="#"><%=c.getTitle() %></a>
  <%} %>
</div>




</body>
</html>