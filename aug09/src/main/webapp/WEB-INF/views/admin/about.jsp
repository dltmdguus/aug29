<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>❤ about</title>
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />
<script src="./js/jquery-3.7.0.min.js"></script>
<style type="text/css">
</style>
<script type="text/javascript">
	$(function() {

	});
</script>
</head>
<body>
	<%@ include file="menu.jsp"%>
	<!-- Masthead-->
	<header class="masthead">
		<div class="container">
			<div style="width: 100%; height: 100vh;">
				<h1>team</h1>
				<c:set var="num" value="1" />
				<div style="margin: 0 auto; width: 900px; height: auto; background-color: gray; text-align: center;">
					<div style="margin: 5px; background-color: gray; height: 30px; width: 100%;">
						<c:forEach items="${list }" var="i">
						${i }
						<c:if test="${num % 5 == 0 }"><br>
					</div>
					<div style="margin: 5px; background-color: gray; height: 30px; width: 100%;">
						</c:if>
						<c:set var="num" value="${num + 1 }" />
						</c:forEach>
					</div>
				</div>
			</div>

		</div>
	</header>

	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<!-- * *                               SB Forms JS                               * *-->
	<!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>