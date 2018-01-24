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
	<%
		ArrayList<CongTy> listCongTy = CongTyDao.getListCongTy();
			ArrayList<PhongBan> listPhongBan = PhongBanDao.getListPhongBan();
			String congtyid = (String) request.getAttribute("congtyid");
			ArrayList<PhongBan> listPhongBanCT = PhongBanDao.getListPBCongTy(congtyid);
	%>

	<div class="wrapper">


		<!-- Include this in all index page -->
		<jsp:include page="sideBar.jsp"></jsp:include>
		<!-- /.Include this in all index page -->


		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
			<h1>Quản lí phòng/ban</h1>
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

				<!--  -->
				<div class="col-sm-5">
					<div class="box box-primary">
						<div class="box-header with-border">
							<h3 class="box-title">
								<i class="glyphicon glyphicon-filter"></i> Filter
							</h3>
						</div>

						<form action="<%=request.getContextPath()%>/Search" method="get"
							class="form-horizontal">
							<div class="box-body">
								<div class="row">
									<div class="col-sm-8">
										<select class="form-control" name="congtyid">
											<option disabled selected>Tên công ty</option>
											<!-- KẾT NỐI LẤY DỮ LIỆU HIỂN THỊ TỪ DATABASE -->
											<%
												for (int i = 0; i < listCongTy.size(); i++) {
											%>
											<option value=<%=listCongTy.get(i).getCongTyID()%>><%=listCongTy.get(i).getTenCongTy()%></option>
											<%
												}
											%>
										</select>
									</div>
									<div class="col-sm-4">
										<input type="hidden" name="command" value="searchphongban"></input>
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
								<i class="ion-person-stalker"></i> Thêm phòng/ban
							</h3>
						</div>

						<div class="box-body">
							<a href="<%=request.getContextPath()%>/admin_group-add.jsp"
								class="btn btn-primary btn-block"> <i
								class="ion-person-stalker"></i> Thêm mới
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
										<th>Phòng/ban</th>
										<th>Công ti</th>
										<th>Tác vụ</th>
									</tr>
								</thead>
								<tbody>
									<%
										//search group theo cong ty
											// search dau so theo cong ty 
											if (congtyid != null) {
									%>
									<!-- LIÊN KẾT VỚI DATABASE ĐỂ LẤY DỮ LIỆU TABLE -->
									<%
										for (int i = 0; i < listPhongBanCT.size(); i++) {
									%>
									<tr class="gradeA">
										<td><%=i + 1%></td>
										<!--Lenh edit ten phong ban -->
										<%
											String idphongban = (String) request.getAttribute("editphongban");
														String id = listPhongBanCT.get(i).getPhongBanID();
														if ((idphongban != null) && (idphongban.equals(id))) {
										%>
										<form action="ManagerPhongBan" method="get">
											<td><input type="text" class="form-control"
												name="txt_tenphongban" placeholder="Group name"
												value="<%=listPhongBanCT.get(i).getTenPhongBan()%>"></input></td>
											<input type="hidden" name="txt_idphongban"
												value="<%=listPhongBanCT.get(i).getPhongBanID()%>"></input>
											<input type="hidden" name="command" value="update"></input> <input
												type="hidden" name="congtyid" value=<%=congtyid%>></input>
											<%
												} else {
											%>
											<td><%=listPhongBanCT.get(i).getTenPhongBan()%></td>
											<%
												}
															for (int j = 0; j < listCongTy.size(); j++) {
																if (listPhongBanCT.get(i).getCongTyID().equals(listCongTy.get(j).getCongTyID())) {
											%>
											<td><%=listCongTy.get(j).getTenCongTy()%></td>
											<%
												}
															}
											%>
											<td>
												<%
													String id1 = listPhongBanCT.get(i).getPhongBanID();
																if ((idphongban != null) && (idphongban.equals(id1))) {
												%>
												<button type="submit"
													class="btn btn-success glyphicon glyphicon-ok-sign"></button>
										</form>
										<%
											} else {
										%>
										<a
											href="<%=request.getContextPath()%>/ManagerPhongBan?command=edit&phongbanid=<%=listPhongBanCT.get(i).getPhongBanID()%>&tenphongban=<%=listPhongBanCT.get(i).getTenPhongBan()%>&congtyid=<%=congtyid%>"><button
												type="button"
												class="btn btn-primary glyphicon glyphicon-edit"></button></a>
										<%
											}
										%>
										&nbsp;&nbsp;
										<a href="#" class="linkDelete"><button type="button"
												id="<%=i + 1%>" onclick="clickBt($(this).val())"
												class="btn btn-danger glyphicon glyphicon-trash "
												value="<%=listPhongBanCT.get(i).getPhongBanID()%>&congtyid=<%=congtyid%>"></button></a>
										</td>
									</tr>
									<%
										}
											} // hien thi tất cả group
											else {
									%>

									<!-- LIÊN KẾT VỚI DATABASE ĐỂ LẤY DỮ LIỆU TABLE -->
									<%
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
												value="<%=listPhongBan.get(i).getTenPhongBan()%>"></input></td> <input
												type="hidden" name="txt_idphongban"
												value="<%=listPhongBan.get(i).getPhongBanID()%>"></input> <input
												type="hidden" name="command" value="update"></input>
											<%
												} else {
											%>
											<td><%=listPhongBan.get(i).getTenPhongBan()%></td>
											<%
												}
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
													String id1 = listPhongBan.get(i).getPhongBanID();
																if ((idphongban != null) && (idphongban.equals(id1))) {
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
										<a href="#" class="linkDelete"><button type="button"
												id="<%=i + 1%>" onclick="clickBt($(this).val())"
												class="btn btn-danger glyphicon glyphicon-trash "
												value="<%=listPhongBan.get(i).getPhongBanID()%>"></button></a>
										</td>
									</tr>
									<%
										}
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
	<!-- REQUIRED JS SCRIPTS -->
	<script type="text/javascript" src="js/jquery-ui.js"></script>
	<script>
		function clickBt(text) {
			if (confirm("Extension và Chi tiết cuộc gọi liên quan đến Phòng/ban này sẽ bị xóa. Bạn có chắc chắn muốn xóa?") == true) {
				$(".linkDelete").attr("href",
						"ManagerPhongBan?command=delete&phongbanid=" + text);
			}
		}
	</script>
</body>
</html>
