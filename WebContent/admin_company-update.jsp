<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Company update</title>
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

		<!-- Wrapper Contents -->
		<div class="content-wrapper">

			<!-- Content Header (Page header) -->
			<section class="content-header">
			<h1>Cập nhật thông tin</h1>
			<ol class="breadcrumb">
				<li><a href="index.jsp"><i class="fa fa-dashboard"></i>
						BillingsSystem</a></li>
				<li><a href="#">Quản trị hệ thống</a></li>
				<li><a href="admin_company.jsp">Quản lí công ti</a></li>
				<li class="active">Cập nhật thông tin</li>
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
