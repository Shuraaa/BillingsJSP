<%@page import="java.awt.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="model.*"%>
<%@page import="Dao.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js">
</script>
<![endif]-->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Add</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">

</head>
<body class="hold-transition skin-blue sidebar-mini">

	<%
		if (session.getAttribute("username") == null) {
			response.sendRedirect("login.jsp");
		} else {
	%>

	<div class="wrapper">

		<!-- Include this in all index page -->
		<jsp:include page="sideBar.jsp"></jsp:include>
		<!-- /.Include this in all index page -->

		<!-- Wrapper Contents -->
		<div class="content-wrapper">

			<!-- Content Header (Page header) -->
			<section class="content-header">
			<h1>Thêm mới</h1>
			<ol class="breadcrumb">
				<li><a href="index.jsp"><i class="fa fa-dashboard"></i>
						BillingsSystem</a></li>
				<li><a href="#">Quản trị hệ thống</a></li>
				<li><a href="admin_bangma.jsp">Bảng mã cuộc gọi</a></li>
				<li class="active">Thêm</li>
			</ol>
			</section>

			<!-- Main content -->
			<section class="content">
			<div class="row">
				<div class="col-sm-12">
					<!-- Cập nhật thông tin -->
					<div class="box box-primary">
						<div class="box-header with-border">
							<h3 class="box-title">
								<i class="fa fa-pencil-square"></i> Thông tin
							</h3>
						</div>

						<form action="<%=request.getContextPath()%>/ManagerBangMa" method="get" role="form" class="form-horizontal"
							id="form">
							<div class="box-body">

								<!-- Form group -->
								<div class="form-group">
									<label for="input_name" class="col-sm-2 control-label">Tên:
									</label>
									<div class="col-sm-5">
										<input type="text" class="form-control" name="ten"
											placeholder="Name" id="codename" maxlength="30">
									</div>
								</div>

								<!-- Form group -->
								<div class="form-group">
									<label for="input_Ma" class="col-sm-2 control-label">Mã
										quy ước: </label>
									<div class="col-sm-5">
										<input type="text" class="form-control" name="maquyuoc"
											placeholder="Code" id="code" maxlength="30">
									</div>
								</div>

								<!-- Form group -->
								<div class="form-group">
									<label for="input_length" class="col-sm-2 control-label">Chiều
										dài: </label>
									<div class="col-sm-5">
										<input type="text" class="form-control" name="chieudai"
											placeholder="Length" id="length" maxlength="3">
									</div>
								</div>
								
								<!-- Form group -->
								<div class="form-group">
									<label for="inputCompany" class="col-sm-2 control-label">Loại cuộc gọi: </label>
									<div class="col-sm-4">
										<select class="form-control" name="loaicuocgoi">
											<option value="A" >Nội hạt</option>
											<option value="B" >Di động</option>
											<option value="C" >Liên tỉnh</option>
											<option value="D" >Quốc tế</option>
											<option value="E" >Dịch vụ</option>
										</select>

									</div>
								</div>

								<!-- Form group -->
								<div class="form-group">
									<label for="input_block1s" class="col-sm-2 control-label">Block
										1s: </label>
									<div class="col-sm-6">
										<div class="col-sm-5">
											<input type="text" class="form-control" name="block1sfpt"
												placeholder="FPT" id="block1sfpt" maxlength="30">
										</div>
										<div class="col-sm-5">
											<input type="text" class="form-control" name="block1scmc"
												placeholder="CMC" id="block1scmc" maxlength="30">
										</div>
									</div>
								</div>

								<!-- Form group -->
								<div class="form-group">
									<label for="input_block6s" class="col-sm-2 control-label">Block
										6s: </label>
									<div class="col-sm-6">
										<div class="col-sm-5">
											<input type="text" class="form-control" name="block6sfpt"
												placeholder="FPT" id="block6sfpt" maxlength="30">
										</div>
										<div class="col-sm-5">
											<input type="text" class="form-control" name="block6scmc"
												placeholder="CMC" id="block6s" maxlength="30">
										</div>
									</div>
								</div>

								<!-- Form group -->
								<div class="form-group">
									<label for="input_block10s" class="col-sm-2 control-label">Block
										10s: </label>
									<div class="col-sm-6">
										<div class="col-sm-5">
											<input type="text" class="form-control" name="block10sfpt"
												placeholder="FPT" id="block10sfpt" maxlength="30">
										</div>
										<div class="col-sm-5">
											<input type="text" class="form-control" name="block10scmc"
												placeholder="CMC" id="block10scmc" maxlength="30">
										</div>
									</div>
								</div>

								<!-- Form group -->
								<div class="form-group">
									<label for="input_block1m" class="col-sm-2 control-label">Block
										1m: </label>
									<div class="col-sm-6">
										<div class="col-sm-5">
											<input type="text" class="form-control" name="block1mfpt"
												placeholder="FPT" id="block1mfpt" maxlength="30">
										</div>
										<div class="col-sm-5">
											<input type="text" class="form-control" name="block1mcmc"
												placeholder="CMC" id="block1mcmc" maxlength="30">
										</div>
									</div>
								</div>

							</div>
							<!--  -->
							<input type="hidden" name="command" value="add"></input>
							<div class="box-footer text-center">
								<button type="submit" class="btn btn-primary">
									<i class="ion-checkmark-round"></i> Xác nhận
								</button>
								<a href="<%=request.getContextPath()%>/admin_bangma.jsp"
									class="btn btn-danger"><i class="ion-close-round"></i> Hủy
								</a>
							</div>

						</form>
					</div>
					<!-- Cập nhật thông tin -->

				</div>
				<!-- End Left -->
			</div>

			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

		<!-- ---FOOTER--- -->
		<!-- Include this in all index page -->
		<jsp:include page="footer.jsp"></jsp:include>
		<!-- /.Include this in all index page -->
		<%
			}
		%>
	</div>
	<!-- /.End of wrapper -->
	<script>
		$(document)
				.ready(
						function() {
							var validator = $("#form")
									.validate(
											{
												rules : {
													codename : "required",
													code : {
														required : true,
														number : true
													},
													block1sfpt : {
														required : true,
														number : true
													},
													block6sfpt : {
														required : true,
														number : true
													},
													block10sfpt : {
														required : true,
														number : true
													},
													block1mfpt : {
														required : true,
														number : true
													},
													block1scmc : {
														required : true,
														number : true
													},
													block6scmc : {
														required : true,
														number : true
													},
													block10scmc : {
														required : true,
														number : true
													},
													block1mcmc : {
														required : true,
														number : true
													},
													length : {
														required : true,
														number : true
													},
												},
												messages : {
													codename : "Vui lòng điền đầy đủ thông tin",
													code : {
														required : "Nhập vào mã",
														number : "Vui lòng nhập vào kiểu số"
													},
													block1sfpt : {
														required : "Nhập vào 1 số, nếu không vui lòng nhập vào 0",
														number : "Vui lòng nhập vào kiểu số"
													},
													block6sfpt : {
														required : "Nhập vào 1 số, nếu không vui lòng nhập vào 0",
														number : "Vui lòng nhập vào kiểu số"
													},
													block10sfpt : {
														required : "Nhập vào 1 số, nếu không vui lòng nhập vào 0",
														number : "Vui lòng nhập vào kiểu số"
													},
													block1mfpt : {
														required : "Nhập vào 1 số, nếu không vui lòng nhập vào 0",
														number : "Vui lòng nhập vào kiểu số"
													},
													block1scmc : {
														required : "Nhập vào 1 số, nếu không vui lòng nhập vào 0",
														number : "Vui lòng nhập vào kiểu số"
													},
													block6scmc : {
														required : "Nhập vào 1 số, nếu không vui lòng nhập vào 0",
														number : "Vui lòng nhập vào kiểu số"
													},
													block10scmc : {
														required : "Nhập vào 1 số, nếu không vui lòng nhập vào 0",
														number : "Vui lòng nhập vào kiểu số"
													},
													block1mcmc : {
														required : "Nhập vào 1 số, nếu không vui lòng nhập vào 0",
														number : "Vui lòng nhập vào kiểu số"
													},
													length : {
														required : "Nhập vào chiều dài số điện thoại",
														number : "Vui lòng nhập vào kiểu số"
													}
												},
												errorElement : "em",
												errorPlacement : function(
														error, element) {
													// Add the `help-block` class to the error element
													error
															.addClass("help-block");
													// Add `has-feedback` class to the parent div.form-group
													// in order to add icons to inputs
													element
															.parents(
																	".col-sm-5")
															.addClass(
																	"has-feedback");
													if (element.prop("type") === "checkbox") {
														error
																.insertAfter(element
																		.parent("label"));
													} else {
														error
																.insertAfter(element);
													}
													// Add the span element, if doesn't exists, and apply the icon classes to it.
													if (!element.next("span")[0]) {
														$(
																"<span class='glyphicon glyphicon-remove form-control-feedback'></span>")
																.insertAfter(
																		element);
													}
												},
												success : function(label,
														element) {
													// Add the span element, if doesn't exists, and apply the icon classes to it.
													if (!$(element)
															.next("span")[0]) {
														$(
																"<span class='glyphicon glyphicon-ok form-control-feedback'></span>")
																.insertAfter(
																		$(element));
													}
												},
												highlight : function(element,
														errorClass, validClass) {
													$(element)
															.parents(
																	".col-sm-5")
															.addClass(
																	"has-error")
															.removeClass(
																	"has-success");
													$(element)
															.next("span")
															.addClass(
																	"glyphicon-remove")
															.removeClass(
																	"glyphicon-ok");
												},
												unhighlight : function(element,
														errorClass, validClass) {
													$(element)
															.parents(
																	".col-sm-5")
															.addClass(
																	"has-success")
															.removeClass(
																	"has-error");
													$(element)
															.next("span")
															.addClass(
																	"glyphicon-ok")
															.removeClass(
																	"glyphicon-remove");
												}
											});
						});
		$(function() {
			$("#dialog").dialog();
		});
	</script>
</body>
</html>
