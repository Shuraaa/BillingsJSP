<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js">
</script>
<![endif]-->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Billings SYSTEM | Login</title>
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
<link rel="stylesheet" href="plugins/iCheck/all.css">

</head>
<body class="hold-transition login-page">

	<%
		String error = (String) request.getAttribute("error");
		if (error == null) {
			error = "";
		}
	%>

	<div class="login-box">
		<div class="login-logo text-green">
			<a href="#"><b>Billings</b> System</a>
		</div>
		<!-- /.login-logo -->
		<div class="login-box-body">
			<p class="login-box-msg" style="font-size: 20px">
				Đăng nhập hệ thống <b>Billings</b>
			</p>
			<p style="color: red"><%=error%></p>
			<form action="<%=request.getContextPath()%>/Login" id="loginForm"
				method="POST">
				<div class="form-group has-feedback">
					<input type="text" name="username" class="form-control"
						placeholder="Tên đăng nhập" maxlength="15"> <span
						class="glyphicon glyphicon-envelope form-control-feedback text-blue"></span>
				</div>
				<div class="form-group has-feedback">
					<input type="password" name="password" class="form-control"
						placeholder="Mật khẩu" maxlength="10"> <span
						class="glyphicon glyphicon-lock form-control-feedback text-blue"></span>
				</div>
				<div class="row">
					<div class="col-xs-7">
						<div class="checkbox icheck">
							<label><input type="checkbox" class="rememberUS">
								Ghi nhớ đăng nhập</label>
						</div>
					</div>
					<!-- /.col -->
					<div class="col-xs-5">
						<button type="submit" class="btn btn-primary btn-block"
							value="<%=request.getContextPath()%>/Login">
							<i class="fa fa-sign-in"></i> Đăng nhập
						</button>
					</div>
					<!-- /.col -->
				</div>
			</form>
			<div style="padding-left: 5px" class="text-left marginTop">
				<a href="forgotPass.jsp"><i class="fa fa-unlock"
					aria-hidden="true"></i> Quên mật khẩu</a> &nbsp; &nbsp; &nbsp;
				&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
				&nbsp; &nbsp; &nbsp; &nbsp; <a href="guide.jsp"><i
					class="fa fa-book" aria-hidden="true"></i> Hướng dẫn</a>
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
	<script>
		$(function() {
			$('.rememberUS').iCheck({
				checkboxClass : 'icheckbox_flat-blue',
				radioClass : 'iradio_flat-blue'
			});
		});
	</script>
	<script>
		$(document).ready(function() {
			$(document).on("contextmenu", function(e) {
				return false;
			});
		});
		s
	</script>
	<script>
		$(document).keydown(function(event) {
			if (event.keyCode == 123) {
				return false;
			} else if (event.ctrlKey && event.shiftKey && event.keyCode == 73) {
				return false;
			}
		});
	</script>
</body>
</html>
