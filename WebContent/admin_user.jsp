<%@page import="java.awt.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="model.*"%>
<%@page import="Dao.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>User Management</title>
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
			<section class="content-header">
			<h1>Quản lí tài khoản</h1>
			<ol class="breadcrumb">
				<li><a href="index.jsp"><i class="fa fa-dashboard"></i>
						BillingsSystem</a></li>
				<li><a href="#">Quản trị hệ thống</a></li>
				<li class="active">Quản lí tài khoản</li>
			</ol>

			</section>

			<!-- Main content -->
			<section class="content">
			<div class="row">

				<!--  -->
				<div class="col-sm-5">
					<div class="box box-primary">
						<div class="box-header with-border">
							<h3 class="box-title">
								<i class="glyphicon glyphicon-filter"></i> Filter
							</h3>
						</div>

						<form action="<%=request.getContextPath()%>/Search" method="get" class="form-horizontal">
							<div class="box-body">
								<div class="row">
									<div class="col-sm-8">
										<select class="form-control" name="congtyid">
											<option disabled selected>Tên công ty</option>
											<!-- KẾT NỐI LẤY DỮ LIỆU HIỂN THỊ TỪ DATABASE -->
											<%
												ArrayList<CongTy> listCongTy = CongTyDao.getListCongTy();
													for (int i = 0; i < listCongTy.size(); i++) {
											%>
											<option value=<%=listCongTy.get(i).getCongTyID()%>><%=listCongTy.get(i).getTenCongTy()%></option>
											<%
												}
											%>
										</select>
									</div>
									<div class="col-sm-4">
										<input type="hidden" name="command" value="searchuser"></input>
										<button type="submit" class="btn btn-primary btn-block">
											<i class="glyphicon glyphicon-search"></i> Xác nhận
										</button>
									</div>
								</div>
							</div>
						</form>

					</div>
				</div>
				<!-- /.End -->

				<div class="col-sm-3">
					<div class="box box-primary">
						<div class="box-header with-border">
							<h3 class="box-title">
								<i class="ion-person-add"></i> Thêm tài khoản
							</h3>
						</div>

						<div class="box-body">
							<a href="<%=request.getContextPath()%>/admin_user-add.jsp"
								class="btn btn-primary btn-block"> <i class="ion-person-add"></i>
								Thêm mới
							</a>
						</div>
					</div>
				</div>

				<div class="col-md-12">

					<div class="box box-primary">
						<div class="box-header">
							<h3 class="box-title">Danh sách</h3>
						</div>
						<!-- /.box-header -->
						<div class="box-body no-padding">
							<table id="datatable-responsive"
								class="display table table-striped table-bordered dt-responsive"
								cellspacing="0" width="100%">
								<thead>
									<tr>
										<th>#</th>
										<th>Username</th>
										<th>Công ti</th>
										<th>Quyền truy cập</th>
										<th>Tác vụ</th>
									</tr>
								</thead>
								<tbody>
									<%
										String congtyid =(String) request.getAttribute("congtyid");
									ArrayList<TaiKhoan> listTaiKhoanCT = TaiKhoanDao.getListTaiKhoanCT(congtyid);
									// search dau so theo cong ty 
									if (congtyid != null){%>
														<!-- LIÊN KẾT VỚI DATABASE ĐỂ LẤY DỮ LIỆU TABLE -->
												<%
							
														for (int i = 0; i < listTaiKhoanCT.size(); i++) {
												%>
												<tr class="gradeA">
													<td><%=i + 1%></td>
													<!-- cot ten username-->
													<td><%=listTaiKhoanCT.get(i).getUserName()%></td>
													<!-- cot ten cong ty-->
													<%
														for (int j = 0; j < listCongTy.size(); j++) {
																	if (listTaiKhoanCT.get(i).getCongTyID().equals(listCongTy.get(j).getCongTyID())) {
													%>
													<td><%=listCongTy.get(j).getTenCongTy()%></td>
													<%
														}
																}
													%>
													<!-- cot quyen-->
													<%
														if (listTaiKhoanCT.get(i).getRole() == 0) {
													%>
													<td>ADMIN</td>
													<%
														}
													%>
													<%
														if (listTaiKhoanCT.get(i).getRole() == 1) {
													%>
													<td>USER</td>
													<%
														}
													%>
													<%
														if (listTaiKhoanCT.get(i).getRole() == 2) {
													%>
													<td>VIEW</td>
													<%
														}
													%>
													<td>&nbsp;&nbsp; <a
														href="<%=request.getContextPath()%>/ManagerTaiKhoan?command=delete&userName=<%=listTaiKhoanCT.get(i).getUserName()%>&congtyid=<%=congtyid%>"><button
																type="button"
																class="btn btn-danger glyphicon glyphicon-trash"></button></a>
			
													</td>
												</tr>
									<%
										}
									} else{%>
									<!-- LIÊN KẾT VỚI DATABASE ĐỂ LẤY DỮ LIỆU TABLE -->
									<%
										ArrayList<TaiKhoan> listTaiKhoan = TaiKhoanDao.getListTaiKhoan();
											for (int i = 0; i < listTaiKhoan.size(); i++) {
									%>
									<tr class="gradeA">
										<td><%=i + 1%></td>
										<!-- cot ten username-->
										<td><%=listTaiKhoan.get(i).getUserName()%></td>
										<!-- cot ten cong ty-->
										<%
											for (int j = 0; j < listCongTy.size(); j++) {
														if (listTaiKhoan.get(i).getCongTyID().equals(listCongTy.get(j).getCongTyID())) {
										%>
										<td><%=listCongTy.get(j).getTenCongTy()%></td>
										<%
											}
													}
										%>
										<!-- cot quyen-->
										<%
											if (listTaiKhoan.get(i).getRole() == 0) {
										%>
										<td>ADMIN</td>
										<%
											}
										%>
										<%
											if (listTaiKhoan.get(i).getRole() == 1) {
										%>
										<td>USER</td>
										<%
											}
										%>
										<%
											if (listTaiKhoan.get(i).getRole() == 2) {
										%>
										<td>VIEW</td>
										<%
											}
										%>
										<td>&nbsp;&nbsp; <a
											href="<%=request.getContextPath()%>/ManagerTaiKhoan?command=delete&userName=<%=listTaiKhoan.get(i).getUserName()%>"><button
													type="button"
													class="btn btn-danger glyphicon glyphicon-trash"></button></a>

										</td>
									</tr>
									<%
										}
									}%>
								</tbody>
							</table>
						</div>
						<!-- /.box-body -->

					</div>
					<!-- /.box -->
				</div>
			</div>
			</section>
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
