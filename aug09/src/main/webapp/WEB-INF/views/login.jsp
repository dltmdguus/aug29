<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>❤ login</title>
<link href="css/styles.css" rel="stylesheet" />
<script src="./js/jquery-3.7.0.min.js"></script>
<style type="text/css">
.login-form {
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
				alert(item.parentNode.previousElementSibling.innerHTML
						+ "를 다시 입력해주세요");
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
<script type="text/javascript">
	$(function() {
		//쿠키 값 가져오기
		let userID = getCookie("userID");//아이디
		let setCookieY = getCookie("setCookie");//Y
		//쿠키 검사 -> 쿠키가 있다면 해당 쿠키에서 id값 가져와 id칸에 붙여넣기
		if (setCookieY == 'Y') {
			$("#saveID").prop("checked", true);
			$("#id").val(userID);
		} else {
			$("#saveID").prop("checked", false);
		}

		$("#login").click(function() {
			//아이디 패스워드 검사하기
			let id = $("#id").val();
			let pw = $("#pw").val();

			if (id == '' || id.length < 4) {
				alert("올바른 아이디를 입력하세요");
				$("#id").focus();
				return false;
			}

			if (pw == '' || pw.length < 5) {
				alert("올바른 암호를 입력하세요");
				$("#pw").focus();
				return false;
			}

			if ($("#saveID").is(":checked")) {
				//alert("체크되어있습니다.");
				//setCookie("userID", 사용자가입력한ID, 7);
				setCookie("userID", id, 7);
				setCookie("setCookie", "Y", 7);
			} else {
				//alert("체크 X");
				//deleteCookie()
				deleteCookie("userID");
				deleteCookie("setCookie");
			}
		});
	});

	//setCookie()
	function setCookie(cookieName, value, exdays) {
		let exdate = new Date();
		exdate.setDate(exdate.getDate() + exdays);
		let cookieValue = value
				+ ((exdays == null) ? "" : ";expires=" + exdate.toGMTString());
		document.cookie = cookieName + "=" + cookieValue;
		//                userID=poseidon; expires=2023-08-30
	}

	//deleteCookie()
	function deleteCookie(cookieName) {
		let expireDate = new Date();
		expireDate.setDate(expireDate.getDate() - 1);
		document.cookie = cookieName + "= " + ";expires="
				+ expireDate.toGMTString();
	}

	//getCookie()
	function getCookie(cookieName) {
		let x, y;
		let val = document.cookie.split(";");
		for (let i = 0; i < val.length; i++) {
			x = val[i].substr(0, val[i].indexOf("="));
			y = val[i].substr(val[i].indexOf("=") + 1);
			//x = x.replace(/^\s+|\s+$/g, '');
			x = x.trim();
			if (x == cookieName) {
				return y;
			}
		}
	}
</script>
</head>
<body>
	<%@ include file="menu.jsp"%>
	<header class="masthead">
		<div class="container">
			<div class="rounded-3 login-form">
				<h2>LOGIN</h2>
				<img alt="login" src="./img/login.png" width="250px;">
				<c:if test="${param.error ne null }">
					<div class="mb-3 row">
						<h2 style="color: yellow;">로그인 하세요.</h2>
					</div>
				</c:if>
				<div class="mb-3 row">
					<label for="staticEmail" class="col-sm-3 col-form-label">I
						D</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="id"
							placeholder="아이디를 입력하세요">
					</div>
				</div>
				<div class="mb-3 row">
					<label for="inputPassword" class="col-sm-3 col-form-label">Password</label>
					<div class="col-sm-8">
						<input type="password" class="form-control" id="pw"
							placeholder="암호를 입력하세요">
					</div>
				</div>
				<div class="mb-3 row">
					<div class="col-sm-12">
						<input type="checkbox" id="saveID"> <label for="saveID">아이지
							저장</label>
					</div>
				</div>
				<div class="mb-3 row">
					<div class="col-sm-12">
						<input type="button" id="login" class="btn btn-primary"
							value="login"
						<!--  onclick="loginCheck() -->
						"> <input type="button" id="join" class="btn btn-info"
							value="가입하기">
					</div>
				</div>
			</div>

		</div>
	</header>

	<!-- 에러가 들어오면 동작하게 하겠습니다. -->
	<c:if test="${param.error ne null }">
		<script type="text/javascript">
			alert("로그인 해야 사용할 수 있는 메뉴입니다.");
		</script>
	</c:if>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>