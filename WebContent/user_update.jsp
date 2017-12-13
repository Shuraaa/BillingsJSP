<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Update_user info</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">


</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">

		<!-- Include this in all index page -->
		<jsp:include page="sideBar.jsp"></jsp:include>
		<!-- /.Include this in all index page -->

		<!-- Wrapper Contents -->
		<div class="content-wrapper">

			<!-- Content Header (Page header) -->
			<section class="content-header">
			<h1>Thông tin công ti</h1>
			<ol class="breadcrumb">
				<li><a href="index.jsp"><i class="fa fa-dashboard"></i>
						BillingsSystem</a></li>
				<li><a href="#">Thông tin công ti</a></li>
				<li class="active">Cập nhật thông tin</li>
			</ol>
			</section>

			<!-- Main content -->
			<section class="content">
			<div class="row">
				<div class="col-sm-8">
					<!-- Cập nhật thông tin -->
					<div class="box box-widget widget-user-2">

						<!-- Add the bg color to the header using any of the bg-* classes -->
						<div class="widget-user-header bg-blue">
							<div class="widget-user-image">
								<img class="img-square" src="dist/img/user2-160x160.jpg"
									alt="User Avatar">
							</div>
							<!-- /.widget-logo-image -->
							<h3 class="widget-user-username">Logo</h3>
							<input class="widget-user-desc" type="file" class="form-control">
						</div>

						<form action="" role="form" class="form-horizontal">
							<div class="box-body">

								<!-- Form group -->
								<div class="form-group">
									<label for="lbl_tencongti" class="col-sm-2 control-label">Tên
										công ti:</label>
									<div class="col-sm-4">
										<input type="text" class="form-control" id="input_tencongti"
											placeholder="Tên công ti" name="tencongti">
									</div>
									<label for="lbl_email" class="col-sm-2 control-label">Email:</label>
									<div class="col-sm-4">
										<input type="email" name="input_email" class="form-control"
											placeholder="Email" name="email">
									</div>
								</div>

								<!-- Form group -->
								<div class="form-group">
									<label for="lbl_diachi" class="col-sm-2 control-label">Địa
										chỉ:</label>
									<div class="col-sm-4">
										<input type="text" class="form-control" id="input_diachi"
											placeholder="Địa chỉ công ti" name="diachi">
									</div>
									<label for="lbl_sdt" class="col-sm-2 control-label">ĐTDĐ:</label>
									<div class="col-sm-4 has-error">
										<input type="text" class="form-control" id="input_sdt"
											placeholder="Số điện thoại"> <span class="help-block"
											name="sdt">Số điện thoại không hợp lệ</span>
									</div>
								</div>

								<!-- Form group -->
								<div class="form-group">
									<label for="lbl_mst" class="col-sm-2 control-label">Mã
										số thuế:</label>
									<div class="col-sm-4">
										<input type="text" class="form-control" id="input_mst"
											placeholder="Mã khách hàng" name="mst">
									</div>
									<label for="lbl_others" class="col-sm-2 control-label">Thông
										tin khác:</label>
									<div class="col-sm-4">
										<input type="text" class="form-control" id="input_other"
											placeholder="Thông tin liên hệ" name="others">
									</div>
								</div>
							</div>

							<div class="box-footer text-center">
								<button type="submit" class="btn btn-primary">Cập nhật
									thông tin</button>
							</div>

							<div class="alert alert-success alert-dismissible">
								<button type="button" class="close" data-dismiss="alert"
									aria-hidden="true">×</button>
								<h4>
									<i class="icon fa fa-check"></i> Chúc mừng!!!
								</h4>
								Thông tin của bạn đã cập nhật thành công.
							</div>
							<div class="alert alert-danger alert-dismissible">
								<button type="button" class="close" data-dismiss="alert"
									aria-hidden="true">×</button>
								<h4>
									<i class="icon fa fa-check"></i> Lỗi hệ thống!!!
								</h4>
								Xin hãy kiểm tra lại các thông tin sau:
								<ol>
									<li>Email</li>
									<li>Số điện thoại</li>
									<li>Mã số thuế</li>
								</ol>
							</div>
						</form>
					</div>
					<!-- Cập nhật thông tin -->
				</div>
				<!-- End Left -->
				<div class="col-sm-4">

					<!-- Hướng dẫn -->
					<div class="box box-primary">
						<div class="box-header with-border">
							<i class="fa fa-pencil"></i>
							<h3 class="box-title">Hướng dẫn</h3>
						</div>
						<div class="box-body">
							<h4>Giới thiệu</h4>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
								Eaque dolores odit sed quae, asperiores, doloremque expedita
								nobis, non repellendus quod, nam vel accusantium. Magnam esse,
								odit velit voluptates aperiam expedita.</p>
							<h4>Quy định và hướng dẫn sử dụng</h4>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
								Vero, dignissimos illo quasi incidunt voluptates. Necessitatibus
								voluptas aliquam quidem maxime, tenetur iste in, officia nostrum
								distinctio. Itaque quibusdam, accusantium obcaecati eaque.</p>

						</div>

					</div>
					<!-- Hướng dẫn -->

				</div>
				<!-- End Right -->
			</div>

			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->


		<!-- ---FOOTER--- -->
		<!-- Include this in all index page -->
		<jsp:include page="footer.jsp"></jsp:include>
		<!-- /.Include this in all index page -->
	</div>
	<!-- /.End of wrapper -->

</body>
</html>