<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
    <style>
        body{
            background-color:  rgb(224, 73, 18);
            height: 100vh;
        }
        #task-div{
            
            margin-top: 30px;
            margin-left: 30px;
            margin-right: 40px;
            margin-bottom: 0px;
            padding-left: 720px;
            padding-top: 140px;
            height: 63vh;
            background-image: url("https://images.inc.com/uploaded_files/image/1920x1080/getty_514914078_200013332000928076_167571.jpg");
            background-repeat: no-repeat;
            background-size: 100%;
            box-shadow: 0px 0px 20px orange;
        }
        form{
            background-color: #9CE3F5;
            padding: 10px;
            width: 480px;
        }
    </style>
</head>
<body>
    <div id="task-div">
        
        <form action="addtask" method="post">
            <h1>Add Your Task</h1><br>
            <label for="task-id">Task Id :</label>
            <input type="text" id="task-id" name="id"><br><br>
             <label for="task-title">Task Title :</label>
            <input type="text" id="task-title" name="title"><br><br>
             <label for="task-des">Task Description :</label>
            <input type="text" id="task-des" name="description"><br><br>
            <label>Task Priority:</label><br><br>
            <label for="option1"> <input type="radio" id="option1" name="priority" value="low"> Low :</label><br><br>
            <label for="option2"> <input type="radio" id="option2" name="priority" value="medium">  Medium :</label><br><br>
            <label for="option3"> <input type="radio" id="option3" name="priority" value="high">    High :</label><br><br>
            
            <label for="date">Task Due Date :<input type="date" id="date" name="duedate"></label>
            <br><br>
            <input type="submit" >
             
           </form>
    </div>
</body>
</html>