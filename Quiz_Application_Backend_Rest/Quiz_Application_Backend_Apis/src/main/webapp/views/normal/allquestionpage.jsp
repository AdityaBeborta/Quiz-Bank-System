<%@page import="com.backend.entity.Question"%>
<%@page import="com.backend.entity.Quiz"%>
<%@page import="com.backend.entity.Category"%>
<%@page import="java.util.List"%>
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
body {
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
		Quiz quiz = (Quiz) request.getAttribute("quiz");
		List<Question> question = (List<Question>) request.getAttribute("question");
		
		%>
		<div class="jumbotron">
  <h1 class="display-4 text-success"><%=quiz.getTitle() %></h1>
  <p class="lead"><%=quiz.getDescription() %></p>

  <p><%=quiz.getCategory().getTitle() %></p>
  
  
</div>


		<%
		if (question.size() == 0) {
		%>
		<div>
			<h1 style="color: red;">No questions in this quiz</h1>
		</div>
		<%
		} else {
		for (Question q : question) {
		%>
		<div class="col-md-6 mt-5  ml-5 text-center">

			<div class="card">
				<div class="card-body">
					<h3><%=q.getQuestion_Name()%></h3>
					<hr>
					<div class="row">
						<div class="col-md-6">
							<div class="form-check">
								<h5>2. <%=q.getOption1() %></h5>
							</div>
						</div>

						<div class="col-md-6">
							<div class="form-check">
								<h5>1. <%=q.getOption2() %></h5>
							</div>
						</div>

					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-check">
							<h5>3. <%=q.getOption3() %></h5>
							</div>
						</div>
						<div class="col-md-6">
							<h5>4. <%=q.getOption4() %></h5>
						</div>

					</div>



				</div>
				<div class="container text-center mt-2">
					<h4 style="color: green;">answer: <%=q.getAnswer() %></h4>
				</div>

			</div>

		</div>
		<%
		}
		}
		%>


	</div>
	<br>
	<div class="container text-center">
		<a href="/user"
			class="btn btn-danger" role="button"><h4>Go Back?</h4></a>
	</div>
</body>
</html>