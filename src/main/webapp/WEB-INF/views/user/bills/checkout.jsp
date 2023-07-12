<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<head>
<title>Thanh Toán</title>
</head>
<body>

	
	<div class="span9">
	
		<hr class="soft" />
		<div class="row">
			<div class="span4">
				<div class="well">
					<h5>Thanh Toán Giỏ Hàng</h5>
					<br />
						<form:form action="checkout" method="POST" modelAttribute="bills">
							<div class="control-group">
							<label class="control-label" for="inputEmail">Họ Và Tên
								</label>
							<div class="controls">
								<form:input type="text" class="span3"
									placeholder="Mời Bạn Nhập Họ Và Tên" path="display_name" />
							</div>
							<label class="control-label" for="inputEmail">Email</label>
								<div class="controls">
									<form:input type="email" class="span3"
										placeholder="Mời Bạn Nhập Email" path="user" />
								</div>
								<label class="control-label" for="inputEmail">Số Điện Thoại</label>
								<div class="controls">
									<form:input type="phone" class="span3"
										placeholder="Mời Bạn Nhập Số Điện Thoại" path="phone" />
								</div>
								<label class="control-label" for="inputEmail">Dia Chi</label>
								<div class="controls">
									<form:input type="address" class="span3"
										placeholder="Mời Bạn Nhập Địa Chỉ" path="address" />
								</div>
							</div>
							<div class="controls">
								<button type="submit" class="btn block">Xác Nhận</button>
							</div>
							<div style="color: red">${status}</div>
						</form:form>
						
						
<!-- Kiểm tra và hiển thị thông báo lỗi -->
<c:if test="${not empty errorMessage}">
    <div class="error-message">
        ${errorMessage}
    </div>
</c:if>
						
				</div>
			</div>
		</div>
</body>
