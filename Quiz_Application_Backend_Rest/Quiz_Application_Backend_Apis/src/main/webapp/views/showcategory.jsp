<%@page import="com.backend.entity.Category"%>
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
<%
Message m = (Message) request.getAttribute("message");
%>
<%
			if (m != null) {
			%>
			<div class="alert alert-<%=m.getColor()%>" role="alert">
				<%=m.getContent()%>
			</div>

			<%
			}
			%>
	<div class="row px-2">
		<%
		
		List<Category> category = (List<Category>) request.getAttribute("allcategory");
		for (Category c : category) {
			
		%>

		<div class="col-md-6 mt-5  ml-5 text-center">
			
			<div class="card">
				<div class="card-body">
				<img src="https://cdn-icons-png.flaticon.com/512/3261/3261308.png"
						class="img-fluid rounded-circle" alt="Townhouses and Skyscrapers" width="100" height="100" />
					<h3><%=c.getTitle()%></h3>
					<b><%=c.getContent()%></b>
					<br><br><br>
					<a href="/admin/delete/<%=c.getCId() %>" class="btn btn-danger"role="button" >delete</a>
					<a href="/admin/renderCategoryUpdateForm/<%=c.getCId() %>" class="btn btn-warning"role="button" >update</a>
				</div>
				
			</div>
			
		</div>

		<%
		}
		%>
	</div>
</body>
</html>