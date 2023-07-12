<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<title>Product Form</title>

<body>
	<div class="container" style="text-align: center">
		<h2 style="font-size: 40pt ; margin-top: 50px">PRODUCT</h2>

		<!-- Trigger the modal with a button -->
		<button style="float: right" type="button" class="btn btn-info btn-lg btn-add"
			data-toggle="modal" data-target="#myModalAddProduct">Add
			Product</button><br><br><br>

			<input style="height: 2rem" class="form-control "
			id="myInput" type="text" placeholder="Search.."> <br>
		<table class="table table-bordered table-striped">
			<thead>
				<tr>
				<th><input type="checkbox" class="check checkbox"
						id="checkAll"></th>
					<th>ID</th>
					<th>Tên Sách</th>
					<th>Hình Ảnh</th>
					<th>Miêu Tả</th>
					<th style="width: 20%">Actions</th>
				</tr>
			</thead>
			<tbody id="myTable">
				<c:forEach var="product" items="${listProduct}">
					<tr>
					<td><input type="checkbox" class="check" name="check"
							value="${product.id}"></td>
						<td>${product.bookId}</td>
						<td>${product.bookName}</td>
						<td><img style="margin: 0 auto; width: 50px; height: 50px;"
							src="<c:url value="/assets/user/img/${product.img}"/>"
							alt="image error"> <br> <a id="titleImg"
							data-toggle="modal" data-target="#myModalDetailProduct">Detail </a> <input type="hidden" id="imgProduct" value="${product.img}"></td>
						
						<td>${product.description}</td>
						<td>
							<button style="margin-right: 20px" type="button"
								class="btn btn-warning btn-lg edit" data-toggle="modal"
								data-target="#myModalEditProduct">Edit Product</button>

							<button type="button" class="btn btn-danger btn-lg delete"
								data-toggle="modal" data-target="#myModalDeleteProduct">Delete</button>
							<input type="hidden" id="idProduct" value="${product.bookId}">
							<input type="hidden" id="nameProduct" value="${product.bookName}">
							<input type="hidden" id="img" value="${products.img}">
							<input type="hidden" id="descriptionProduct" value="${product.description}">

							<input type="hidden" id="idAuthorProduct" value="${product.authorId}">
							<input type="hidden" id="idCategoryProduct"value="${product.id}">				
							<input type="hidden" id="quantityProduct" value="${product.quantityRemain}">
							<input type="hidden" id="publisherProduct" value="${product.publisher}">
							<input type="hidden" id="publish_yearProduct"value="${product.publishYear}">
							<input type="hidden" id="avg_ratingProduct" value="${product.avgRating}">
						
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>




	<!-- Modal Delete Product -->
	<div id="myModalDeleteProduct" class="modal fade"
		style="background-color: transparent !important" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<form id="formDelete" action="" method="get">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Detele Product</h4>
					</div>
					<div class="modal-body">
						<p>Bạn Có chắc muốn xoá Product này không ?</p>

					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-success btn-lg">Delete</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

					</div>
				</form>
			</div>

		</div>
	</div>




	<!-- Modal Add Product -->
	<div id="myModalAddProduct" class="modal"
		style="background-color: transparent !important" role="dialog">
		<div class="modal-dialog modal-box">

			<!-- Modal content-->
			<div class="modal-content">
				<form:form action="product/add" method="post" enctype="multipart/form-data" id="formAddProduct" modelAttribute="product" >
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Add Product</h4>
					</div>
					<div class="modal-body">

						<div class="form-group col-lg-6">
							<label for="nameAddProduct">Name: </label>
							<form:input path="bookName"
								style="height: 2rem" class="form-control" id="nameAddProduct"
								placeholder="Enter name" />


						<label for="selectAuthorProduct">Author Name: </label>
							<form:select cssClass="form-control" path="authorId" id="selectAuthorProduct">
								   <form:option value="0" label="--SELECT--"/> 
								<form:options items="${listAuthor}" itemValue="id" itemLabel="name"/>
							</form:select>
							
								<label for="selectCategoryProduct">Category Name: </label>
							<form:select cssClass="form-control" path="id" id="selectCategoryProduct">
						  <form:option value="0" label="--SELECT--"/> 
								<form:options items="${listCategory}" itemValue="id" itemLabel="name"/>
							</form:select>
							
							<label for="priceAddProduct">Price: </label>
							
							<form:input path="price"
								cssClass="form-control" cssStyle="height: 2rem;" id="priceAddProduct"
								placeholder="Enter Price" />
								
								
								<label for="quantityAddProduct">Quantity Remain: </label>
								
								<form:input
								path="quantityRemain" cssClass="form-control" cssStyle="height: 2rem;"
								id="quantityAddProduct" placeholder="Enter Quantity"
							     />
						</div>

						<div class="form-group col-lg-6">
							<label for="publisherAddProduct">Publisher: </label>
							
							<form:input
								path="publisher" cssClass="form-control" cssStyle="height: 2rem;"
								id="publisherAddProduct" placeholder="Enter Publisher"/>
								
								<label for="publishYearAddProduct">Publish Year: </label>
								
								<form:input path="publishYear" cssClass="form-control" 
							      csStyle="height: 2rem;" id="publishYearAddProduct"
								placeholder="Enter publishYear" />
								
								<label for="avg_ratingAddProduct">AVG Rating: </label>
									<form:input path="avgRating" cssClass="form-control" 
							      csStyle="height: 2rem;" id="avg_ratingAddProduct"
								placeholder="Enter rating" />
								
									 <label
								for="imgAddProduct">Image: 
								</label>
								<input type="file" id="imgAddProduct" name="multipartFile" style="display: inline-block;"> 
								
								<img
								style="width: 50px; height: 50px" src="" id="photoAddProduct" name="img"
								hidden="true">
								
								<label for="descriptionAddProduct">Description:</label>
							<textarea rows="5" cols="100%" style="width:100%;height:115px" name="description"
								id="descriptionAddProduct"></textarea>


						</div>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-success btn-lg"
							id="submitAddProduct">Submit</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</form:form>
			</div>

		</div>

	</div>

	<!-- Modal Edit Product -->
	<div id="myModalEditProduct" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<form:form id="formEdit" action="product/update" method="post"  modelAttribute="product">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Edit Product</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							 <input type="text" style="height: 2rem" class="form-control hidden" id="idEditProduct" name="id">
						</div>
						<div class="form-group">
							<label for="nameProduct">Name:</label>
							
							<input type="text"
								style="height: 2rem" class="form-control" id="nameEditProduct"
								placeholder="Enter name" name="name" required>
						</div>
						<div class="form-group">
							<label for="descriptionProduct">Description:</label> <input
								type="text" class="form-control" style="height: 2rem"
								id="descriptionEditProduct" placeholder="Enter Description"
								name="description">
						</div>
						<div class="form-group">
							<label for="priceProduct">Price:</label>
							
							<input type="text"
								style="height: 2rem" class="form-control" id="priceEditProduct"
								placeholder="Enter price" name="price" required>
						</div>
						<div class="form-group">
							<label for="quantityRemainProduct">Quantity Remain:</label>
							
							<input type="text"
								style="height: 2rem" class="form-control" id="quantityRemainEditProduct"
								placeholder="Enter quantityRemain" name="quantityRemain" required>
						</div>
						
						<div class="form-group">
							<label for="publisherProduct">Publisher:</label>
							
							<input type="text"
								style="height: 2rem" class="form-control" id="publisherEditProduct"
								placeholder="Enter publisher" name="publisher" required>
						</div>
						
						<div class="form-group">
							<label for="publishYearProduct">Publish Year:</label>
							
							<input type="text"
								style="height: 2rem" class="form-control" id="publishYearEditProduct"
								placeholder="Enter publishYear" name="publishYear" required>
						</div>
						
						<div class="form-group">
							<label for="ImgProduct">Img:</label>
							
							<input type="text"
								style="height: 2rem" class="form-control" id="ImgEditProduct"
								placeholder="Enter Img" name="Img" required>
						</div>
						
						<div class="form-group">
							<label for="UpdateAtProduct">UpdateAt:</label>
							
							<input type="text"
								style="height: 2rem" class="form-control" id="UpdateAtEditProduct"
								placeholder="Enter UpdateAt" name="UpdateAt" required>
						</div>
						
						
						



					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-success btn-lg">Submit</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<input type="hidden" id="id" value="">
					</div>
				</form:form>>
			</div>

		</div>
	</div>








