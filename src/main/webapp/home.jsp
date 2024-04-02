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
#div-1{
display:flex;
flex-direction:column;
}
</style>
</head>
<body>
<% 
User u=(User)session.getAttribute("user");
String image=new String(Base64.getEncoder().encode(u.getUserimage()));
%>
<h1>hi im in home </h1><br>
<h1>Hello <%=u.getUsername() %> ....!</h1><br>

<div id="div-1">
<div>
 <img alt="" src="data:image/jpeg;base64,<%=image %>" width="200px" height="300px">
</div>
<div>
<h2>Email : <%=u.getUseremail() %></h2>
<h2>Contact : <%=u.getUsercontact() %></h2></div>


</div>
</body>
</html>