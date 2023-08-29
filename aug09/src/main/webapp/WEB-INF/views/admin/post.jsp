<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin || multiBoard</title>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel="stylesheet" href="../css/admin.css">
<link rel="stylesheet" href="../css/multiboard.css">
<script src="../js/jquery-3.7.0.min.js"></script>
<style type="text/css">
	 .boardlist {
        margin: 20px auto;
        text-align: center;
    }

    .gray {
        background-color: gray;
    }

    form {
        float: right;
    }
    
   table {
	   	border-collapse: collapse;
	   	margin: 0 auto;
	   	text-align: center;
	   	width: 800px;
	   	height: auto;
   }
   
   td, tr {
   		padding: 5px;
   }
   
   table:hover {
   		cursor: pointer;
   	}
    

</style>
<script type="text/javascript">
	$(function(){
		$(".title").click(function(){
			var mbno = $(this).siblings(".mbno").text();
            var mbdetail = $(this).parent().siblings("." + mbno);
            var mb_content = $(this).parent().siblings(".mb_detail").children();
            if (mb_content.is(":visible")) {
            	$.ajax({
					url: "./detail",
					type: "get",
					data: {mbno:mbno},
					dataType: "json",
					success: function (data) {
						mb_content.hide();
					},
					error: function (error) {
						alert("에러발생");
					}
				});
            }
            
           	if (!(mb_content.is(":visible"))) {
				$.ajax({
					url: "./detail",
					type: "get",
					data: {mbno:mbno},
					dataType: "json",
					success: function (data) {
						mbdetail.html('<td colspan="7" class="mb_content">' + data.content + '</td>');
					},
					error: function (error) {
						alert("에러발생");
					}
				});
            }
            
            
		});
	});
</script>
</head>
<body>
	<div class="container">
		<%@ include file="menu.jsp" %>
		<div class="main">
			<div class="article">	
			<h1>게시글 관리 ${list[0].count}개의 글이 있음</h1>	
				<div class="boardlist">
		            <button onclick="location.href='./post?cate=0'">전체보기</button>
					<c:forEach items="${boardlist}" var="b">
		            		<button onclick="location.href='./post?cate=${b.mb_cate}'">${b.b_catename }</button>
	            	</c:forEach>
	            	<form action="./post" method="get">
	            		<select name="searchN">
	            			<option value="title">제목</option>
	            			<option value="content">내용</option>
	            			<option value="nick">작성자</option>
	            			<option value="id">ID</option>
	            		</select>
	            		<input type="text" name="searchV" required="required">
	            		<input type="hidden" name="cate" value="${param.cate}">
	            		<button type="submit">검색</button>
	            	</form>
            	</div>
				<table>
					<tr>
						<th>번호</th>
						<th>카테고리</th>
						<th>제목</th>
						<th>작성자</th>
						<th>날짜</th>
						<th>조회수</th>
						<th>삭제여부</th>
					</tr>
					<c:forEach items="${list}" var="row">
					<tr class="<c:if test="${row.mb_del eq 0}">gray</c:if> mb_detail-container">
						<td class="mbno">${row.mb_no}</td> 
						<td>${row.b_catename}</td> 
						<td class="title">${row.mb_title}</td>
						<td>${row.m_name}(${row.m_id})</td>
						<td>${row.mb_date}</td>
						<td>${row.mb_read}</td>
						<td>${row.mb_del}</td>
					</tr>
					<tr class="${row.mb_no } mb_detail">
					</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</body>
</html>