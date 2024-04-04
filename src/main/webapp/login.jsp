<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style>
        body{
            background-color: rgb(0, 21, 82);
            background-image: url("https://www.amitree.com/wp-content/uploads/2021/08/the-pros-and-cons-of-paper-to-do-lists.jpeg");
        }
        form{
            font-size: 20px;
            margin-top: 300px;
            /* margin-bottom: 200PX; */
            margin-left: 510px;
            margin-right: 500px;
             margin-bottom: 200px;
            padding: 50px;
            box-shadow: 0px 0px 15px #9CE3F5;
            background-color:#9CE3F5; 
 /*             border-top-left-radius: 100px;
            border-bottom-right-radius: 10  0px; */
        }
        h1{
        margin-left:90px;
          
        }
        #button{
            margin-left:90px;
            padding: 10px;
            font-size: 17px;
        }
        #login-email,#login-password{
        	height: 19px;
        	width: 200px;
        }
    </style>
    </head>

  <!-- Login design -->
  <body>


    <form action="loginuser" method="post">
    <h1>Login</h1>
        <label for="login-email">Email :</label>
        <input type="email" id="login-email" name="email">
        <br><br><br>
        <label for="login-password">Password :</label>
        <input type="text" id="login-password" name="password">
        <br><br><br>
        <input type="submit" name="lsubmit" id="button">
    </form>
    
    </body>
</html>