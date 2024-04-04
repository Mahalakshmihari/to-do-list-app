<%@page import="dto.Task"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Base64"%>
<%@page import="controller.LoginUser"%>
<%@page import="dto.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
body{
	padding:10px;}
#div-1{
	display:grid;
	grid-template-columns:250px 1fr;
	grid-template-rows:270px ;

    padding: 2px;

}
table{
	width:100%;
	margin-top: 5px;
	margin-left: 10px;
}
table,th,td{
	margin:10px;
    border: 2px solid black;

	border-collapse:collapse;
	background-color:orange;
	border-spacing: 12px
}
th{
	background-color: orangered;
}
td,th{
	padding: 10px;
	text-align: center;
}
tbody{
	margin-top: 5px;
}
#add-task{
	text-decoration:none;
	
	color:black;
	border-radius:10px;
	padding:15px;
	background-color: blue;
	margin-top:0px;
	margin-left:1250px;
}
.grid-1{
	padding:10px;
 
}
.grid-2{
	padding:10px;
 
}
#div-2{
	
	
	padding:30px;
	padding-top: 18px;
}
#user-img{
	box-shadow: 0px 0px 20px purple;
	border-radius: 20px;
}
</style>

</head>
<body>
<% 
User u=(User)session.getAttribute("user");
String image=new String(Base64.getEncoder().encode(u.getUserimage()));
%>
<h1>Hello <%=u.getUsername() %> ....!</h1><br>

<div id="div-1">
<div class="grid-1">
 <img alt="" src="data:image/jpeg;base64,<%=image %>" width="200px" height="250px" id="user-img">
</div>
<div class="grid-2">
<h2>Name : <%=u.getUsername()%></h2>
<h2>Email : <%=u.getUseremail() %></h2>
<h2>Contact : <%=u.getUsercontact() %></h2></div>
</div>
<div id="div-2">
<a href="addtask.jsp" id="add-task">Add Task</a>
<br>
<br>
<% List<Task> tasks=(List)request.getAttribute("tasks"); %>
<table>
<thead>
<tr>
<th>Id</th>
<th>Title</th>
<th>Description</th>
<th>Priority</th>
<th>Due Date</th>
<th>Status</th>
<th>DeleteTask</th>
</tr>
</thead>

<tbody>
<% for(Task task:tasks) {%>
<tr>
<td><%= task.getTaskid() %></td>
<td><%= task.getTasktitle() %></td>
<td><%= task.getTaskdescription() %></td>
<td><%= task.getTaskpriority() %></td>
<td><%= task.getTaskduedate() %></td>
<td><%= task.getTaskstatus() %></td>
<td><a href="deletetask?taskid=<%=task.getTaskid()%>">Delete</a></td>
</tr>
<%} %>
</tbody>
</table></div>



</body>
</html>