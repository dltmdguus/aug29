<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> ❤ 글쓰기</title>
<!-- <script src="./js/jquery-3.7.0.min.js"></script> -->
<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<link href="css/styles.css" rel="stylesheet" />
<style type="text/css">
	.write-form {
		background-color: white;
		padding: 10px;
		text-align: left;
		color: black;
	}
	.write-form textarea {
		width: 99.5%;
		height: 500px;
	}
}
</style>
<script>
//제이쿼리일때
	$(function(){
		$(".writeBtn").click(function(){
			let id = $("#title").val();
			if(id == null || id == ""){
				alert("제목을 입력하세요.");
				$("#title").focus();
				return false;
			}
			let summernote = $("#summernote").val();
			if(summernote == null || summernote == ""){
				alert("내용을 입력하세요.");
				return false;
			}
			//위 두 검사가 성공한다면 form전송하기
			$("#form").submit();
		});
	});
</script>

</head>
<body>
	<%@ include file="menu.jsp"%>
	<!-- Masthead-->
	<header class="masthead">
		<div class="container">
			<div class="rounded-3 write-form">
			<form action="./write" method="post" id="form">
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text">제목</span>
					</div>
					<input type="text" class="form-control" id="title" name="title">
				</div>
				<textarea id="summernote" name="content"></textarea>
				<button type="button" class="btn btn-primary writeBtn">저장</button>
			</form>
			</div>
		</div>
	</header>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="js/scripts.js"></script>
<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
	  $('#summernote').summernote({
		  height: 500
	  });
	});
</script>
</body>
</html>