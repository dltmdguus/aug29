<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<style type="text/css">
body {
   margin: 0px;
   padding: 0px;
}
.main{
   width:100%;
   height:100vh;
   background-image: url("../img/login.jpg");
   background-size: inherit;
   background-repeat: no-repeat;
}
.login-box{
   margin-left: 45%;
   bottom: 300px;
   width: 200px;
   height: 200px;
   text-align: center;
   position:absolute;
}
.login-image{
   padding:15px;
   border-radius: 50%; 
   background-color: gray;
}
.login-form{
   width: 200px;
}
.login-form input{
   margin: 3px;
   width: 180px;
   height: 35px;
   border: 0px;
   font-weight: bold;
   text-align: center;
   color: green;
}
.login-form button{
   margin: 3px;
   width: 185px;
   height: 35px;
   border: 0px;
   background-color: green;
   color: white;
   font-weight: bold;
}
</style>
<script type="text/javascript">
$(function(){
   $(".login").click(function(){      
      if($("#id").val() == "" || $("#id").val().length < 4){
         alert("올바른 아이디를 입력하세요");
         $("#id").focus();
         return false;
      }
      if($("#pw").val() == "" || $("#pw").val().length < 4){
         alert("올바른 아이디를 입력하세요");
         $("#pw").focus();
         return false;
      }
      
       var form = document.createElement("form");       
         form.setAttribute("action" , "./login");
         form.setAttribute("method" , "POST");
         
      var id = document.createElement("input");
         id.setAttribute("type", "hidden");
         id.setAttribute("name", "id");
         id.setAttribute("value", $("#id").val());
      form.appendChild(id);
      var pw = document.createElement("input");
         pw.setAttribute("type", "hidden");
         pw.setAttribute("name", "pw");
         pw.setAttribute("value", $("#pw").val());
      form.appendChild(pw);
   
       document.body.appendChild(form);
       form.submit();
   });
});
</script>
<title>관리자</title>
</head>
<body>
<div class="continer">
   <div class="main">
      <div class="article">
         <div class="login-box">
            <div class="login-image">
               <img alt="logo" src="../img/robot.png" height="150px">
            </div>
            <div class="login-form">
               <input type="text" name="id" id="id" required="required" maxlength="10">
               <input type="password" name="pw" id="pw" required="required" maxlength="15" >
               <button class="login">LOGIN</button>
            </div>
         </div>
      </div>
   </div>
</div>
</body>
</html>