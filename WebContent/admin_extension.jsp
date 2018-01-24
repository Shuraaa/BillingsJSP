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
	<%
		ArrayList<Extension> listExtension = ExtensionDao.getListExtension();
			ArrayList<PhongBan> listPhongBan = PhongBanDao.getListPhongBan();
			ArrayList<CongTy> listCongTy = CongTyDao.getListCongTy();
	%>

	<div class="wrapper">


		<!-- Include this in all index page -->
		<jsp:include page="sideBar.jsp"></jsp:include>
		<!-- /.Include this in all index page -->


		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
			<h1>Quản lí Extension</h1>
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
										<input type="hidden" name="command" value="searchextension"></input>
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
								<i class="ion-fork-repo"></i> Thêm Extension
							</h3>
						</div>

						<div class="box-body">
							<a href="<%=request.getContextPath()%>/admin_extension-add.jsp"
								class="btn btn-primary btn-block"> <i class="ion-steam"></i>
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
										<th>Extension</th>
										<th>Đầu số</th>
										<th>Phòng/ban</th>
										<th>Công ti</th>
										<th>Tác vụ</th>
									</tr>
								</thead>
								<tbody>
									<%
										String congtyid = (String) request.getAttribute("congtyid");
											ArrayList<Extension> listExtensionCT = ExtensionDao.getListEXCongTy(congtyid);
											// search dau so theo cong ty 
											if (congtyid != null) {
									%>
									<!-- LIÊN KẾT VỚI DATABASE ĐỂ LẤY DỮ LIỆU TABLE -->
									<%
										for (int i = 0; i < listExtensionCT.size(); i++) {
									%>
									<tr class="gradeA">
										<td><%=i + 1%></td>
										<!-- cot extension -->
										<td><%=listExtensionCT.get(i).getExtensionID()%></td>
										<!-- cot dau so -->
										<td><%=listExtensionCT.get(i).getDauSoSuDung()%></td>
										<!-- cot ten phong ban -->
										<%
											for (int j = 0; j < listPhongBan.size(); j++) {
															if (listExtensionCT.get(i).getPhongBanID().equals(listPhongBan.get(j).getPhongBanID())) {
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
											href="<%=request.getContextPath()%>/ManagerExtension?command=edit&extensionid=<%=listExtensionCT.get(i).getExtensionID()%>&dauso=<%=listExtensionCT.get(i).getDauSoSuDung()%>&phongbanid=<%=listExtensionCT.get(i).getPhongBanID()%>"><button
													type="button"
													class="btn btn-primary glyphicon glyphicon-edit"></button></a>
											&nbsp;&nbsp; <a href="#" class="linkDelete"><button
													type="button" id="<%=i + 1%>"
													onclick="clickBt($(this).val())"
													class="btn btn-danger glyphicon glyphicon-trash "
													value="<%=listExtensionCT.get(i).getExtensionID()%>&congtyid=<%=congtyid%>"></button></a>
										</td>
									</tr>
									<%
										}
											} else {
									%>

									<!-- LIÊN KẾT VỚI DATABASE ĐỂ LẤY DỮ LIỆU TABLE -->
									<%
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
											&nbsp;&nbsp; <a href="#" class="linkDelete"><button
													type="button" id="<%=i + 1%>"
													onclick="clickBt($(this).val())"
													class="btn btn-danger glyphicon glyphicon-trash "
													value="<%=listExtension.get(i).getExtensionID()%>"></button></a>
										</td>
									</tr>
									<%
										}
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
	<!-- REQUIRED JS SCRIPTS -->
	<script type="text/javascript" src="js/jquery-ui.js"></script>
	<script>
		function clickBt(text) {
			if (confirm("Chi tiết cuộc gọi của Extension này sẽ bị xóa. Bạn có chắc chắn muốn xóa?") == true) {
				$(".linkDelete").attr("href",
						"ManagerExtension?command=delete&extensionid=" + text);
			}
		}
	</script>
</body>
</html>
