<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
        body{
         	 background-image:url("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSrLvElhBQaTsAVnBGGrdfbmkwoEjL_UkZRBw&s");
             background-color: bisque;
             background-repeat: no-repeat;
             background-size: 100%;
        }

        form{
            text-align:center;
           
            height:60vh;
            width:80%;
            background-color:rgb(182, 109, 82);
            border-radius: 30px;
            padding-top: 100px;
            padding-left: 150px;
            text-align: left;
        }
        fieldset{
            background-color: rgb(163, 61, 24);
            border-radius: 30px;
            border-style:inset;
            margin-top: 20px;
            margin-bottom: 50px;
            margin-left: 400px;
            margin-right: 300px;
            padding-left: 30px;
            padding-right: 30px;
            padding-bottom: 30px
            box-shadow: 0px 0px 20px orange;
           
        }
        </style>
        </head>
        <body>
         <div>
            <fieldset>
                <legend><h1><b>SignUp</b></h1></legend>
                <form action="saveuser" method="post" enctype="multipart/form-data">
                    <label for="user-id"> <b>Id :</b></label>
                    <input type="text" name="id" id="user-id"><br><br>
                    <label for="user-name"><b>Name :</b></label>
                    <input type="text" name="name" id="user-name"><br><br>
                    <label for="user-email"><b>Email :</b></label>
                    <input type="email" name="email" id="user-email"><br><br>
                    <label for="user-contact"><b>Contact :</b> </label>
                    <input type="text" name="Contact" id="user-contact"><br><br>
                    <label for="user-password"><b>Password :</b></label>
                    <input type="text" name="password" id="user-password"><br><br>
                    <label for="user-image"><b>Image :</b></label><input type="file" name="image" id="user-image"><br><br>
                    <input type="submit" name="submit" >
            
            
                </form> 
            </fieldset>
         </div>
        </body>


</html>