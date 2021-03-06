<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Forgot Password Success</title>
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

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body class="hold-trasition login-page">
	<div class="login-box">
		<div class="login-logo">
			<a href="login.jsp"><b>Billings</b> System</a>
		</div>
		<!-- /.login-logo -->
		<div class="login-box-body">
			<p class="login-box-msg">
				<b style="font-size: 21px; color: red;"> Thay đổi mật khẩu thành
					công</b>
			</p>
			<div class="login-box-msg text-center">
				<button type="button" class="btn btn-success" onclick="show()">Click
					Me!</button>
			</div>
			<p class="login-box-msg" id="show">
				<i style="font-size: 15px; color: red;">Click the button above
					to see your password</i>
			</p>
			<p class="login-box-msg">Vui lòng đổi lại mật khẩu sau khi đăng
				nhập</p>
			<div class="row text-center">
				<a href="login.jsp"><button class="btn btn-primary">
						<i class="fa fa-sign-in" aria-hidden="true"></i> Đăng nhập
					</button></a>
			</div>
			<div class="text-center marginTop">
				<a href="guide.jsp"><i class="fa fa-book" aria-hidden="true"></i>
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
	<script>
		function show() {
			document.getElementById("show").innerHTML = '<i style="font-size: 18px;">Mật khẩu của bạn: <a href="login.jsp">123456</a></i>';
		}
	</script>
</body>
</html>