<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Change password User</title>
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
<link rel="stylesheet" href="dist/css/style.css">
<!-- daterange picker -->
<link rel="stylesheet"
	href="plugins/daterangepicker/daterangepicker-bs3.css">
<!-- bootstrap datepicker -->
<link rel="stylesheet" href="plugins/datepicker/datepicker3.css">
<!-- iCheck for checkboxes and radio inputs -->
<link rel="stylesheet" href="plugins/iCheck/all.css">
<!-- Bootstrap Color Picker -->
<link rel="stylesheet"
	href="plugins/colorpicker/bootstrap-colorpicker.min.css">
<!-- Bootstrap time Picker -->
<link rel="stylesheet"
	href="plugins/timepicker/bootstrap-timepicker.min.css">
<link rel="stylesheet" href="plugins/select2/select2.min.css">
<!-- AdminLTE Skins. We have chosen the skin-blue for this starter
        page. However, you can choose any other skin. Make sure you
        apply the skin class to the body tag so the changes take effect.
  -->
<link rel="stylesheet" href="dist/css/skins/skin-blue.min.css">
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

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
			<h1>Thông tin công ti</h1>
			<ol class="breadcrumb">
				<li><a href="index.jsp"><i class="fa fa-dashboard"></i>
						BillingsSystem</a></li>
				<li><a href="#">Thông tin công ti</a></li>
				<li class="active">Đổi mật khẩu</li>
			</ol>
			</section>

			<!-- Main content -->
			<section class="content">

			<div class="row">
				<div class="col-md-6">
					<div class="box box-primary">
						<div class="box-header with-border">
							<i class="fa fa-key"></i>

							<h3 class="box-title">Đổi mật khẩu đăng nhập</h3>
						</div>
						<!-- /.box-header -->
						<form action="UserChangpePass" class="" role="form">
							<div class="box-body">
								<div class="form-group">
									<label for="cPswd">Mật khẩu hiện tại:</label> <input
										type="password" class="form-control" id="cPswd"
										placeholder="Mật khẩu hiện tại" name="current_pwd">
								</div>
								<div class="form-group">
									<label for="nPswd">Mật khẩu mới:</label> <input type="password"
										class="form-control" id="nPswd" placeholder="Mật khẩu mới"
										name="new_pwd">
								</div>
								<div class="form-group">
									<label for="nPswdc">Xác nhận Mật khẩu mới:</label> <input
										type="password" class="form-control" id="nPswdc"
										placeholder="Nhập lại mật khẩu mới" name="confirm_new_pwd">
								</div>
							</div>

							<!-- /.box-body -->
							<div class="box-footer">
								<a href="index.jsp" class="btn btn-danger"> <i
									class="fa fa-remove"></i> Hủy
								</a>
								<button class="btn btn-primary pull-right">
									<i class="fa fa-refresh"></i> Đổi mật khẩu
								</button>
							</div>
						</form>
						<!-- /.box-body -->
					</div>
					<!-- /.box -->
				</div>
				<div class="col-md-6">
					<div class="box box-primary">
						<div class="box-header with-border">
							<i class="fa fa-book"></i>
							<h3 class="box-title">Hướng dẫn đổi mật khẩu</h3>
						</div>
						<!-- /.box-header -->
						<div class="box-body">
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
								Tempora laboriosam illum quasi ipsa, maxime accusantium mollitia
								deleniti illo reprehenderit neque dolorem officiis tenetur
								doloribus, dolorum ut nisi, impedit qui aperiam?</p>
							<h4>1. Lorem ipsum dolor sit amet.</h4>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
								Ex cupiditate laborum aliquid eveniet, reprehenderit sunt
								maiores molestias assumenda quos recusandae.</p>
							<h4>2. Lorem ipsum dolor sit amet.</h4>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
								Mollitia numquam dignissimos earum laudantium corporis, animi
								fuga quae! Rerum optio, iusto minima quae soluta deleniti
								praesentium, esse eaque inventore dolorem nam quod laudantium
								rem saepe dicta alias minus, iure quis. Non reiciendis provident
								cumque ut, distinctio culpa, quam maiores magnam aliquam.</p>
							<h4>3. Lorem ipsum dolor sit.</h4>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
								Et architecto commodi nemo ipsa similique dignissimos debitis
								pariatur maxime illo ratione.</p>
						</div>
					</div>
					<!-- /.box -->
				</div>
			</div>

			</section>
			<!-- /.content -->
		</div>

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
</body>
</html>