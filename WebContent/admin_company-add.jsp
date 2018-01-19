<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Company add</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<link rel="stylesheet" href="js/jquery-ui.theme.css">
<script type="text/javascript"
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.1/jquery.validate.min.js"></script>
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
			<h1>Thêm công ti mới</h1>
			<ol class="breadcrumb">
				<li><a href="index.jsp"><i class="fa fa-dashboard"></i>
						BillingsSystem</a></li>
				<li><a href="#">Quản trị hệ thống</a></li>
				<li><a href="admin_company.jsp">Quản lí công ti</a></li>
				<li class="active">Thêm công ti</li>
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
								<i class="fa fa-pencil-square"></i> Thông tin công ti
							</h3>
						</div>

						<form action="ManagerCongTy" method="post" role="form"
							class="form-horizontal" id="form" enctype="multipart/form-data">
							<div class="box-body">

								<!-- Form group -->
								<div class="form-group">
									<label for="input_tenCongTi" class="col-sm-2 control-label"
										for="txt_tenCongTy">Tên công ti:</label>
									<div class="col-sm-4">
										<input type="text" class="form-control" name="txt_tenCongTy"
											placeholder="Tên công ti" id="txt_tenCongTy"> <br>
									</div>
									<label for="inputImg"
										class="col-sm-2 control-label data-toggle="
										tooltip" title="Ảnh không vượt quá 60KB!">Logo: </label>
									<div class="col-sm-4 data-toggle="
										tooltip" title="Ảnh không vượt quá 60KB!">
										<input type="file" class="form-control" name="input_img"
											id="input_img">
									</div>
								</div>

								<!-- Form group -->
								<div class="form-group">
									<label for="inputDiaChi" class="col-sm-2 control-label">Địa
										chỉ: </label>
									<div class="col-sm-4">
										<input type="text" class="form-control" name="txt_DiaChi"
											placeholder="Địa chỉ">
									</div>
									<label for="inputMST" class="col-sm-2 control-label">Mã
										số thuế: </label>
									<div class="col-sm-4">
										<input type="text" class="form-control" name="txt_mst"
											placeholder="Mã số thuế (Mã khách hàng)">
									</div>
								</div>
								<!-- Form group -->
								<div class="form-group">
									<label for="inputEmail" class="col-sm-2 control-label">Email:
									</label>
									<div class="col-sm-4">
										<input type="text" class="form-control" name="txt_email"
											id="txt_email" placeholder="Email"> <br>
									</div>
									<label for="inputBirthPlace" class="col-sm-2 control-label">ĐTDĐ:
									</label>
									<div class="col-sm-4">
										<input type="text" class="form-control" name="txt_dtdd"
											placeholder="Điện thoại di động"> <br>
									</div>
								</div>

								<!-- Form group -->
								<div class="form-group">
									<label for="inputMakeup" class="col-sm-2 control-label">Tỉ
										lệ Make-up: </label>

									<div class="col-sm-4">
										<input type="text" class="form-control" name="txt_makeup"
											placeholder="Theo tỉ lệ %"> <br>
										<%
											if (request.getAttribute("tile_mk_err") != null) {
										%>
										<label style="color: red; size: 6px"><%=request.getAttribute("tile_mk_err")%></label>
										<%
											}
										%>
									</div>
									<label for="inputOther" class="col-sm-2 control-label">Thông
										tin khác: </label>
									<div class="col-sm-4">
										<input type="text" class="form-control" name="txt_other"
											placeholder="Thông tin khác">
									</div>
								</div>
							</div>

							<!--  -->
							<input type="hidden" name="command" value="add">
							<div class="box-footer text-center">
								<button type="submit" class="btn btn-primary" value="Validate!">Xác
									nhận</button>

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
	<!-- java script -->
	<script>
		jQuery.validator.addMethod('filesize', function(value, element, param) {
			return this.optional(element) || (element.files[0].size <= param)
		}, 'File size must be less than {0}');
	</script>
	<script>
		$(document)
				.ready(
						function() {
							var validator = $("#form")
									.validate(
											{
												rules : {
													txt_tenCongTy : "required",
													txt_email : {
														required : true,
														email : true
													},
													txt_makeup : {
														required : true,
														number : true,
														min : 0,
														max : 100
													},
													txt_dtdd : {
														required : true,
														number : true
													},
													input_img : {
														required : true,
														accept : "image/*",
														filesize : 61440
													},
													txt_mst : {
														required : true
													},
													txt_DiaChi : {
														required : true
													}
												},
												messages : {
													txt_tenCongTy : "Nhập vào tên công ty",
													txt_email : {
														required : "Nhập vào địa chỉ Email",
														email : "Địa chỉ email không hợp lệ"
													},
													txt_makeup : {
														required : "Nhập vào tỉ lệ Make-up",
														number : "Nhập vào một số hợp lệ",
														min : "Không thể nhỏ hơn 0",
														max : "Không vượt quá 100"
													},
													txt_dtdd : {
														required : "Nhập vào Số điện thoại",
														number : "Số điện thoại không hợp lệ"
													},
													input_img : {
														required : "Vui lòng chọn Logo",
														accept : "Vui lòng chọn File hình ảnh",
														filesize : "Kích thước ảnh tối đa 60KB"
													},
													txt_mst : {
														required : "Nhập vào Mã số thuế"
													},
													txt_DiaChi : {
														required : "Nhập vào địa chỉ Công ti"
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
																	".col-sm-4")
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
																	".col-sm-4")
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
																	".col-sm-4")
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
	</script>
</body>
</html>
