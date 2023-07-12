<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<title>Category Form</title>

<body>
	<div class="container" style="text-align: center">
		<h2 style="font-size: 40pt ; margin-top: 50px">CATEGORY</h2>

		<!-- Trigger the modal with a button -->
		<button style="float: right" type="button" class="btn btn-info btn-lg btn-add"
			data-toggle="modal" data-target="#myModalAddCategory">Add
			Category</button><br><br><br>

			<input style="height: 2rem" class="form-control "
			id="myInput" type="text" placeholder="Search.."> <br>
		<table class="table table-bordered table-striped">
			<thead>
				<tr>
					<th>ID</th>
					<th>Name</th>
					<th>Description</th>
					<th style="width: 30%">Actions</th>
				</tr>
			</thead>
			<tbody id="myTable">
				<c:forEach var="categorys" items="${listCategory}">
					<tr>
						<td>${categorys.id}</td>
						<td>${categorys.name}</td>
						<td>${categorys.description}</td>
						<td>
							<button style="margin-right: 20px" type="button"
								class="btn btn-warning btn-lg edit" data-toggle="modal"
								data-target="#myModalEditCategory">Edit Category</button>

							<button type="button" class="btn btn-danger btn-lg delete"
								data-toggle="modal" data-target="#myModalDeleteCategory">Delete</button>
							<input type="hidden" id="idCategory" value="${categorys.id}">
							<input type="hidden" id="nameCategory" value="${categorys.name}">
							<input type="hidden" id="descriptionCategory"
							value="${categorys.description}">
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>



	<!-- Modal Delete Category -->
	<div id="myModalDeleteCategory" class="modal fade"
		style="background-color: transparent !important" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<form id="formDelete" action="" method="get">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Detele Category</h4>
					</div>
					<div class="modal-body">
						<p>Are you sure you want to delete this Category??</p>

					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-success btn-lg">Delete</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

					</div>
				</form>
			</div>

		</div>
	</div>




	<!-- Modal Add Category -->
	<div id="myModalAddCategory" class="modal fade"
		style="background-color: transparent !important" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
    <form:form action="category/add" method="post" modelAttribute="category">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">Add Category</h4>
        </div>
        <div class="modal-body">
            <div class="form-group">
                <label for="nameAddCategory">Name:</label>
                <input type="text" style="height: 2rem" class="form-control" id="nameAddCategory"
                    placeholder="Enter name" name="name" required min="3" max="50">
            </div>
            <div class="form-group">
                <label for="descriptionAddCategory">Description:</label>
                <input type="text" class="form-control" style="height: 2rem;" id="descriptionAddCategory"
                    placeholder="Enter Description" name="description">
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

	<!-- Modal Edit Category -->
	<div id="myModalEditCategory" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<form:form id="formEdit" action="category/update" method="post" modelAttribute="category">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Edit Category</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							 <input type="text" style="height: 2rem" class="form-control hidden" id="idEditCategory" name="id">
						</div>
						<div class="form-group">
							<label for="nameCategory">Name:</label>
							
							<input type="text"
								style="height: 2rem" class="form-control" id="nameEditCategory"
								placeholder="Enter name" name="name" required>
						</div>
						<div class="form-group">
							<label for="descriptionCategory">Description:</label> <input
								type="text" class="form-control" style="height: 2rem"
								id="descriptionEditCategory" placeholder="Enter Description"
								name="description">
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

							// Delete Category
							$('table .delete').click(
									function() {
										var id = $(this).parent().find(
												'#idCategory').val();
										$('#formDelete').attr('action',
												'categorys/delete/' + id);
									});

							//Edit Category
							$('table .edit').click(
									function() {
										var id = $(this).parent().find(
												'#idCategory').val();
										var name = $(this).parent().find(
												'#nameCategory').val();
										var description = $(this).parent().find('#descriptionCategory').val();
										$('#nameEditCategory').val(name);
										$('#descriptionEditCategory').val(description);
										$('#idEditCategory').val(id);

									});
							
							
			
							
							
						
							// Search
							  $("#myInput").on("keyup", function() {
							    var value = $(this).val().toLowerCase();
							    $("#myTable tr").filter(function() {
							      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
							    });
							  });
						
					
						});
		
		
		//validation
		  
	</script>

</body>
</html>