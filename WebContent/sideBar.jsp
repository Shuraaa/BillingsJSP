<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Sidebar</title>
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
<!-- iCheck for checkboxes and radio inputs -->
<link rel="stylesheet" href="plugins/iCheck/all.css">
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

	<!-- Main Header -->
	<header class="main-header"> <!-- Logo --> <a href="index.jsp"
		class="logo"> <!-- mini logo for sidebar mini 50x50 pixels --> <span
		class="logo-mini"><b>B</b>S</span> <!-- logo for regular state and mobile devices -->
		<span class="logo-lg"><b>Billings</b>System</span>
	</a> <!-- Header Navbar: style can be found in header.less --> <nav
		class="navbar navbar-static-top"> <!-- Sidebar toggle button-->
	<a href="#" class="sidebar-toggle" data-toggle="offcanvas"
		role="button"> <span class="sr-only">Sidebar</span>
	</a>

	<div class="navbar-custom-menu">
		<ul class="nav navbar-nav">
			<!-- User Account: style can be found in dropdown.less -->
			<li class="dropdown user user-menu"><a href="#"
				class="dropdown-toggle" data-toggle="dropdown"> <img
					src="dist/img/user2-160x160.jpg" class="user-image"
					alt="User Image"> <span class="hidden-xs">Hieuuuuuuu</span>
			</a>
				<ul class="dropdown-menu">
					<!-- User image -->
					<li class="user-header"><img src="dist/img/user2-160x160.jpg"
						class="img-circle" alt="User Image">

						<p>Hieuuuuuuuuuu</p></li>
					<!--User Menu Footer-->
					<li class="user-footer">
						<div class="pull-left">
							<a href="user_update.jsp" class="btn btn-default btn-flat">Cập
								nhật thông tin</a>
						</div>
						<div class="pull-right">
							<a href="#" class="btn btn-default btn-flat">Đăng xuất</a>
						</div>
					</li>
				</ul></li>
		</ul>
	</div>
	</nav> </header>



	<!-- Left side column. contains the logo and sidebar -->
	<aside class="main-sidebar"> <!-- sidebar: style can be found in sidebar.less -->
	<section class="sidebar"> <!-- Sidebar USER panel -->
	<div class="user-panel">
		<div class="pull-left image">
			<img src="dist/img/user2-160x160.jpg" class="img-circle"
				alt="User Image">
		</div>
		<div class="pull-left info">
			<p>Trung Hieu</p>
		</div>
	</div>

	<!-- Sidebar menu -->
	<ul class="sidebar-menu">
		<li class="header">DANH MỤC</li>

		<li class="treeview"><a href="#"> <i
				class="glyphicon glyphicon-user"></i> <span>Thông tin công ti</span>
				<i class="fa fa-angle-left pull-right"></i>
		</a>
			<ul class="treeview-menu">
				<li><a href="user_update.jsp"><i
						class="glyphicon glyphicon-pencil"></i> Cập nhật thông tin</a></li>
				<li><a href="user_changePass.jsp"><i
						class="glyphicon glyphicon-lock"></i> Cập nhật mật khẩu</a></li>
			</ul></li>
		<li><a href="billings.jsp"> <i
				class="glyphicon glyphicon-list-alt"></i> <span>Billings</span>
		</a></li>
		<li class="treeview"><a href="#"> <i
				class="glyphicon glyphicon-lock"></i> <span>Quản trị hệ thống</span>
				<i class="fa fa-angle-left pull-right"></i>
		</a>
			<ul class="treeview-menu">
				<li><a href="admin_user.jsp"><i class="fa fa-users"></i>
						Quản lí người dùng</a></li>
				<li><a href="admin_company.jsp"><i
						class="glyphicon glyphicon-briefcase"></i> Quản lí công ti</a></li>
				<li><a href="admin_group.jsp"><i
						class="glyphicon glyphicon-th-large"></i> Quản lí phòng/ban</a></li>
				<li><a href="admin_extension.jsp"><i
						class="glyphicon glyphicon-th"></i> Quản lí Extension</a></li>
			</ul></li>
		<li><a href="guide.jsp"><i class="fa fa-book"></i> <span>Hướng
					dẫn sử dụng</span></a></li>
		<li><a href="#"><i class="glyphicon glyphicon-log-out"></i> <span>Đăng
					xuất</span></a></li>
	</ul>
	</section> <!-- /.sidebar --> </aside>
	<!-- /.content-wrapper -->


	<!-- REQUIRED JS SCRIPTS -->

	<!-- jQuery 2.2.0 -->
	<script src="plugins/jQuery/jQuery-2.2.0.min.js"></script>
	<script src="plugins/datatables/jquery.dataTables.min.js"></script>
	<!-- Bootstrap 3.3.6 -->
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<!-- Select2 -->
	<script src="plugins/select2/select2.full.min.js"></script>
	<!-- InputMask -->
	<script src="plugins/input-mask/jquery.inputmask.js"></script>
	<script src="plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
	<script src="plugins/input-mask/jquery.inputmask.extensions.js"></script>
	<!-- date-range-picker -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
	<script src="plugins/daterangepicker/daterangepicker.js"></script>
	<!-- bootstrap datepicker -->
	<script src="plugins/datepicker/bootstrap-datepicker.js"></script>
	<!-- bootstrap color picker -->
	<script src="plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
	<!-- bootstrap time picker -->
	<script src="plugins/timepicker/bootstrap-timepicker.min.js"></script>
	<!-- SlimScroll 1.3.0 -->
	<script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
	<!-- iCheck 1.0.1 -->
	<script src="plugins/iCheck/icheck.min.js"></script>
	<!-- FastClick -->
	<script src="plugins/fastclick/fastclick.js"></script>
	<!-- AdminLTE App -->
	<script src="dist/js/app.min.js"></script>
</body>
</html>