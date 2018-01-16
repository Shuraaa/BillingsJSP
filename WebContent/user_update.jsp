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
			int role = (int) session.getAttribute("role");
			String name = (String) session.getAttribute("companyName");
			String diaChi = (String) session.getAttribute("companyAddress");
			String email = (String) session.getAttribute("companyEmail");
			String sdt = (String) session.getAttribute("companyPhone");
			String mst = (String) session.getAttribute("companyMST");
			String iD = (String) session.getAttribute("companyID");
	%>

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
				<li><a href="<%=request.getContextPath()%>/index.jsp"><i
						class="fa fa-dashboard"></i> BillingsSystem</a></li>
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

						<!-- /.widget-logo-image -->
						<div class="widget-user-header bg-blue">
							<div class="widget-user-image">
								<img class="img-square" src="ManagerDisplayImg?congtyid=<%=iD%>"
									alt="User Avatar">
							</div>
							<h3 class="widget-user-username">Logo</h3>
							<input class="widget-user-desc" type="file" class="form-control"
								<%if (role == 2) {%> disabled <%}%>>
						</div>

						<p style="color: red"><%=error%></p>
						<form action="<%=request.getContextPath()%>/UpdateProfile"
							role="form" method="get" class="form-horizontal"
							enctype="multipart/form-data" id="form">
							<div class="box-body">

								<!-- Form group -->
								<div class="form-group">
									<label for="lbl_tencongti" class="col-sm-2 control-label">Tên
										công ti:</label>
									<div class="col-sm-4">
										<input type="text" class="form-control" id="input_tencongti"
											name="tencongti" value="<%=name%>" disabled>
									</div>

									<label for="lbl_email" class="col-sm-2 control-label">Email:</label>
									<div class="col-sm-4">
										<input type="email" class="form-control confirm-box"
											value="<%=email%>" name="emailCT">
									</div>
								</div>

								<!-- Form group -->
								<div class="form-group">
									<label for="lbl_diachi" class="col-sm-2 control-label">Địa
										chỉ:</label>
									<div class="col-sm-4">
										<input type="text" class="form-control confirm-box"
											name="diaChi" value="<%=diaChi%>">
									</div>
									<label for="lbl_sdt" class="col-sm-2 control-label">ĐTDĐ:</label>
									<div class="col-sm-4">
										<input type="text" class="form-control confirm-box"
											id="input_sdt" value="<%=sdt%>" name="sdt">
									</div>
								</div>

								<!-- Form group -->
								<div class="form-group">
									<label for="lbl_mst" class="col-sm-2 control-label">Mã
										số thuế:</label>
									<div class="col-sm-4">
										<input type="text" class="form-control confirm-box"
											value="<%=mst%>" name="mst">
									</div>
									<label for="lbl_others" class="col-sm-2 control-label">Thông
										tin khác:</label>
									<div class="col-sm-4">
										<input type="text" class="form-control confirm-box"
											name="others">
									</div>
								</div>
							</div>

							<div class="box-footer">
								<%
									if (role == 1) {
								%>
								<div class="row">
									<div class="col-sm-3"></div>
									<div class="col-sm-3"></div>
									<div class="col-sm-3">
										<button type="submit" class="btn btn-primary form-control">
											<i class="fa fa-refresh"></i> Cập nhật thông tin
										</button>
									</div>
									<div class="col-sm-3">
										<a href="<%=request.getContextPath()%>/index.jsp"
											class="btn btn-danger form-control"> <i
											class="fa fa-remove"></i> Hủy
										</a>
									</div>
								</div>
								<%
									} else if (role == 2) {
								%>
								<div class="form-group">
									<div class="col-sm-3 pull-right">
										<button id="confirm-box" type="submit"
											class="btn btn-primary form-control" disabled
											style="background-color: blue;">Cập nhật thông tin</button>
									</div>
									<div class="col-sm-2 pull-right">
										<a href="<%=request.getContextPath()%>/index.jsp"
											class="btn btn-danger form-control"> <i
											class="fa fa-remove"></i> Hủy
										</a>
									</div>
								</div>

								<dialog id="confirm" class="site-dialog"> <header
									class="dialog-header">
								<h1 style="color: #990000" class="text-center">
									<i class="ion-social-freebsd-devil"> ALERT</i>
								</h1>
								</header>
								<div class="dialog-content">
									<p>Bạn không có quyền để chỉnh sửa nội dung này !!!</p>
								</div>
								<div class="text-center">
									<a href="<%=request.getContextPath()%>/index.jsp" type="button"
										class="btn btn-danger" id="home" style="color: white; "><i
										class="ion-home"> Trang chủ</i></a>
								</div>
								</dialog>
								<%
									}
								%>
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
		<%
			}
		%>
	</div>
	<!-- /.End of wrapper -->
	<script>
		(function($) {
			'use strict';
			var $accountDelete = $('.confirm-box'), $accountDeleteDialog = $('#confirm'), transition;
			$accountDelete.on('click', function() {
				$accountDeleteDialog[0].showModal();
				transition = window.setTimeout(function() {
					$accountDeleteDialog.addClass('dialog-scale');
				}, 0.5);
			});
		})(jQuery);
	</script>
</body>
</html>