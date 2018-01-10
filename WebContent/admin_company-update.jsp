<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Company update</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<script type="text/javascript"
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.1/jquery.validate.min.js"></script>

</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">

		<!-- Include this in all index page -->
		<jsp:include page="sideBar.jsp"></jsp:include>
		<!-- /.Include this in all index page -->

		<!-- Wrapper Contents -->
		<div class="content-wrapper">

			<!-- Content Header (Page header) -->
			<section class="content-header">
			<h1>Cập nhật thông tin</h1>
			<ol class="breadcrumb">
				<li><a href="index.jsp"><i class="fa fa-dashboard"></i>
						BillingsSystem</a></li>
				<li><a href="#">Quản trị hệ thống</a></li>
				<li><a href="admin_company.jsp">Quản lí công ti</a></li>
				<li class="active">Cập nhật thông tin</li>
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


						<form action="ManagerCongTy" method="get" role="form"
							class="form-horizontal" id="form">
							<div class="box-body">
								<!-- Form group -->
								<div class="form-group">
									<label for="input_tenCongTi" class="col-sm-2 control-label">Tên
										công ti: </label>
									<div class="col-sm-4">
										<input type="hidden" name="congTyID_update"
											value=<%=request.getParameter("congtyid")%>> <input
											type="text" class="form-control" name="txt_tenCongTi_update"
											placeholder="Tên công ti"
											value="<%=request.getParameter("tencongty")%>">
									</div>
									<label for="inputImg" class="col-sm-2 control-label">Logo:
									</label>
									<div class="col-sm-1 block-img">
										<a href="#" class="normal-img"><img
											src="dist/img/user2-160x160.jpg" width="60" height="60"
											alt=""></a>
									</div>
									<div class="col-sm-3">
										<input type="file" class="form-control" name="input_img">
									</div>
								</div>
								<!-- Form group -->
								<div class="form-group">
									<label for="inputDiaChi" class="col-sm-2 control-label">Địa
										chỉ: </label>
									<div class="col-sm-4">
										<input type="text" class="form-control"
											name="txt_DiaChi_update" placeholder="Địa chỉ"
											value="<%=request.getParameter("diachi")%>">
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
											placeholder="Email">
									</div>
									<label for="inputBirthPlace" class="col-sm-2 control-label">ĐTDĐ:
									</label>
									<div class="col-sm-4">
										<input type="text" class="form-control" name="txt_dtdd"
											placeholder="Điện thoại di động">
									</div>
								</div>
								<!-- Form group -->
								<div class="form-group">
									<label for="inputMakeup" class="col-sm-2 control-label">Tỉ
										lệ Make-up: </label>
									<div class="col-sm-4">
										<input type="text" class="form-control" name="txt_makeup"
											placeholder="Theo %">
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
							<div class="box-footer text-center">
								<input type="hidden" name="command" value="edit">
								<button type="submit" class="btn btn-primary">Xác nhận</button>
							</div>
							<div class="alert alert-success alert-dismissible">
								<button type="button" class="close" data-dismiss="alert"
									aria-hidden="true">×</button>
								<h4>
									<i class="icon fa fa-check"></i> Chúc mừng!!!
								</h4>
								Thông tin công ti đã cập nhật thành công.
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
	</div>
	<!-- /.End of wrapper -->
	<!-- java script -->
	<script
		src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>
	<script type="text/javascript" src="js/jquery-ui.js"></script>
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
														number : true,
														min:0,
														max:100
													},
													txt_dtdd : {
														number : true
													}
												},
												messages : {
													txt_tenCongTy : "Nhập vào tên công ty",
													txt_email : {
														required : "Nhập vào địa chỉ email",
														email : "Địa chỉ email không hợp lệ"
													},
													txt_makeup : {
														number : "Nhập vào một số hợp lệ",
														min: "Không thể nhỏ hơn 0",
														max: "Không vượt quá 100"
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
