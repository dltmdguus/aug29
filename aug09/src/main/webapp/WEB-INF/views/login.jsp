<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> ❤ login</title>
    <link href="css/styles.css" rel="stylesheet" />
    <script src="./js/jquery-3.7.0.min.js"></script>
	<style type="text/css">
		.login-form{
			margin: 0 auto;
			padding: 10px;
			width: 400px;
			height: auto;
			background-color: rgba(240, 255, 240, 0.3);
		}
	</style>
   <script>
   //자바스크립트일때
      function loginCheck() {
         let id = document.querySelector("#id");//창입니다
         let pw = document.querySelector("#pw");//input창 입니다
         let checkItems = [ id, pw ];
         //alert(id + " / " + pw + " / " + checkItems);
         
         
         
         
         
         let flag = checkItems.every(function(item) {
            if (item.value === null || item.value === "") {
               //alert(item.parentNode.parentNode.childNodes[1].innerHTML + "를 다시 입력해주세요");
               //alert(item.parentNode.parentNode.querySelector("label").innerHTML + "를 다시 입력해주세요");
               alert(item.parentNode.previousElementSibling.innerHTML + "를 다시 입력해주세요");
               item.focus();
            }
            return item.value !== ""; //비어있으면 거짓
         });

         if (flag == true) {
            // alert("로그인합니다");
            //writeForm.submit();
            //가상form만들기
            let form = document.createElement("form");
               form.setAttribute("action", "./login.sik");
               form.setAttribute("method", "post");
               
               let idField = document.createElement("input");
               idField.setAttribute("type", "hidden");
               idField.setAttribute("name", "id");
               idField.setAttribute("value", id.value);
               form.appendChild(idField);
               
               let pwField = document.createElement("input");
               pwField.setAttribute("type", "hidden");
               pwField.setAttribute("name", "pw");
               pwField.setAttribute("value", pw.value);
               form.appendChild(pwField);
               
               document.body.appendChild(form);
               form.submit();       


            
         }
      }
   </script>
</head>
<body>
<%@ include file="menu.jsp" %>
        <header class="masthead">
            <div class="container">
               <div class="rounded-3 login-form">
               		<h2>LOGIN</h2>
               		<img alt="login" src="./img/login.png" width="250px;">
				<div class="mb-3 row">
					<label for="staticEmail" class="col-sm-3 col-form-label">I D</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="id" placeholder="아이디를 입력하세요">
					</div>
				</div>
				<div class="mb-3 row">
					<label for="inputPassword" class="col-sm-3 col-form-label">Password</label>
					<div class="col-sm-8">
						<input type="password" class="form-control" id="pw" placeholder="암호를 입력하세요">
					</div>
				</div>
				<div class="mb-3 row">
					<div class="col-sm-12">
						<input type="button" id="login" class="btn btn-primary" value="login" onclick="loginCheck()">
						<input type="button" id="join" class="btn btn-info" value="가입하기">
					</div>
				</div>
               </div>

            </div>
        </header>
        
     
        

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>