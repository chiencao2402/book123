<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
<meta charset="UTF-8">
<title>Chi tiết sản phẩm</title>
<style>
	.product-content{
		overflow-x: hidden;
	}
</style>
</head>
<body>
<!-- 
Body Section 
-->
	<div class="row product-content">
<div id="sidebar" class="col-sm-3">


			  <div class="well well-small alert alert-warning cntr">
				  <h2>50% Discount</h2>
				  <p> 
					 only valid for online order. <br><br><a class="defaultBtn" href="#">Click here </a>
				  </p>
			  </div>
			 
		
			<br>
			<br>
			

	</div>
	<div class="col-sm-9" >
    <ul class="breadcrumb">
    <li><a href="index.html">Trang chủ</a> <span class="divider">/</span></li>
    <li><a href="products.html">Sản phẩm</a> <span class="divider">/</span></li>
    <li class="active">Chi tiết sản phẩm</li>
    </ul>	
	<div class="well well-small"  style="background: white">
	<div class="row-fluid">
			<div class="span5">
			<div id="myCarousel" class="carousel slide cntr">
                <div class="carousel-inner">
                  <div class="item active">
                   <a href="#"> <img src="<c:url value="/assets/user/img/${ products.img }"/>" alt="" style="width:100%"></a>
                  </div>
                </div>
                <a class="left carousel-control" href="#myCarousel" data-slide="prev">‹</a>
                <a class="right carousel-control" href="#myCarousel" data-slide="next">›</a>
            </div>
			</div>
			<div class="span7">
				<h3>${ products.bookName }</h3>
				<hr class="soft"/>
				
				<form class="form-horizontal qtyFrm" method="get" action="<c:url value="/AddCart/${ products.bookId }"/>">
				  <div class="control-group">
					<label class="control-label"><span><fmt:formatNumber type="number" groupingUsed="true" value="${ products.price }" />₫</span></label>
					<div class="controls">
					<input type="number" min="0" value="0" class="span6">
					</div>
				  </div>
				
				
				  <h4></h4>
				  <p>${ products.bookName }
				  <p>
				  <button type="submit" class="shopBtn" title="add to cart">
        <span class="icon-plus"></span> Thêm vào giỏ hàng
    </button>
				</form>
			</div>
			</div>
				<hr class="softn clr"/>


            <ul id="productDetail" class="nav nav-tabs">
              <li class="active"><a href="#home" data-toggle="tab">Chi tiết sản phẩm</a></li>
              <li class=""><a href="#profile" data-toggle="tab">Sản phẩm liên quan </a></li>
            </ul>
            <div id="myTabContent" class="tab-content tabWrapper">
            <div class="tab-pane fade active in" id="home">
			  	${ products.description }
			</div>
			<div class="tab-pane fade" id="profile">
			
			<c:set var="countList" value="${ productByIDCategory.size() }" />
			<c:if test="${ productByIDCategory.size() > 6 }">
				<c:set var="countList" value="6" />
			</c:if>
			
			<c:forEach var="item" items="${ productByIDCategory }" begin="1" end="${ countList }" varStatus="loop">
				<div class="row-fluid">	  
			<div class="span2">
				<img src="<c:url value="/assets/user/img/${ item.img }"/>" alt="">
			</div>
			<div class="span6">
				<h5>${ item.bookName } </h5>
				<p>
				${ item.bookName }
				</p>
			</div>
			<div class="span4 alignR">
			<form class="form-horizontal qtyFrm">
			<h3> <fmt:formatNumber type="number" groupingUsed="true" value="${ item.price }" />₫</h3>
			<div class="btn-group">
			
			  <<a href="<c:url value="/chi-tiet-san-pham/${ item.bookId }"/>" class="shopBtn">VIEW</a>
			 </div>
				</form>
			</div>
	</div>
			<hr class="soft"/>
			</c:forEach>
			
			</div>
              
            </div>

</div>
</div>
</div> <!-- Body wrapper -->
</body>