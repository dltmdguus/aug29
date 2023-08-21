<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> ❤ 사용자 정보</title>
<link href="css/styles.css" rel="stylesheet" />
<script src="./js/jquery-3.7.0.min.js"></script>
<style type="text/css">
		.info-form{
			margin: 0 auto;
			padding: 10px;
			width: 400px;
			height: auto;
			background-color: rgba(240, 255, 240, 0.3);
	}
	.info{
		text-align:lefe;
	}
</style>
		

</head>
<body>
	<%@ include file="menu.jsp"%>
	<!-- Masthead-->
	<header class="masthead">
		<div class="container">
		<div class="info-form">
			<h1>사용자 정보 보기</h1>
			<div>
			이름 : ${my.m_name }<br>
			id : ${my.m_id }<br>
			주소 : ${my.m_addr }<br>
			가입일 : ${my.m_date }<br>
			등급 : ${my.m_grade }<br>
			생일 : ${my.m_brith }<br>
			mbti : ${my.m_mbti }<br>
			</div>
		</div>
		
		
		</div>
	</header>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="js/scripts.js"></script>
<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>