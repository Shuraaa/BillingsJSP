<%@page import="java.io.InputStream"%>
<%@page import="Dao.CongTyDao"%>
<%@page import="model.CongTy"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.awt.List"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.io.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Company Management</title>
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


		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
			<h1>Quản lí công ti</h1>
			<ol class="breadcrumb">
				<li><a href="index.jsp"><i class="fa fa-dashboard"></i>
						BillingsSystem</a></li>
				<li><a href="#">Quản trị hệ thống</a></li>
				<li class="active">Quản lí công ti</li>
			</ol>

			</section>

			<!-- Main content -->
			<section class="content">
			<div class="row">

				<!--  -->
				<div class="col-sm-7 pull-left">
					<div class="box box-primary">

						<div class="box-header with-border">
							<h3 class="box-title">
								<i class="glyphicon glyphicon-search"></i> Search
							</h3>
						</div>
						<form action="#" class="form-horizontal">
							<div class="box-body">
								<input class="form-control" id="myInput" type="text"
									placeholder="Search...">
							</div>
						</form>

					</div>
				</div>
				<!--  -->
				<div class="col-sm-3 pull-right">
					<div class="box box-primary">

						<div class="box-header with-border">
							<h3 class="box-title">
								<i class="glyphicon glyphicon-plus"></i> Add Company
							</h3>
						</div>
						<form action="#" class="form-horizontal">
							<div class="box-body">
								<a href="admin_company-add.jsp"
									class="btn btn-primary btn-block"> <i
									class="glyphicon glyphicon-plus"></i> Thêm công ti
								</a>
							</div>
						</form>

					</div>
				</div>

				<!--  -->

				<div class="col-md-12">

					<div class="box box-primary">
						<div class="box-header">
							<h3 class="box-title">Danh sách</h3>
						</div>
						<!-- /.box-header -->
						<div class="box-body no-padding">
							<table id="datatable-responsive"
								class="table table-striped table-bordered dt-responsive nowrap table-hover"
								cellspacing="0" width="100%">
								<thead>
									<tr>
										<th>#</th>
										<th>Tên công ti</th>
										<th>Địa chỉ</th>
										<th>Mã số thuế( Mã khách hàng)</th>
										<th>Email</th>
										<th>ĐTDĐ</th>
										<th>Make-up(%)</th>
										<th>Logo</th>
										<th>Tác vụ</th>
									</tr>
								</thead>
								<tbody id="myTable">
									<!-- LIÊN KẾT VỚI DATABASE ĐỂ LẤY DỮ LIỆU TABLE -->
									<!-- phân trang -->
									<%
										int firstResult = 0;
										if (request.getParameter("index") != null) {
											firstResult = Integer.parseInt(request.getParameter("index"));
										}

										ArrayList<CongTy> listCongTy = CongTyDao.getList10CongTy(firstResult);
										for (int i = 0; i < listCongTy.size(); i++) {
									%>
									<tr class="gradeA">
										<td><%=i + 1%></td>
										<td><%=listCongTy.get(i).getTenCongTy()%></td>
										<td><%=listCongTy.get(i).getDiaChi()%></td>
										<td><%=listCongTy.get(i).getMaSoThue()%></td>
										<td><%=listCongTy.get(i).getEmail()%></td>
										<td><%=listCongTy.get(i).getDienThoai()%></td>
										<td><%=listCongTy.get(i).getTiLeMakeUp()%></td>
										<td><img class="img-responsive img-thumbnail"
											src="ManagerDisplayImg?congtyid=<%=listCongTy.get(i).getCongTyID()%>"
											width="40px" height="40px"></td>
										<td><a
											href="admin_company-update.jsp?congtyid=<%=listCongTy.get(i).getCongTyID()%>&tencongty=<%=listCongTy.get(i).getTenCongTy()%>&diachi=<%=listCongTy.get(i).getDiaChi()%>&email=<%=listCongTy.get(i).getEmail()%>&tlmk=<%=listCongTy.get(i).getTiLeMakeUp()%>&sdt=<%=listCongTy.get(i).getDienThoai()%>&mst=<%=listCongTy.get(i).getMaSoThue()%>"><button
													type="button"
													class="btn btn-primary glyphicon glyphicon-edit"></button></a>
											&nbsp;&nbsp; <a href="#" class="linkDelete"><button
													type="button" id="<%=i + 1%>"
													onclick="clickBt($(this).val())"
													class="btn btn-danger glyphicon glyphicon-trash "
													value="<%=listCongTy.get(i).getCongTyID()%>"></button></a></td>
									</tr>

									<%
										}
									%>
								</tbody>
							</table>
						</div>


						<!-- phan trang
						     author: vinh phu
						      -->
						<!-- /.box-body -->
						<div class="box-footer clearfix">
							<ul class="pagination pagination-sm no-margin pull-right">
								<%
									//get number of pages to show 
									int pages = CongTyDao.countAllOfCompany() / 10;
									if (CongTyDao.countAllOfCompany() % 10 >= 1) {
										pages++;
									}
									for (int i = 0; i < pages; i++) {
										if (firstResult / 10 == i) {
								%>
								<li class="active"><a
									href="admin_company.jsp?index=<%=i * 10%>"><%=i + 1%></a></li>
								<%
									} else {
								%>
								<li><a href="admin_company.jsp?index=<%=i * 10%>"><%=i + 1%></a></li>
								<%
									}
									}
								%>

							</ul>
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
	</div>
	<!-- ./wrapper -->

	<!-- REQUIRED JS SCRIPTS -->
	<!-- Search item in table -->
	<script type="text/javascript" src="js/jquery-ui.js">
		
	</script>
	<script>
		$(document)
				.ready(
						function() {
							$("#myInput")
									.on(
											"keyup",
											function() {
												var value = $(this).val()
														.toLowerCase();
												$("#myTable tr")
														.filter(
																function() {
																	$(this)
																			.toggle(
																					$(
																							this)
																							.text()
																							.toLowerCase()
																							.indexOf(
																									value) > -1)
																});
											});
							/*$(".btnDelete")
									.click(
											function() {
												if (confirm("Bạn có chắc chắn muốn xóa?"+$(".btnDelete").val())) {
													$(".linkDelete")
															.attr(
																	"href",
																	"ManagerCongTy?command=delete&congtyid="
																			+ $("#btnDelete").val());
												}
											});*/

						});
		function clickBt(text) {
			if (confirm("Bạn có chắc chắn muốn xóa?") == true) {
				$(".linkDelete").attr("href",
						"ManagerCongTy?command=delete&congtyid=" + text);
			}
		}
	</script>
</body>
</html>
