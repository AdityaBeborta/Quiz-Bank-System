<%@page import="com.backend.entity.Question"%>
<%@page import="com.backend.entity.Quiz"%>
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
		
		Quiz quiz = (Quiz) request.getAttribute("quiz");
		List<Question> question=(List<Question>)request.getAttribute("question");
	
			
		%>
		<h1>Questions of <%=quiz.getTitle() %></h1>
		

		<%
			if(question.size()==0){
		%>
		<div>
			<h1>No questions in this quiz</h1>
		</div>
		<%
			}else{
				for(Question q:question){
		%>
		<div class="col-md-6 mt-5  ml-5 text-center">
			
			<div class="card">
				<div class="card-body">
					<b><%=q.getQuestion_Name() %></b>
					<br>
					<hr>
					<b>a.<%=q.getOption1() %></b>  
					<br>
					<b>b.<%=q.getOption2() %></b>
					<br>
					<b>c.<%=q.getOption3() %></b> 
					<br>
					<b>d.<%=q.getOption2() %></b>
				
				</div>
				
			</div>
			
		</div>
		<%}} %>

		
	</div>
	<br>
	<div class="container text-center">
		<a
						href="/admin/renderAddQuestionForm/<%=quiz.getQ_Id()%>"
						class="btn btn-primary" role="button">Questions</a>
	</div>
</body>
</html>