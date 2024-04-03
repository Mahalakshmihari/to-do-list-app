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
        }
        form{
            font-size: 20px;
            margin-top: 100px;
            /* margin-bottom: 200PX; */
            margin-left: 300px;
            margin-right: 300px;
            padding: 100PX;
            background-color: rgb(128, 128, 158);
            border-top-left-radius: 100px;
            border-bottom-right-radius: 10  0px;
        }
        #button{
            padding: 8px;
            font-size: 17px;
        }
    </style>
    </head>

  <!-- Login design -->
  <body>


    <form action="loginuser" method="post">
        <label for="login-email">Email :</label>
        <input type="email" id="login-email" name="email">
        <br><br><br>d
        <label for="login-password">Password :</label>
        <input type="text" id="login-password" name="password">
        <br><br><br>
        <input type="submit" name="lsubmit" id="button">
    </form>
    
    </body>
</html>