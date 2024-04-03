<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="addtask" method="post">
 <label for="task-id">Task Id :</label>
 <input type="text" id="task-id" name="id"><br><br>
  <label for="task-title">Task Title :</label>
 <input type="text" id="task-title" name="title"><br><br>
  <label for="task-des">Task Description :</label>
 <input type="text" id="task-des" name="description"><br><br>
 <label>Task Priority:</label>
 <label for="option1">Low : <input type="radio" id="option1" name="priority" value="low"></label>
 <label for="option2">Medium : <input type="radio" id="option2" name="priority" value="medium"></label>
 <label for="option3">High : <input type="radio" id="option3" name="priority" value="high"></label>
 
 <label for="date"><input type="date" id="date" name="duedate"></label>
 <input type="submit" >
  
</form>



</body>
</html>