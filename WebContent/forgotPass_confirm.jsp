<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Forgot Password Confirm</title>
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
<!-- iCheck -->
<link rel="stylesheet" href="pages/plugins/iCheck/all.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body class="hold-position login-page">
	<div class="login-box">
		<div class="login-logo">
			<a href="login.jsp"><b>Billings</b> System</a>
		</div>
		<!-- /.login-box -->
		<div class="login-box-body">
			<p class="login-box-msg" style="font-size: 20px">Khôi phục mật
				khẩu</p>

			<form action="#" method="post">
				<div class="form-group has-feedback">
					<input type="password" class="form-control"
						placeholder="Mật khẩu mới"> <span
						class="glyphicon glyphicon-lock form-control-feedback text-blue"></span>
				</div>
				<div class="form-group has-feedback">
					<input type="password" class="form-control"
						placeholder="Xác nhận mật khẩu mới"> <span
						class="glyphicon glyphicon-lock form-control-feedback text-blue"></span>
				</div>
				<div class="row">
					<div class="col-xs-4"></div>
					<div class="col-xs-4">
						<button type="submit" class="btn btn-primary">Xác nhận</button>
					</div>
					<!-- /.col -->
				</div>
			</form>
			<div class="text-left marginTop">
				<a href="src/main/webapp/WEB-INF/pages/login.jsp"><i class="fa fa-sign-in" aria-hidden="true"></i>
					Đăng nhập</a> &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;
				&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <a
					href="guide.jsp"><i class="fa fa-book" aria-hidden="true"></i>
					Hướng dẫn</a>
			</div>
		</div>
		<!-- /.login-box-body -->
	</div>
	<!-- /.login-box -->

	<!-- jQuery 2.2.0 -->
	<script src="plugins/jQuery/jQuery-2.2.0.min.js"></script>
	<!-- Bootstrap 3.3.6 -->
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<!-- iCheck -->
	<script src="plugins/iCheck/icheck.min.js"></script>
</body>
</html>