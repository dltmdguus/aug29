<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin || main</title>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel="stylesheet" href="../css/admin.css">
<style type="text/css">
.article{
	margin: 0 auto;
	padding: 10px;
	width: 800px;
	height: 100vh;
	box-sizing: border-box;
	background-color: #FFB6C1;	
}
input{
	width: 100%;
	height: 30px;
	margin-bottom: 5px;
}
textarea {
	width: 100%;
	height: 500px;
}
button {
	width: 200px;
	height: 50px;
}
</style>
</head>
<body>
	<div class="container">
<%@ include file="menu.jsp" %>
		<div class="main">
			<div class="article"> 
				<h1>메일보내기</h1>
				<form action="./mail" method="post">
					<input type="text" name="title" placeholder="제목을 적어주세요">
					<input type="text" name="to" placeholder="받는 사람 email주소를 적어주세요">
					<textarea name="cotent"></textarea>
					<button type="submit">메일보내기</button>
				</form>

				
			</div>
		</div>
	</div>


</body>
</html>