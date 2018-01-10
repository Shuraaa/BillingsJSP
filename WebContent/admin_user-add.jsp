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
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Users Add</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script type="text/javascript" src="/js/jquery.validate.js"></script>
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
			<h1>Thêm người dùng mới</h1>
			<ol class="breadcrumb">
				<li><a href="index.jsp"><i class="fa fa-dashboard"></i>
						BillingsSystem</a></li>
				<li><a href="#">Quản trị hệ thống</a></li>
				<li><a href="admin_user.jsp">Quản lí người dùng</a></li>
				<li class="active">Thêm người dùng</li>
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
								<i class="fa fa-pencil-square"></i> Thông tin người dùng
							</h3>
						</div>

						<form action="<%=request.getContextPath()%>/ManagerTaiKhoan"
							method="post" role="form" class="form-horizontal" id="form">
							<div class="box-body">

								<!-- Form group -->
								<div class="form-group">
									<label for="input_username" class="col-sm-2 control-label">Tên
										tài khoản: </label>
									<div class="col-sm-5">
										<input type="text" class="form-control" name="username"
											placeholder="Username" id="username">
									</div>
									<%
										String a = (String) request.getAttribute("errorUserName");
										if (a != null) {
									%>
									<p style="color: red;">Tài khoản đã tồn tại</p>
									<%
										}
									%>
								</div>
								<!-- Form group -->
								<div class="form-group">
									<label for="inputPwd" class="col-sm-2 control-label">Mật
										khẩu: </label>
									<div class="col-sm-5">
										<input type="password" class="form-control" name="password"
											placeholder="Password" id="password">
									</div>
									<%
										String b = (String) request.getAttribute("errorPass");
										if (b != null) {
									%>
									<p style="color: red;">Mật khẩu phải trùng với xác nhận mật
										khẩu</p>
									<%
										}
									%>
								</div>

								<!-- Form group -->
								<div class="form-group">
									<label for="inputPwdConfirm" class="col-sm-2 control-label">Xác
										nhận mật khẩu: </label>
									<div class="col-sm-5">
										<input type="password" class="form-control" name="pwd_confirm"
											placeholder="Confirm Password" id="pwd_confirm">
									</div>
								</div>
								<!-- Form group -->
								<div class="form-group">
									<label for="inputRole" class="col-sm-2 control-label">Công
										ty: </label>
									<div class="col-sm-5">
										<select class="form-control" name="congty">
											<%
												ArrayList<CongTy> listCongTy = CongTyDao.getListCongTy();
												for (int i = 0; i < listCongTy.size(); i++) {
											%>
											<option selected=""
												value=<%=listCongTy.get(i).getCongTyID()%>><%=listCongTy.get(i).getTenCongTy()%></option>
											<%
												}
											%>
											<!-- KẾT NỐI LẤY DỮ LIỆU HIỂN THỊ TỪ DATABASE -->
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="inputRole" class="col-sm-2 control-label">Quyền
										truy cập: </label>
									<div class="col-sm-5">
										<select class="form-control" name="select">
											<option selected="" value=0>admin</option>
											<option selected="" value=1>user</option>
											<option selected="" value=2>viewer</option>

											<!-- KẾT NỐI LẤY DỮ LIỆU HIỂN THỊ TỪ DATABASE -->
										</select>
									</div>
								</div>
							</div>
							<!--  -->
							<input type="hidden" name="command" value="add"></input>
							<div class="box-footer text-center">
								<button type="submit" class="btn btn-primary">Xác nhận</button>
							</div>
							<div class="alert alert-success alert-dismissible">
								<button type="button" class="close" data-dismiss="alert"
									aria-hidden="true">×</button>
								<h4>
									<i class="icon fa fa-check"></i> Chúc mừng!!!
								</h4>
								Thông tin đã cập nhật thành công.
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
													username : "required",
													password : {
													   required: true,
													   minlength: 6
													},
													pwd_confirm:{
														 equalTo: "#password"
													}
												},
												messages : {
													username : "Nhập vào tài khoản người dùng",
													password : {
														required: "Nhập vào mật khâ",
														minlength: "Mật khẩu ít nhất 6 kí tự"}
												
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
