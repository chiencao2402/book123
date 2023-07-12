<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<head>
<title>Giỏ hàng</title>
</head>
<body>
<div class="row">
	<div class="span12">
    <ul class="breadcrumb">
		<li><a href="<c:url value="/home"/>">Trang Chủ</a> <span class="divider">/</span></li>
		<li class="active">Giỏ hàng</li>
    </ul>
	<div class="well well-small">
		<h1>Giỏ hàng <small class="pull-right"> Sản phẩm trong giỏ hàng </small></h1>
	<hr class="soften"/>	

	<table class="table table-bordered table-condensed">
              <thead>
                <tr>
                  <th>Hình ảnh</th>
                  <th>Mô tả</th> 
                  <th>Giá bán</th>
                  <th>Số lượng </th>
                  <th>Chỉnh sửa </th>
                  <th>Xóa </th>
                  <th>Tổng tiền</th>
				</tr>
              </thead>
              <tbody>
              
				<c:forEach var="item" items="${ Cart }">
					<tr>
	                  <td><img width="100" src="<c:url value="/assets/user/img/${ item.value.product.img }"/>" alt=""></td>
	                  <td>${ item.value.product.bookName }</td>
	
	                  <td></a> <span class="pull-right"><fmt:formatNumber
													type="number" groupingUsed="true" value="${ item.value.product.price }" /> ${ item.value.product.price } ₫<td>
						<input type="number" min="0" max="1000" class="span" style="max-width:34px" placeholder="1" id="quanty-cart-${ item.key }" size="16" type="text" value="${ item.value.quanty }">
					  </td>
	                  <td>
	                  	<button onclick="EditQuantCart()" class="btn btn-mini btn-danger" type="button">
	                  		<span class="icon-edit"></span>
	                  	</a>
	                  </td>
	                  <td>
	                  	<a href="<c:url value="/DeleteCart/${ item.key }"/>" class="btn btn-mini btn-danger" type="button">
	                  		<span class="icon-remove"></span>
	                  	</a>
	                  </td>
	                  <td><fmt:formatNumber type="number" groupingUsed="true" value="${ item.value.totalPrice }"/> ${ item.value.totalPrice } ₫</td>
	                </tr>
				</c:forEach>
                
				</tbody>
            </table><br/>
			
	<a href="<c:url value="/home"/>" class="shopBtn btn-large"><span class="icon-arrow-left"></span> Tiếp tục mua sắm </a>
	<a href="<c:url value="/checkout"/>" class="shopBtn btn-large pull-right">Thanh toán <span class="icon-arrow-right"></span></a>

</div>
</div>
</div>
</body>