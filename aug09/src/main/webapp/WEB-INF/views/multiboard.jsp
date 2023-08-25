<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멀티보드</title>
	<!-- Core theme CSS (includes Bootstrap)-->
    <link href="css/styles.css" rel="stylesheet" />
    <script src="./js/jquery-3.7.0.min.js"></script>
	<style type="text/css">
		.title{
			text-align: left;
		}
		.detail-datail{
			width: 100%;
			height: auto;
		}
		.detail-name, .detail-date-read{
			width: 100%;
			height: 30px;
			border-bottom: 1px solid #c0c0c0;
		}
		.detail-date-read{
			background-color: silver;
		}
		.detail-date{
			padding-left: 10px;
			float: left;
		}
		.detail-read{
			padding-right: 10px;
			float: right;
		}
		.detail-content{
			width: 100%;
			height: auto;
		}
		
	</style>
	<script type="text/javascript">
	$(function(){
		
	});
	</script>
</head>
<body>
<%@ include file="menu.jsp" %>
 <!-- Masthead-->

	<header class="masthead">
		<div class="container">
			<c:forEach items="${boardlist }" var="l">
				<button onclick="location.href='${l.b_url }'">${l.b_catename }</button>
			</c:forEach>
		
			<h1>multiboard</h1>
			<c:choose>
				<c:when test="${ fn:length(list) gt 0}">
					<table class="table table-dark table-hover table-striped">
						<thead>
							<tr class="row">
								<th class="col-1">번호</th>
								<th class="col-5">제목</th>
								<th class="col-2">글쓴이</th>
								<th class="col-2">날짜</th>
								<th class="col-1">읽음</th>

							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list }" var="list">
								<tr class="row detail" onclick="location.href='./mbdetail?board=${param.board }&mbno=${list.mb_no}' ">
									<td class="col-1">${list.rowNum}</td>
									<td class="col-5 title">${list.mb_title}<c:if test="${row.commentcount ne 0 }">&nbsp;<span class="badge bg-secondary">${row.commentcount}</span></c:if></td>
									<td class="col-2">${list.m_name}</td>
									<td class="col-2">${list.mb_date}</td>
									<td class="col-1">${list.mb_read}</td>
								</tr>
								<tbody>
							</c:forEach>
						</tbody>
					</table></c:when><c:otherwise>
					<h1>게시판에 글이 없습니다.</h1></c:otherwise></c:choose>
			<c:if test="${sessionScope.mid ne null}">
			<button type="button" class="btn btn-secondary"	onclick="location.href='./mbwrite?board=${param.board}'">글쓰기</button>
			</c:if>
		</div>
	</header>


	<!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <!-- * *                               SB Forms JS                               * *-->
        <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>