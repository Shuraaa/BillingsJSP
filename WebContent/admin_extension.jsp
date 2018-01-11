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
<title>Extension Management</title>
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
			<h1>Quản lí công ti</h1>
			<ol class="breadcrumb">
				<li><a href="index.jsp"><i class="fa fa-dashboard"></i>
						BillingsSystem</a></li>
				<li><a href="#">Quản trị hệ thống</a></li>
				<li class="active">Quản lí Extension</li>
			</ol>

			</section>

			<!-- Main content -->
			<section class="content">
			<div class="row">

				<div class="col-md-12">
					<div class="box box-primary">
						<div class="box-header">
							<h3 class="box-title">Danh sách</h3>
							<div class="col-sm-2 pull-right">
								<a href="admin_extension-add.jsp"
									class="btn btn-primary btn-block"> <i class="ion-steam"></i>
									Thêm Extension
								</a>
							</div>
						</div>
						<!-- /.box-header -->
						<div class="box-body no-padding">
							<table id="datatable-responsive"
								class="display table table-striped table-bordered dt-responsive"
								cellspacing="0" width="100%">
								<thead>
									<tr>
										<th>#</th>
										<th>Extension</th>
										<th>Đầu số</th>
										<th>Phòng/ban</th>
										<th>Công ti</th>
										<th>Tác vụ</th>
									</tr>
								</thead>
								<tbody>


									<!-- LIÊN KẾT VỚI DATABASE ĐỂ LẤY DỮ LIỆU TABLE -->
									<%
										ArrayList<Extension> listExtension = ExtensionDao.getListExtension();
											ArrayList<PhongBan> listPhongBan = PhongBanDao.getListPhongBan();
											ArrayList<CongTy> listCongTy = CongTyDao.getListCongTy();
											for (int i = 0; i < listExtension.size(); i++) {
									%>
									<tr class="gradeA">
										<td><%=i + 1%></td>
										<!-- cot extension -->
										<td><%=listExtension.get(i).getExtensionID()%></td>
										<!-- cot dau so -->
										<td><%=listExtension.get(i).getDauSoSuDung()%></td>
										<!-- cot ten phong ban -->
										<%
											for (int j = 0; j < listPhongBan.size(); j++) {
														if (listExtension.get(i).getPhongBanID().equals(listPhongBan.get(j).getPhongBanID())) {
										%>
										<td><%=listPhongBan.get(j).getTenPhongBan()%></td>
										<!-- cot ten cong ty-->
										<%
											for (int k = 0; k < listCongTy.size(); k++) {
																if (listPhongBan.get(j).getCongTyID().equals(listCongTy.get(k).getCongTyID())) {
										%>
										<td><%=listCongTy.get(k).getTenCongTy()%></td>

										<%
											}
															}
														}
													}
										%>
										<td><a
											href="<%=request.getContextPath()%>/ManagerExtension?command=edit&extensionid=<%=listExtension.get(i).getExtensionID()%>&dauso=<%=listExtension.get(i).getDauSoSuDung()%>&phongbanid=<%=listExtension.get(i).getPhongBanID()%>"><button
													type="button"
													class="btn btn-primary glyphicon glyphicon-edit"></button></a>
											&nbsp;&nbsp; <a
											href="<%=request.getContextPath()%>/ManagerExtension?command=delete&extensionid=<%=listExtension.get(i).getExtensionID()%>"><button
													type="button"
													class="btn btn-danger glyphicon glyphicon-trash"></button></a>
										</td>
									</tr>
									<%
										}
									%>


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