<script>
		$(document)
				.ready(
						function() {

							// Activate tooltip
							$('[data-toggle="tooltip"]').tooltip();
							
							
							
		//pagination
							
		$('#tableProduct').after('<div id="nav"></div>');
	
        var rowsShown = 15;
        var rowsTotal = $('#tableProduct tbody tr').length;
        var numPages = rowsTotal/rowsShown;
        for(i = 0;i < numPages;i++) {
            var pageNum = i + 1;
            $('#nav ul .prev ').append('<a href="#" class="listPagin" rel="'+i+'">'+pageNum+'</a> ');
        }
        $('#tableProduct tbody tr').hide();
        $('#tableProduct tbody tr').slice(0, rowsShown).show();
        $('#nav a:first').addClass('active');
        

        var currPage;
        var startItem;
        var endItem;
        $('#nav ul .listPagin').on('click', function(){
            $('#nav a').removeClass('active');
            $(this).addClass('active');
         currPage = $(this).attr('rel');
            startItem = currPage * rowsShown;
            endItem = startItem + rowsShown;
            $('#tableProduct tbody tr').css('opacity','0.0').hide().slice(startItem, endItem).
                    css('display','table-row').animate({opacity:1}, 300);
        });

       // Prev and Next chua fix xong 	
       
        $('#next').on('click', function(){
        	   $('#nav a').removeClass('active');
        	var relPagin = $(this).attr('rel');
        	$('#next').attr('rel',relPagin);
        	
            $(this).prev().addClass('active');
         currPage = $(this).attr('rel');
           startItem = currPage * rowsShown;
            endItem = startItem + rowsShown;
            $('#tableProduct tbody tr').css('opacity','0.0').hide().slice(startItem, endItem).
                    css('display','table-row').animate({opacity:1}, 300);
        });
        	
							
							

							// Edit Product

									$('table .edit').click(
									function() {
								
										var id = $(this).parent()
										.parent().find(
												'#idProduct')
										.text();

								var name = $(this).parent()
										.parent().find(
												'#nameProduct')
										.text();

								var author = $(this).parent()
										.parent()
										.find('#idAuthorProduct')
										.val();

								var category = $(this)
										.parent()
										.parent()
										.find(
												'#idCategoryProduct')
										.val();

								var price = $(this).parent()
										.parent()
										.find('#priceProduct')
										.text();

								var quantity = $(this)
										.parent()
										.parent()
										.find(
												'#quantityProduct')
										.text();

								var publisher = $(this)
										.parent()
										.parent()
										.find(
												'#publisherProduct')
										.val();

								var publish_year = $(this)
										.parent()
										.parent()
										.find(
												'#publish_yearProduct')
										.val();
								
								var description = $(this)
								.parent()
								.parent()
								.find(
										'#descriptionProduct')
								.val();

								var avg_rating = $(this)
										.parent()
										.parent()
										.find(
												'#avg_ratingProduct')
										.val();

								$('#idEditProduct').val(BookId);
								$('#nameEditProduct').val(
										BookName);
								
								$('#selectAuthorEditProduct option[value='+author+']').attr('selected','selected');
								$('#selectCategoryEditProduct option[value='+category+']').attr('selected','selected');
								
								var photo = $(this).parent().parent()
								.find('#imgProduct')
								.val();
						
						$('#photoEditProduct').attr('src','<c:url value="/assets/user/img/img-book/'+photo+'"/>');
						$("#photoEditProduct").removeAttr('hidden');
								
							
						
							
								$('#priceEditProduct').val(
										price);
								$('#quantityEditProduct')
										.val(quantity);
								$('#publisherEditProduct')
										.val(publisher);
								$('#publishYearEditProduct')
										.val(publish_year);
								
								$('#descriptionEditProduct')
								.text(description);
								
								$('#avg_ratingEditProduct')
										.val(avg_rating);

									});
							
							
							// Delete Muti Product
							$('.btn-all-delete').click(
									function() {
										var id = $('#checkAll').val();

										$('#formDelete').attr('action',
												'product/delete/' + id);

									});

							// Delete Product
							$('table .delete').click(
									function() {
										var id = $(this).parent().parent()
												.find('#idProduct').text();

										$('#formDelete').attr('action',
												'product/delete/' + id);
									});

							// Detail Product
							$('table #titleImg')
									.click(
											function() {
												var photo = $(this).parent()
														.find('#imgProduct')
														.val();

												$('#imgDetail')
														.attr('src',
																'<c:url value="/assets/user/img/img-book/'+photo+'"/>');
												
												//gán dữ liệu trường vào biến

												var id = $(this).parent()
														.parent().find(
																'#idProduct')
														.text();

												var name = $(this).parent()
														.parent().find(
																'#nameProduct')
														.text();

												var author = $(this).parent()
														.parent()
														.find('#authorProduct')
														.text();

												var category = $(this)
														.parent()
														.parent()
														.find(
																'#categoryProduct')
														.text();

												var price = $(this).parent()
														.parent()
														.find('#priceProduct')
														.text();

												var quantity = $(this)
														.parent()
														.parent()
														.find(
																'#quantityProduct')
														.text();

												var description = $(this)
												.parent()
												.parent()
												.find(
														'#descriptionProduct')
												.val();
												
										
												
												
												var publisher = $(this)
														.parent()
														.parent()
														.find(
																'#publisherProduct')
														.val();

												var publish_year = $(this)
														.parent()
														.parent()
														.find(
																'#publish_yearProduct')
														.val();

												var avg_rating = $(this)
														.parent()
														.parent()
														.find(
																'#avg_ratingProduct')
														.val();

												$('#idDetailProduct').text(id);
												$('#nameDetailProduct').text(
														name);
												$('#authorDetailProduct').text(
														author);
												$('#categoryDetailProduct')
														.text(id);
												$('#priceDetailProduct').text(
														price);
												$('#quantityDetailProduct')
														.text(quantity_remain);
												$('#publisherDetailProduct')
														.text(publisher);
												$('#publish_yearDetailProduct')
														.text(publish_year);
												$('#publishYearDetailProduct')
														.text(avg_rating);
												$('#descriptionDetailProduct')
												.text(description);
												$('#avg_ratingDetailProduct')
												.text(avg_rating);
												
												
											});

							// Check box all
							$("#checkAll").click(
									function() {
										$(".check").prop('checked',
												$(this).prop('checked'));

									});

							// check box để lấy ID product
							$(".check").click(function() {

								var text = "";
								var i;
								var checkBox = $('input:checkbox:checked');
								
								for (i = 0; i < checkBox.length; i++) {

									if ($('.check').is(':checked')) {
										text += checkBox[i].value + ",";
										$('.delete').addClass('disabled');
										$('.btn-all-delete').removeClass('disabled');
									}
									
									
								}
								if (checkBox.length == 0) {
									$('.delete').removeClass('disabled');
									$('.btn-all-delete').addClass('disabled');
								}
								var result = text.slice(0, -1)
								$("#checkAll").prop('value', result);
							});
							
							
							
							

							// Search
							$("#searchTableProduct")
									.on(
											"keyup",
											function() {
												var value = $(this).val()
														.toLowerCase();
												$("#myTable tr")
														.filter(
																function() {
																	$(this)
																			.toggle(
																					$(
																							this)
																							.text()
																							.toLowerCase()
																							.indexOf(
																									value) > -1)
																});
											});
							
							
				//Validation form Product
				
				
							
					  $("#formAddProduct").validate({
							onfocusout: false,
							onkeyup: false,
							onclick: false,
							rules: {
								"name": {
									required: true,
									maxlength: 60
								},
								"price": {
									required: true,
									 number: true
								},
								"author": {
									required: true,
									
								},
								"quantityRemain": {
									required: true,
									 number: true
								},
								"description": {
									required: false,
								},
								"publisher": {
									required: false,
									maxlength: 60
								},
								"publish_year": {
									required: false,
									 number: true,
									maxlength: 4
								},
								"img": {
									required: true,
								}
							},
					  
							messages: {
								"name": {
									required: "Bắt buộc nhập username",
									maxlength: "Hãy nhập tối đa 30 ký tự"
								},
								"price": {
									required: "Bạn chưa nhập giá tiền",
									number: "Bắt buộc nhập bằng số"
								},
								"author": {
									required: "Bạn chưa nhập tên tác giả ?",
									
								},
								"quantityRemain": {
									required: "Bạn chưa nhập số lượng ?",
									 number: "Bắt buộc nhập bằng số"
								},
								"description": {
									required: false,
								},
								"publisher": {
									
									maxlength: "Bạn đã nhập quá 60 ký tự"
								},
								"publish_year": {
								
									 number: "Năm xuất bản phải là số",
									maxlength: "Bạn nhập năm không đúng"
								},
								"img": {
									required: "Bạn chưa chọn hình sản phẩm",

							}
					  
							
							}
					  
					  
						});
				// Validate Edit
					  $("#formEditProduct").validate({
							onfocusout: false,
							onkeyup: false,
							onclick: false,
							rules: {
								"name": {
									required: true,
									maxlength: 60
								},
								"price": {
									required: true,
									 number: true
								},
								"author": {
									required: true,
									
								},
								"quantityRemain": {
									required: true,
									 number: true
								},
								"description": {
									required: false,
								},
								"publisher": {
									required: false,
									maxlength: 60
								},
								"publish_year": {
									required: false,
									 number: true,
									maxlength: 4
								},
								"img": {
									required: true,
								}
							},
					  
							messages: {
								"name": {
									required: "Bắt buộc nhập username",
									maxlength: "Hãy nhập tối đa 30 ký tự"
								},
								"price": {
									required: "Bạn chưa nhập giá tiền",
									number: "Bắt buộc nhập bằng số"
								},
								"author": {
									required: "Bạn chưa nhập tên tác giả ?",
									
								},
								"quantityRemain": {
									required: "Bạn chưa nhập số lượng ?",
									 number: "Bắt buộc nhập bằng số"
								},
								"description": {
									required: false,
								},
								"publisher": {
									
									maxlength: "Bạn đã nhập quá 60 ký tự"
								},
								"publish_year": {
								
									 number: "Năm xuất bản phải là số",
									maxlength: "Bạn nhập năm không đúng"
								},
								"img": {
									required: "Bạn chưa chọn hình sản phẩm",

							}
					  
							
							}
					  
					  
						});
							
				
				
					

						});
		// END Reddy	
		
		
		
			// Add File Image
		$(document).on("change", "#imgAddProduct", function(event) {
			var img = $(this).prev();
			var reader = new FileReader();
			reader.onload = function() {

				$(img).attr('src', reader.result);
				$("#photoAddProduct").attr('src', reader.result);
				$("#photoAddProduct").removeAttr('hidden');

			};
			reader.readAsDataURL(event.target.files[0]);
		});
		
			
		// Edit File Image
		$(document).on("change", "#imgEditProduct", function(event) {
			var img = $(this).prev();
			var reader = new FileReader();
			reader.onload = function() {

				$(img).attr('src', reader.result);
				$("#photoEditProduct").attr('src', reader.result);
				

			};
			reader.readAsDataURL(event.target.files[0]);
		});
		
	


		
	</script>
</body>
</html>