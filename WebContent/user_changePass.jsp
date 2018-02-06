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
		int role = (int) session.getAttribute("role");
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
			String error4 = (String) request.getAttribute("error4");
			if (error4 == null) {
				error4 = "";
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
				<li><a href="<%=request.getContextPath()%>/index.jsp"><i
						class="fa fa-dashboard"></i> BillingsSystem</a></li>
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

							<h3 class="box-title">
								<b>Đổi mật khẩu đăng nhập</b>
							</h3>
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
										placeholder="Current password" name="current_pwd"
										maxlength="30">
									<p style="color: red"><%=error3%></p>
									<p style="color: red"><%=error4%></p>
								</div>
								<!-- /.Old Password -->

								<!-- New Password -->
								<div class="form-group">
									<label for="new_pwd">Mật khẩu mới:</label> <input
										type="password" class="form-control"
										placeholder="New password" name="new_pwd" maxlength="30">
									<p style="color: red"><%=error4%></p>
								</div>
								<!-- /.New Password -->

								<!-- Confirm New Password -->
								<div class="form-group">
									<label for="confirm_new_pwd">Xác nhận Mật khẩu mới:</label> <input
										type="password" class="form-control"
										placeholder="Confirm new password" name="confirm_new_pwd"
										maxlength="30">
									<p style="color: red"><%=error2%></p>
									<p style="color: red"><%=error4%></p>
								</div>
								<!-- /.Confirm New Password -->
							</div>
							<!-- /.box-body -->

							<div class="box-footer text-center">
								<%
									if (role == 0 || role == 1) {
								%>
								<button class="btn btn-primary" type="submit">
									<i class="fa fa-refresh"></i> Đổi mật khẩu
								</button>

								<a href="<%=request.getContextPath()%>/index.jsp"
									class="btn btn-danger"> <i class="ion-close-round"></i> Hủy
								</a>
							</div>
							<%
								}
							%>
						</form>
					</div>
					<!-- /.box-body -->
				</div>
				<!-- /.box -->

				<div class="col-md-6">
					<div class="box box-primary">
						<div class="box-header with-border">
							<i class="fa fa-book"></i>
							<h3 class="box-title">
								<b>Hướng dẫn</b>
							</h3>
						</div>
						<!-- /.box-header -->
						<div class="box-body">
							<h4>1. Quy định:</h4>
							<p>- Mật khẩu phải chứa tối thiểu 6 ký tự và tối đa 30 ký tự.</p>
							<p>- Không chứa khoảng trắng.</p>
							<p>- Không chứa các ký tự đặc biệt như: "@,#,$,%,&,*,<,>,".</p>
							<p>- Mật khẩu không phân biệt chữ hoa và chữ thường.</p>
							<p>- Mật khẩu có thể kèm theo số.</p>
							<h4>2. Mật khẩu mới:</h4>
							<p>- Mật khẩu mới và Xác nhận mật khẩu mới phải trùng nhau.</p>
							<h4 style="color: red">
								<b>3. Lưu ý:</b>
							</h4>
							<p>
								- Vui lòng đọc <a href="<%=request.getContextPath()%>/guide.jsp"><i>Hướng
										dẫn sử dụng</i></a> để biết thêm chi tiết
							</p>
							<p>- Nếu gặp lỗi trong quá trình sử dụng, vui lòng liên hệ
								với Quản Trị Viên để giải đáp thắc mắc.</p>
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

	</div>
	<!-- /.End of wrapper -->
	<%
		}
	%>
</body>
</html>