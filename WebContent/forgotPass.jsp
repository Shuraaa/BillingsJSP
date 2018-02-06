<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>forgotPassword</title>
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
<script type="text/javascript"
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.1/jquery.validate.min.js"></script>

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body class="hold-transition login-page">

	<%
		String error = (String) request.getAttribute("error");
		if (error == null) {
			error = "";
		}
	%>

	<div class="login-box">
		<div class="login-logo">
			<a href="login.jsp"><b>Billings</b> System</a>
		</div>
		<!-- /.login-logo -->
		<div class="login-box-body">
			<p class="login-box-msg" style="font-size: 20px">Khôi phục mật
				khẩu</p>
			<form action="<%=request.getContextPath()%>/ForgotPassword"
				method="POST" role="form" id="loginForm">
				<div class="form-group has-feedback">
					<input type="text" id="usernameInput" class="form-control"
						placeholder="Tên đăng nhập" name="username"><i
						class="glyphicon glyphicon-user form-control-feedback text-blue"></i>
				</div>

				<p style="color: grey; font-style: italic;"><%=error%></p>

				<div class="form-group has-feedback">
					<input type="text" id="emailInput" class="form-control"
						placeholder="Email" name="email"><i
						class="glyphicon glyphicon-envelope form-control-feedback text-blue"></i>
				</div>
				<div class="row text-center">
					<button type="submit" class="btn btn-primary">Xác nhận</button>
				</div>
			</form>
			<div style="padding-bottom: 10px;" class="text-left marginTop">
				<a href="login.jsp" class="pull-left"><i class="fa fa-sign-in"
					aria-hidden="true"></i> Đăng nhập</a> <a href="guide.jsp"
					class="pull-right"><i class="fa fa-book" aria-hidden="true"></i>
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
	<script
		src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>
	<script type="text/javascript" src="js/jquery-ui.js"></script>
	<script>
		$(document)
				.ready(
						function() {
							var validator = $("#loginForm")
									.validate(
											{
												rules : {
													username : {
														required : true,
														rangelength : [ 6, 30 ]
													},
													email : {
														required : true,
														email : true
													}
												},
												messages : {
													username : {
														required : "Nhập vào Tên đăng nhập",
														rangelength : "Tên đăng nhập phải dài ít nhất 6 ký tự và tối đa 30 ký tự"
													},
													email : {
														required : "Nhập vào Email",
														email : "Sai định dạng Email"
													}
												},
												errorElement : "em",
												errorPlacement : function(
														error, element) {
													// Add the help-block class to the error element
													error
															.addClass("help-block");

													// Add has-feedback class to the parent div.form-group
													// in order to add icons to inputs
													element
															.parents(
																	".col-sm-6")
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
																	".col-sm-6")
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
																	".col-sm-6")
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