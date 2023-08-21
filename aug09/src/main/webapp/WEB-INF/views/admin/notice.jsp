<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin || 공지사항</title>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel="stylesheet" href="../css/admin.css">
<style type="text/css">
.notice-write-form{
	width: 90%;
	height: auto;
	margin: 10px;
	padding: 20px;
	box-sizing: border-box;
}
.notice-write-form input{
	height: 20px;
	width: 100%
}
.notice-write-form textarea{
	width: 100%;
	height:300px;	
	margin: 5px 0px;
}
.notice-write-form button{
	width: 100px;
	height:50px;
}

</style>
</head>
<body>
	<div class="container">
<%@ include file="menu.jsp" %>
		<div class="main">
			<div class="article"> 
				<h1>공지사항</h1>
				<table border="1">
					<tr>
						<td>번호</td>
						<td>제목</td>
						<td>게시일</td>
						<td>글쓴이</td>
						<td>삭제여부</td>
						<td>파일유무</td>
					</tr>
					<c:forEach items="${list}" var="row">
					<tr>
						<td>${row.nno }</td>
						<td>${row.ntitle }</td>
						<td>${row.ndate }</td>
						<td>${row.m_no }</td>
						<td><c:choose>
							<c:when test="${row.ndel eq 1}">보여짐<i class="xi-eye"></i></c:when>
							<c:otherwise>숨겨짐<i class="xi-eye-off"></i></c:otherwise>
						</c:choose>
						</td>
						<td>
						<c:choose>
							<c:when test="${row.norifile ne null}"><i class="xi-file-text"></i></c:when>
							<c:otherwise><i class="xi-file"></i></c:otherwise>
						</c:choose>
						</td>
					</tr>
					</c:forEach>
				</table>
				<div class="notice-write-form">
				<form action="./noticeWrite" method="post" enctype="multipart/form-data">
					<input type="text" name="title">
					<textarea name="content"></textarea>
					<input type="file"	name="upFile">
					<button type="submit">글쓰기</button>
				</form>
				
				</div>
			</div>
		</div>
	</div>
</body>
</html>