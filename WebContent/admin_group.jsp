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
<title>Group Management</title>
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
				<li class="active">Quản lí phòng/ban</li>
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
								<a href="admin_group-add.jsp" class="btn btn-primary btn-block">
									<i class="ion-person-stalker"></i> Thêm phòng ban
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
										<th>Phòng/ban</th>
										<th>Công ti</th>
										<th>Tác vụ</th>
									</tr>
								</thead>
								<tbody>


									<!-- LIÊN KẾT VỚI DATABASE ĐỂ LẤY DỮ LIỆU TABLE -->
									<%
										ArrayList<PhongBan> listPhongBan = PhongBanDao.getListPhongBan();
											ArrayList<CongTy> listCongTy = CongTyDao.getListCongTy();
											for (int i = 0; i < listPhongBan.size(); i++) {
									%>
									<tr class="gradeA">
										<td><%=i + 1%></td>
										<!--Lenh edit ten phong ban -->
										<%
											String idphongban = (String) request.getAttribute("editphongban");
													String id = listPhongBan.get(i).getPhongBanID();
													if ((idphongban != null) && (idphongban.equals(id))) {
										%>
										<form action="ManagerPhongBan" method="get">
											<td><input type="text" class="form-control"
												name="txt_tenphongban" placeholder="Group name"
												value="<%=listPhongBan.get(i).getTenPhongBan()%>"></td> <input
												type="hidden" name="txt_idphongban"
												value="<%=listPhongBan.get(i).getPhongBanID()%>"></input> <input
												type="hidden" name="command" value="update"></input>
											<%
												} else {
											%>
											<td><%=listPhongBan.get(i).getTenPhongBan()%></td>
											<%
												}
											%>
											<%
												for (int j = 0; j < listCongTy.size(); j++) {
															if (listPhongBan.get(i).getCongTyID().equals(listCongTy.get(j).getCongTyID())) {
											%>
											<td><%=listCongTy.get(j).getTenCongTy()%></td>
											<%
												}
														}
											%>
											<td>
												<%
													String idphongban1 = (String) request.getAttribute("editphongban");
															String id1 = listPhongBan.get(i).getPhongBanID();
															if ((idphongban1 != null) && (idphongban1.equals(id1))) {
												%>
												<button type="submit"
													class="btn btn-success glyphicon glyphicon-ok-sign"></button>
										</form>

										<%
											} else {
										%>
										<a
											href="<%=request.getContextPath()%>/ManagerPhongBan?command=edit&phongbanid=<%=listPhongBan.get(i).getPhongBanID()%>&tenphongban=<%=listPhongBan.get(i).getTenPhongBan()%>"><button
												type="button"
												class="btn btn-primary glyphicon glyphicon-edit"></button></a>
										<%
											}
										%>
										&nbsp;&nbsp;
										<a
											href="<%=request.getContextPath()%>/ManagerPhongBan?command=delete&phongbanid=<%=listPhongBan.get(i).getPhongBanID()%>"><button
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
