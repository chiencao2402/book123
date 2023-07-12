<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/user/tagib.jsp" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>



<head>
<title>�ang nh?p t�i kho?n</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<h2>Cập Nhật Tài Khoản</h2>
<h4>${message}</h4>
	<form:form action="/dang-ky" method="post">
	
		<div class="form-group">
			<label>Người Dùng</label> 
			<form:input path="username" class="form-control" readonly="true" placeholder="Mời bạn nhập username"/>
		</div>
		<div class="form-group">
			<label>Họ Và Tên</label> 
			<form:input path="fullname" class="form-control" placeholder="M?i b?n nh?p h? v� t�n" />
		</div>
		
		<div class="form-group">
			<label>Email</label> 
			<form:input path="email" class="form-control"placeholder="M?i b?n nh?p email" />
		</div>
		<div class="form-group">
			<label>Số Điện Thọai</label> 
			<form:input path="phone" class="form-control" placeholder="M?i b?n nh?p s? di?n tho?i" />
		</div>
		<div class="form-group">
			<form:hidden path="pw" />
			<form:hidden path="activated" />
			<form:hidden path="admin" />
			<button class="btn btn-default">�ang K�</button>
		</div>
	</form:form>
</body>
