<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<title>Author Form</title>

<body>
	<div class="container" style="text-align: center">
		<h2 style="font-size: 40pt ; margin-top: 50px">AUTHOR</h2>

		<!-- Trigger the modal with a button -->
		<button style="float: right" type="button" class="btn btn-info btn-lg btn-add"
			data-toggle="modal" data-target="#myModalAddAuthor">Add
			Author</button><br><br><br>

			<input style="height: 2rem" class="form-control "
			id="myInput" type="text" placeholder="Search.."> <br>
		<table class="table table-bordered table-striped">
			<thead>
				<tr>
					<th>ID</th>
					<th>Tên Tác Giả</th>
			
					<th style="width: 30%">Actions</th>
				</tr>
			</thead>
			<tbody id="myTable">
				<c:forEach var="author" items="${listAuthor}">
					<tr>
						<td id="idAuthor">${author.id}</td>
						<td id="nameAuthor">${author.name}</td>
						
						<td>
							<button style="margin-right: 20px" type="button"
								class="btn btn-warning btn-lg edit" data-toggle="modal"
								data-target="#myModalEditAuthor">Edit Author</button>
		
							<button type="button" class="btn btn-danger btn-lg delete"
								data-toggle="modal" data-target="#myModalDeleteAuthor">Delete</button>
						
						
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>



	<!-- Modal Delete Author -->
	<div id="myModalDeleteAuthor" class="modal fade"
		style="background-color: transparent !important" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<form id="formDelete" action="" method="get">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Detele Author</h4>
					</div>
					<div class="modal-body">
						<p>Bạn Có chắc muốn xoá thể loại này này không ?</p>
						<p>Cảnh báo!!! Các sản phẩm có cùng thể loại sẻ bị xoá !!!! </p>

					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-success btn-lg">Delete</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

					</div>
				</form>
			</div>

		</div>
	</div>




	<!-- Modal Add Author -->
	<div id="myModalAddAuthor" class="modal fade"
		style="background-color: transparent !important" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<form:form id="formAddAuthor" action="author/add" method="post" modelAttribute="author">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Add Author</h4>
					</div>
					<div class="modal-body">

						<div class="form-group">
							<label for="nameAddAuthor">Name:</label>	
							<form:input path="name"
								cssStyle="height: 2rem" cssClass="form-control" id="nameAddAuthor"
								placeholder="Enter name" />
						</div>
						
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-success btn-lg">Submit</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</form:form>
			</div>

		</div>

	</div>

	<!-- Modal Edit Author -->
	<div id="myModalEditAuthor" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<form:form id="formEditAuthor" action="author/update" method="post" modelAttribute="author">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Edit Author</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							 <form:input path="id" cssStyle="height: 2rem" cssClass="form-control hidden" id="idEditAuthor" />
						</div>
						<div class="form-group">
							<label for="nameEditAuthor">Name:</label>
							
							<form:input path="name"
								cssStyle="height: 2rem" cssClass="form-control" id="nameEditAuthor"
								placeholder="Enter name" />
						</div>
						
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-success btn-lg">Submit</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<input type="hidden" id="id" value="">
					</div>
				</form:form>
			</div>

		</div>
	</div>









	<script>
		$(document)
				.ready(
						function() {

							// Activate tooltip
							$('[data-toggle="tooltip"]').tooltip();

					
							
							
							
							// Delete Author
							$('table .delete').click(
									function() {
										var id = $(this).parent().parent().find(
												'#idAuthor').text();
										$('#formDelete').attr('action',
												'author/delete/' + id);
									});

							//Edit Author
							$('table .edit').click(
									function() {
										var id = $(this).parent().parent().find(
												'#idAuthor').text();
										
										var name = $(this).parent().parent().find(
												'#nameAuthor').text();

										$('#idEditAuthor').val(id);
										$('#nameEditAuthor').val(name);

									});
						
							
							
						
							// Search
							  $("#myInput").on("keyup", function() {
							    var value = $(this).val().toLowerCase();
							    $("#myTable tr").filter(function() {
							      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
							    });
							  });
						
							
							
								
								
								//validation form Add Author
							
							  $("#formAddAuthor").validate({
									onfocusout: false,
									onkeyup: false,
									onclick: false,
									rules: {
										"name": {
											required: true,
											maxlength: 30
										},
										"description": {
									
											maxlength: 30
										}
										
										
								
									},
							  
									messages: {
										"name": {
											required: "Bắt buộc nhập username",
											maxlength: "Hãy nhập tối đa 30 ký tự"
										},
										"description": {
										
											maxlength: "Hãy nhập tối đa 30 ký tự"
										}
										
									}
							  
							  
							  
								});
								
								
							  $("#formEditAuthor").validate({
									onfocusout: false,
									onkeyup: false,
									onclick: false,
									rules: {
										"name": {
											required: true,
											maxlength: 30
										},
										"description": {
									
											maxlength: 30
										}
										
										
								
									},
							  
									messages: {
										"name": {
											required: "Bắt buộc nhập username",
											maxlength: "Hãy nhập tối đa 30 ký tự"
										},
										"description": {
										
											maxlength: "Hãy nhập tối đa 30 ký tự"
										}
										
									}
							  
							  
							  
								});
								
								
								
								
					
						});// End readdy

		  
	</script>

</body>
</html>