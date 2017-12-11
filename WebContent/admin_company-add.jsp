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
<!-- Bootstrap 3.3.6 -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
<!-- iCheck -->
<link rel="stylesheet" href="plugins/iCheck/flat/blue.css">
<!-- Date Picker -->
<link rel="stylesheet" href="plugins/datepicker/datepicker3.css">
<!-- Daterange picker -->
<link rel="stylesheet"
	href="plugins/daterangepicker/daterangepicker-bs3.css">
<!-- bootstrap wysihtml5 - text editor -->
<link rel="stylesheet"
	href="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
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

						<form action="#" role="form" class="form-horizontal">
							<div class="box-body">

								<!-- Form group -->
								<div class="form-group">
									<label for="input_tenCongTi" class="col-sm-2 control-label">Tên
										công ti: </label>
									<div class="col-sm-4">
										<input type="text" class="form-control" name="txt_tenCongTi"
											placeholder="Tên công ti">
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
		<footer class="main-footer">
		<div class="pull-right hidden-xs">
			<b>Version</b> 1.0.0
		</div>
		<strong>Copyright &copy; 2017 <a
			href="https://www.facebook.com/trunghieu.shura">ATHL</a>.
		</strong> All rights reserved. </footer>
	</div>
	<!-- /.End of wrapper -->

	<!-- REQUIRED JS SCRIPTS -->
	<!-- Search item in table -->
	<script>
		$(document)
				.ready(
						function() {
							$("#myInput")
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
						});
	</script>
	<!-- Select2 -->
	<script src="plugins/select2/select2.full.min.js"></script>
</body>
</html>
