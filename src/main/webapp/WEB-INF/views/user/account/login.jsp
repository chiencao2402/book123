<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/user/tagib.jsp" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>



<head>
<title>Đăng nhập tài khoản</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
.modal-header, h4, .close {
	background-color: #5cb85c;
	color: white !important;
	text-align: center;
	font-size: 30px;
}

.modal-footer {
	background-color: #f9f9f9;
}
</style>
</head>
<body>
<h2>Đăng Nhập</h2>
<h4>${message}</h4>
<form action="dang-nhap" method="post">

    <div class="form-group">
        <label>Người Dùng</label> <input name="username" class="form-control" value="${username}">
    </div>
    <div class="form-group">
        <label>Mật Khẩu</label> <input name="password" class="form-control" value="${password}">
    </div>
    <div class="form-group">
        <div class="form-control">
            <input name="rm" type="checkbox"> <label>Nhớ tài khoản</label>
        </div>
    </div>
    <div class="form-group">
        <button class="btn btn-default">Login</button>
    </div>
</form>

</body>
