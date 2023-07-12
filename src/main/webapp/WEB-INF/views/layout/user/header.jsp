<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<header id="header" style="background-color: #009FC9" class="style__HeaderRevamp-sc-q53692-1 eDISBe">
	<div class="row" style="display: flex">
		<div class="span4" style="flex-grow: 1">
			<h1>
				<a class="logo" href="index.html"><span></span> <img
					src="<c:url value="/assets/user/img/logoshop.png" />"
					alt="bootstrap sexy shop"> </a>
			</h1>
		</div>
		<div class="span4 alignR" style="flex-grow: 1; display: flex; justify-content: center; align-items: center; flex-direction: rows;">
			<p>
				 <strong> Support (24/7) : 0800 1234 678 </strong>
				
			</p>
			<span class="btn btn-mini"> ${ TotalQuantyCart }  <span
				class="icon-shopping-cart"></span></span> <span
				class="btn btn-warning btn-mini">$</span> <span class="btn btn-mini">&pound;</span>
			<span class="btn btn-mini">&euro;</span>
		</div>
	</div>
</header>

<!--
Navigation Bar Section 
-->
<div class="navbar">
	<div class="navbar-inner">
		<div class="container">
			<a data-target=".nav-collapse" data-toggle="collapse"
				class="btn btn-navbar"> <span class="icon-bar"></span> <span
				class="icon-bar"></span> <span class="icon-bar"></span>
			</a>
			<div class="nav-collapse">
				<ul class="nav">
					<c:forEach var="item" items="${menus}" varStatus="index">
						<c:if test="${index.first}">
							<li class="active">
						</c:if>
						<c:if test="${ not index.first }">
							<li class="">
						</c:if>
						<a href="index.html">${ item.name } </a>
						</li>
					</c:forEach>

				</ul>
				
					<form action="/BookShop/search" method="get" class="navbar-search pull-left">
					<input type="text" placeholder="Search" class="search-query span2" name="search-value">
				</form>
			</div>
		</div>
	</div>
</div>