<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/user/tagib.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>



<head>
<title>Đăng nhập tài khoản</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<h2>ĐĂNG KÝ</h2>
<h4>${message}</h4>
<form:form method="post" action="dang-ky" modelAttribute="form">

    <div class="form-group">
        <label>Người dùng</label>
        <form:input path="username" class="form-control" placeholder="Mời bạn nhập tên người dùng" />
        <form:errors path="username"></form:errors>
    </div>
    <div class="form-group">
        <label>Mật khẩu</label>
        <form:input path="password" class="form-control" placeholder="Mời bạn nhập mật khẩu" />
        <form:errors path="password"></form:errors>
    </div>
    <div class="form-group">
        <label>Họ và tên</label>
        <form:input path="fullname" class="form-control" placeholder="Mời bạn nhập họ và tên" />
        <form:errors path="fullname"></form:errors>
    </div>
    <div class="form-group">
        <label>Email</label>
        <form:input path="email" class="form-control" placeholder="Mời bạn nhập email" />
        <form:errors path="email" />
    </div>
    <div class="form-group">
        <label>Số điện thoại</label>
        <form:input path="phone" class="form-control" placeholder="Mời bạn nhập số điện thoại" />
        <form:errors path="phone"></form:errors>
    </div>
    
    <div class="form-group">
        <button class="btn btn-default btn-center">Đăng Ký</button>
    </div>
    
</form:form>

</body>
