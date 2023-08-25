<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin || multiboard</title>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel="stylesheet" href="../css/admin.css">
<link rel="stylesheet" href="../css/multiboard.css">
<style type="text/css">
.input-form{
	margin: 0 auto;
	margin-top: 10px;
	width: 90%;
	height: 30px;
	line-height: 30px;
	padding: 5px;
	background-color: gray;
}
.input-forn input, .input-form button{
	width: 19%;
	border: 0px;
	margin: 0;
	padding: 0;
	height: 20px;
	vertical-align: middle;
}
</style>
</head>
<body>
	<%@ include file="menu.jsp" %>
	<div class="container">
		<div class="main">
		 	<div class="article">
				<h1>메인영역</h1>
				<div class="div-table">
					<div class="div-row table-head">
						<div class="div-cell table-head">글번호</div>
						<div class="div-cell table-head">카테고리</div>
						<div class="div-cell table-head">이름</div>
						<div class="div-cell table-head">URL</div>
						<div class="div-cell table-head">참고</div>
					</div>
					<c:forEach items="${boardlist }" var="row">
						<div class="div-row">
							<div class="div-cell">${row.b_no}</div>
							<div class="div-cell">${row.mb_cate}</div>
							<div class="div-cell">${row.b_catename}</div>
							<div class="div-cell">${row.b_url}</div>
							<div class="div-cell">${row.b_comment}</div>
						</div>
					</c:forEach>
				</div>
				<!-- 새로 입력하는 form입니다 -->
				<div class="input-form">
				<form action="./multiboard" method="post">
					<input type="number" name="cateNum" required="required" placeholder="게시판 번호 입력">
					<input type="text" name="name" required="required" placeholder="게시판 이름 입력">
					<input type="text" name="comment" required="required" placeholder="참고를 남겨주세요">
					<button type="submit">저장</button>
				</form>
				</div>
				<div>
				<
				</div>
			</div>
		</div>
	</div>

</body>
</html>