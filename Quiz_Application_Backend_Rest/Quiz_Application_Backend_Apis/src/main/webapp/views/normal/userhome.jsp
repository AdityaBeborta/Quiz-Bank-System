<%@page import="com.backend.entity.Quiz"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="navbar.jsp"%>
<%@include file="sidebar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
body{
margin-left: 19.5%;
}
</style>
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
		List<Quiz> quiz = (List<Quiz>) request.getAttribute("allQuiz");
		for (Quiz c : quiz) {
		%>

		<div class="col-md-6 mt-5  ml-5 text-center">

			<div class="card ">
				<div class="card-body">
					<img src="https://cdn-icons-png.flaticon.com/512/3261/3261308.png"
						class="img-fluid rounded-circle" alt="Townhouses and Skyscrapers" width="100" height="100" />

					<h3>
						Title:
						<%=c.getTitle()%></h3>
					<br> <b>Description: <%=c.getDescription()%></b> <br> 
					<!--  <b>Total
						Marks: <%=c.getMaxMarks()%></b> <br> <b>Total Number Of
						Questions: <%=c.getNumberOfQuestion()%></b> <br> <b>-->Category
						Name: <%=c.getCategory().getTitle()%></b> <br>
					<br>
					<br>  <a
						href="/user/renderAllQuestions/<%=c.getQ_Id()%>"
						class="btn btn-primary" role="button">view quiz</a>
				</div>

			</div>

		</div>

		<%
		}
		%>
	</div>
</body>
</html>