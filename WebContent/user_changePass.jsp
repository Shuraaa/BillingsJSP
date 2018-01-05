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

</head>
<body class="hold-transition skin-blue sidebar-mini">

	<%
		if (session.getAttribute("username") == null) {
			response.sendRedirect("login.jsp");
		} else {
	%>
	<%
		String error = (String) request.getAttribute("error");
			if (error == null) {
				error = "";
			}
			String error2 = (String) request.getAttribute("error2");
			if (error2 == null) {
				error2 = "";
			}
			String error3 = (String) request.getAttribute("error3");
			if (error3 == null) {
				error3 = "";
			}
	%>

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
							<p style="color: red"><%=error%></p>
						</div>
						<!-- /.box-header -->
						<form action="<%=request.getContextPath()%>/ChangePass"
							method="POST" id="form">
							<div class="box-body">

								<!-- Old Password -->
								<div class="form-group">
									<label for="current_pwd">Mật khẩu hiện tại:</label> <input
										type="password" class="form-control"
										placeholder="Mật khẩu hiện tại" name="current_pwd">
									<p style="color: red"><%=error3%></p>
								</div>
								<!-- /.Old Password -->

								<!-- New Password -->
								<div class="form-group">
									<label for="new_pwd">Mật khẩu mới:</label> <input
										type="password" class="form-control"
										placeholder="Mật khẩu mới" name="new_pwd">
								</div>
								<!-- /.New Password -->

								<!-- Confirm New Password -->
								<div class="form-group">
									<label for="confirm_new_pwd">Xác nhận Mật khẩu mới:</label> <input
										type="password" class="form-control"
										placeholder="Nhập lại mật khẩu mới" name="confirm_new_pwd">
									<p style="color: red"><%=error2%></p>
								</div>
								<!-- /.Confirm New Password -->

							</div>

							<!-- /.box-body -->
							<div class="box-footer">
								<a href="index.jsp" class="btn btn-danger"> <i
									class="fa fa-remove"></i> Hủy
								</a>
								<button class="btn btn-primary pull-right" type="submit">
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
		<!-- Include this in all index page -->
		<jsp:include page="footer.jsp"></jsp:include>
		<!-- /.Include this in all index page -->

		<%
			}
		%>
	</div>
	<!-- /.End of wrapper -->
</body>
</html>