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
<title>Extension add</title>
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
			<h1>Thêm Extension mới</h1>
			<ol class="breadcrumb">
				<li><a href="index.jsp"><i class="fa fa-dashboard"></i>
						BillingsSystem</a></li>
				<li><a href="#">Quản trị hệ thống</a></li>
				<li><a href="admin_extension.jsp">Quản lí Extension</a></li>
				<li class="active">Thêm Extension</li>
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

								<i class="fa fa-pencil-square"></i> Thông tin Extension
							</h3>
						</div>

						<form action="<%=request.getContextPath()%>/ManagerExtension"
							method="get" role="form" class="form-horizontal">
							<div class="box-body">
								<form action="<%=request.getContextPath()%>/ManagerExtension"
									method="get" class="form-horizontal">

									<%
										String idcongty = (String) request.getAttribute("choncongty");
											if ((idcongty == null)) {
									%>
									<!-- Form group -->
									<div class="form-group">
										<label for="inputCompany" class="col-sm-2 control-label">Chọn
											công ti: </label>
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
										<input type="hidden" name="command" value="choncongty"></input>
										<div class="col-sm-2">
											<button type="submit" class="btn btn-primary">Xác
												nhận</button>
										</div>
										<div class="col-sm-2">
											<a href="admin_company-add.jsp"
												class="form-control btn btn-success">Thêm công ti</a>
										</div>
									</div>
								</form>
								<%
									} else {
								%>
								<!-- Form group -->
								<div class="form-group">
									<label for="input_extension" class="col-sm-2 control-label">Extension:
									</label>
									<div class="col-sm-4">
										<input type="text" class="form-control" name="txt_extension"
											placeholder="Extension name">
									</div>
									<!-- xử lý ngoại lệ extension-->
									<%
										String errorextension = (String) request.getAttribute("errorextension");
												if (errorextension != null) {
									%>
									<p style="color: red;"><%=errorextension%></p>
									<%
										}
									%>
								</div>

								<!-- Form group -->
								<div class="form-group">
									<label for="inputGroup" class="col-sm-2 control-label">Đầu
										số: </label>
									<div class="col-sm-4">
										<select class="form-control" name="txt_DauSo">
											<option selected="">Group name</option>

											<!-- KẾT NỐI LẤY DỮ LIỆU HIỂN THỊ TỪ DATABASE -->
											<%
												ArrayList<DauSo> listDauSo = DauSoDao.getListDauSoCongTy(idcongty);
														for (int i = 0; i < listDauSo.size(); i++) {
											%>
											<option selected="selected"
												value=<%=listDauSo.get(i).getDauSoSuDung()%>><%=listDauSo.get(i).getDauSoSuDung()%></option>
											<%
												}
											%>

										</select>
									</div>
								</div>

								<!--  -->
								<div class="form-group">
									<label for="inputGroup" class="col-sm-2 control-label">Phòng/ban:
									</label>
									<div class="col-sm-4">
										<select class="form-control" name="phongban">
											<option selected="">Group name</option>

											<!-- KẾT NỐI LẤY DỮ LIỆU HIỂN THỊ TỪ DATABASE -->
											<%
												ArrayList<PhongBan> listPhongBan = PhongBanDao.getListPBCongTy(idcongty);
														for (int i = 0; i < listPhongBan.size(); i++) {
											%>
											<option selected="selected"
												value=<%=listPhongBan.get(i).getPhongBanID()%>><%=listPhongBan.get(i).getTenPhongBan()%></option>
											<%
												}
											%>

										</select>
									</div>
									<div class="col-sm-2">
										<a href="admin_group-add.jsp"
											class="form-control btn btn-success">Thêm phòng/ban</a>
									</div>
								</div>

								<!--  -->
								<input type="hidden" name="command" value="add"></input>
								<div class="box-footer text-center">
									<button type="submit" class="btn btn-primary">Xác nhận</button>
								</div>
							</div>
						</form>
					</div>
					<!-- Cập nhật thông tin -->
					<%
						}
					%>
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
