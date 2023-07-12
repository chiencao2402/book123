<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<title>Trang chủ</title>
<body>

	<!-- 
Body Section 
-->
	<div class="row">
		<div id="sidebar" class="col-sm-3">
			<div class="well well-small">
				<ul class="nav nav-list" style="background: #F8C471">

					<c:forEach var="item" items="${ categorys }">
						<li><a href='<c:url value="/san-pham/${ item.id }"/>'><span
								class="icon-circle-blank"></span> ${ item.name }</a></li>
						<li>
					</c:forEach>
					
					<li><a class="totalInCart" href="<c:url value="/gio-hang"/>"><strong>Đã
								mua <span class="badge badge-warning pull-right" style="background-color: #D8E5AA"
								style="line-height: 18px;"><fmt:formatNumber type="number" groupingUsed="true" value="${ TotalPriceCart }"/> ₫</span>
						</strong></a></li>
				</ul>
			</div>

			
			
		</div>
		<div class="col-sm-9">
			<div class="well np">
				<div id="myCarousel" class="carousel slide homCar">

					<div class="carousel-inner">
						<c:forEach var="item" items="${ slides }" varStatus="index">
							<c:if test="${ index.first }">
								<div class="item active">
							</c:if>
							<c:if test="${ not index.first }">
								<div class="item">
							</c:if>
							<img style="width: 100%"
								src="<c:url value="/assets/user/img/slide/${ item.img }"/>"
								alt="bootstrap ecommerce templates">
							<div class="carousel-caption">
								<h4>${ item.caption }</h4>
								<p>
									<span>${ item.content }</span>
								</p>
							</div>
					</div>
					</c:forEach>
				</div>

				<a class="left carousel-control" href="#myCarousel"
					data-slide="prev">&lsaquo;</a> <a class="right carousel-control"
					href="#myCarousel" data-slide="next">&rsaquo;</a>
			</div>
		</div>
		
		
		
		
		
		<c:choose>
			<c:when test="${empty param.searching}">
					
		<div class="well well-small" style="background: #AED6F1">
					<h3>Sản phẩm mới</h3>
			<hr class="soften" />
			<div class="row-fluid">
				<div id="newProductCar" class="carousel slide">
					<div class="carousel-inner">
						<c:if test="${ products.size() > 0 }">
							<div class="item active">
								<ul class="thumbnails">
									<c:forEach var="item" items="${ products }" varStatus="loop">
										<li class="span4" >
											<div class="thumbnail" style="height:400px">
												<a class="zoomTool" href="<c:url value="/chi-tiet-san-pham/${ item.bookId }" />"
													title="add to cart"><span class="icon-search" > QUICK VIEW</span>
													</a> <a href="<c:url value="/chi-tiet-san-pham/${ item.bookId }"/>"><img
													src="<c:url value="/assets/user/img/${ item.img }"/>"
													alt=""></a>
													<div class="caption">
										<h5>${ item.bookName }</h5>
										<h4>
											<a class="defaultBtn" href="<c:url value="chi-tiet-san-pham/${item.id}"/>"
												title="Click to view"><span class="icon-zoom-in"></span></a>
											<a class="shopBtn" href="<c:url value="/AddCart/${ item.bookId }"/>" title="add to cart"><span
												class="icon-plus"></span></a> <span class="pull-right"><fmt:formatNumber
													type="number" groupingUsed="true" value="${ item.price }" />
												₫</span>
										</h4>
									</div>
											</div>
										</li>
										<c:if
											test="${ (loop.index + 1) % 3 == 0 || (loop.index + 1)  == products.size() }">
								</ul>
							</div>
							<c:if test="${ (loop.index + 1) < products.size() }">
								<div class="item">
									<ul class="thumbnails">
							</c:if>
						</c:if>
						</c:forEach>
						</c:if>

					</div>
					<a class="left carousel-control" href="#newProductCar"
						data-slide="prev">&lsaquo;</a> <a class="right carousel-control"
						href="#newProductCar" data-slide="next">&rsaquo;</a>
				</div>
			</div>

		</div>
	
			
			</c:when>
			<c:otherwise></c:otherwise>
		</c:choose>
	
		<!--
	Featured Products
	-->
		<div class="well well-small" style="background: #AED6F1">
			<h3>
				<a class="btn btn-mini pull-right" href="products.html"
					title="View more">VIew More<span class="icon-plus"></span></a> Sản
				phẩm nổi bật
			</h3>
			<hr class="soften" />
			<div class="row-fluid">

				<c:if test="${ products.size() > 0 }">
					<ul class="thumbnails">

						<c:forEach var="item" items="${ products }" varStatus="loop">
							<li class="span4" style="height:400px">
								<div class="thumbnail">
									<a class="zoomTool" href="<c:url value="/chi-tiet-san-pham/${ item.bookId }" />"
													title="add to cart"><span class="icon-search" > QUICK VIEW</span>
													</a> <a href="<c:url value="/chi-tiet-san-pham/${ item.id }"/>"><img
													src="<c:url value="/assets/user/img/${ item.img }"/>"
													alt=""></a>
									<div class="caption">
										<h5>${ item.bookName }</h5>
										<h4>
											<a class="defaultBtn" href="<c:url value="/chi-tiet-san-pham/${ item.bookId }" />"
												title="Click to view"><span class="icon-zoom-in"></span></a>
											<a class="shopBtn" href="<c:url value="/AddCart/${ item.bookId }"/>" title="add to cart"><span
												class="icon-plus"></span></a> <span class="pull-right"><fmt:formatNumber
													type="number" groupingUsed="true" value="${ item.price }" />
												₫</span>
										</h4>
									</div>
								</div>
							</li>

							<c:if
								test="${ (loop.index + 1) % 3 == 0 || (loop.index + 1)  == products.size() }">
					</ul>
					<c:if test="${ (loop.index + 1) < products.size() }">
						<ul class="thumbnails">
					</c:if>
				</c:if>

				</c:forEach>

				</c:if>

			</div>
		</div>
		<hr>
		
		
		<c:choose>
			<c:when test="${empty param.searching}">
			<div class="well well-small" style="background: #AED6F1">
			<h3>
				<!-- <a class="btn btn-mini pull-right" onClick="seeMoreProducts()">Xem thêm <span
				class="icon-plus"></span></a> Tất cả sản phẩm -->
				<a class="btn btn-mini pull-right" href="home?seeMore=true">Xem thêm <span
				class="icon-plus"></span></a> Tất cả sản phẩm
			</h3>
			<hr class="soften" />
			<div class="row-fluid">
			
				<c:if test="${ allProducts.size() > 0 }">
					<ul class="thumbnails">

						<c:forEach var="item" items="${ allProducts }" varStatus="loop">
							<li class="span4">
								<div class="thumbnail">
									<a class="zoomTool" href="<c:url value="/chi-tiet-san-pham/${ item.id }" />"
													title="add to cart"><span class="icon-search" > QUICK VIEW</span>
													</a> <a href="<c:url value="/chi-tiet-san-pham/${ item.id }"/>"><img
													src="<c:url value="/assets/user/img/${ item.img }"/>"
													alt=""></a>
									<div class="caption">
										<h5>${ item.bookName }</h5>
										<h4>
											<a class="defaultBtn" href="<c:url value="/chi-tiet-san-pham/${ item.id }" />"
												title="Click to view"><span class="icon-zoom-in"></span></a>
											<a class="shopBtn" href="<c:url value="/AddCart/${ item.id }"/>" title="add to cart"><span
												class="icon-plus"></span></a> <span class="pull-right"><fmt:formatNumber
													type="number" groupingUsed="true" value="${ item.price }" />
												₫</span>
										</h4>
									</div>
								</div>
							</li>

							<c:if
								test="${ (loop.index + 1) % 3 == 0 || (loop.index + 1)  == allProducts.size() }">
					</ul>
					<c:if test="${ (loop.index + 1) < allProducts.size() }">
						<ul class="thumbnails">
					</c:if>
				</c:if>
				
				</c:forEach>

				</c:if>
			
			</div>
		</div>
			
			</c:when>
			<c:otherwise></c:otherwise>
		</c:choose>
		
		
	</div>
	</div>
	
	
	<script type="text/javascript">
		function seeMoreProducts() {
			$.ajax({
				type: "GET",
				contentType: "application/json",
				url: "home/seeMore",
				success: function(data) {
					console.log(data);
					const dataRes = JSON.parse(data);
					console.log(dataRes);
					
					let htmlRes;
					for(var i = 0; i<dataRes.length; i++) {
						htmlRes += 
							<li class="span4">
								<div class="thumbnail">
									<a class="zoomTool" href="/BookShop/chi-tiet-san-pham/\${dataRes[i].bookId}" title="add to cart" style="display: none;"><span class="icon-search"> QUICK VIEW</span>
													</a> <a href="/BookShop/chi-tiet-san-pham/\${dataRes[i].bookId}"><img src="/BookShop/assets/user/img/\${dataRes[i].img}" alt=""></a>
									<div class="caption">
										<h5>\${dataRes[i].bookName}</h5>
										<h4>
											<a class="defaultBtn" href="/BookShop/chi-tiet-san-pham/\${dataRes[i].bookId}" title="Click to view"><span class="icon-zoom-in"></span></a>
											<a class="shopBtn" href="/BookShop/AddCart/\${dataRes[i].bookId}" title="add to cart"><span class="icon-plus"></span></a> <span class="pull-right">\${dataRes[i].price}
												₫</span>
										</h4>
									</div>
								</div>
							</li>`
					}
					
					
					$("#allProductDisplay").empty();
					$("#allProductDisplay").html(htmlRes);
				},
				error: function(e) {
					console.log("Error: " + e);
				}
			})
		}
	
	</script>
</body>