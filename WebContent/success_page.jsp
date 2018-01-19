<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Success</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">

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


		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->

			<!-- Main content -->
			<div class="login-box-body">
				<div class="text-center">
					<img alt="success" src="images/Success.jpg"
						width="300px;height=280px;">
				</div>
				<p class="login-box-msg"
					style="font-size: 35px; font-family: sans-serif; color: red;">
					<i class="ion-checkmark-round"></i><b> Cập nhật thông tin thành
						công</b>
				</p>
				<p class="login-box-msg">
					Thông tin của bạn đã được thay đổi<br>Vui lòng Đăng nhập lại.
				</p>
				<div class="row">
					<div class="col-sm-3"></div>
					<div class="col-sm-3">
						<a href="<%=request.getContextPath()%>/index.jsp" type="button"
							class="btn btn-primary form-control btn-block"><i
							class="fa fa-home"></i> Quay lại trang chủ</a>
					</div>
					<div class="col-sm-3">
						<a href="<%=request.getContextPath()%>/Logout" type="button"
							class="btn btn-primary form-control btn-block"><i
							class="fa fa-sign-in"></i> Đăng nhập lại </a>
					</div>
				</div>
			</div>
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
	<!-- ./wrapper -->

</body>
</html>
