<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.awt.List"%>
<%@page import="java.util.*"%>
<%@page import="model.*"%>
<%@page import="Dao.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Headnumber add</title>
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
			<h1>Thêm Đầu số mới</h1>
			<ol class="breadcrumb">
				<li><a href="index.jsp"><i class="fa fa-dashboard"></i>
						BillingsSystem</a></li>
				<li><a href="#">Quản trị hệ thống</a></li>
				<li><a href="admin_dauso.jsp">Quản lí Đầu số</a></li>
				<li class="active">Thêm Đầu số</li>
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
								<i class="fa fa-pencil-square"></i> Thông tin Đầu số
							</h3>
						</div>

						<form action="<%=request.getContextPath()%>/ManagerDauso"
							method="get" role="form" class="form-horizontal">
							<div class="box-body">

								<!-- Form group -->
								<div class="form-group">
									<label for="inputDauso" class="col-sm-2 control-label">
										Đầu số: </label>
									<div class="col-sm-4">
										<input type="text" class="form-control" name="txt_DauSo"
											placeholder="Number">
									</div>
								</div>

								<!-- Form group -->
								<div class="form-group">
									<label for="inputNhaMang" class="col-sm-2 control-label">
										Nhà mạng: </label>
									<div class="col-sm-4">
										<input type="text" class="form-control" name="txt_NhaMang"
											placeholder="Nhà mạng">
									</div>
								</div>

								<!-- Form group -->
								<div class="form-group">
									<label for="inputCongTy" class="col-sm-2 control-label">
										Công ti: </label>
									<div class="col-sm-4">
										<select class="form-control" name="congty">
											<option selected="">Company name</option>

											<!-- KẾT NỐI LẤY DỮ LIỆU HIỂN THỊ TỪ DATABASE -->
											<%
												ArrayList<CongTy> listCongTy = CongTyDao.getListCongTy();
													for (int i = 0; i < listCongTy.size(); i++) {
											%>
											<option selected=""
												value=<%=listCongTy.get(i).getCongTyID()%>><%=listCongTy.get(i).getTenCongTy()%></option>
											<%
												}
											%>
										</select>

									</div>
								</div>

							</div>
							<!--  -->
							<input type="hidden" name="command" value="add"></input>
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

</html>