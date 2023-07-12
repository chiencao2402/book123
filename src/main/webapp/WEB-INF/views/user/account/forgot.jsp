<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/user/taglib.jsp"%>://www.springframework.org/tags/form"
prefix="form" %>


<head>
<title>Ðang nh?p tài kho?n</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<h2>Ð?I M?T KH?U</h2>
<h4>${message}</h4>
	<form action="/forgot" method="post">
	
		<div class="form-group">
			<label>Tên tài kho?n</label> <input name="id" class="form-control">
		</div>
		<div class="form-group">
			<label>M?t kh?u hi?n t?i</label> <input name="pw" class="form-control">
		</div>
		<div class="form-group">
			<label>M?t kh?u m?i</label> <input name="pw1" class="form-control">
		</div>
		<div class="form-group">
			<label>Xác nh?n m?t kh?u</label> <input name="pw2" class="form-control">
		</div>
		</div>
		<div class="form-group">
			<button class="btn btn-default">Ð?i m?t kh?u</button>
		</div>
	</form>
</body>
