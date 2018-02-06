<%@page import="java.util.*"%>
<%@page import="model.*"%>
<%@page import="Dao.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.awt.List"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.io.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js">
</script>
<![endif]-->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Bảng mã cuộc gọi</title>
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
			String tab = (String) request.getAttribute("tab");
	%>

	<div class="wrapper">

		<!-- Include this in all index page -->
		<jsp:include page="sideBar.jsp"></jsp:include>
		<!-- /.Include this in all index page -->


		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
			<h1>Bảng mã cuộc gọi</h1>
			<ol class="breadcrumb">
				<li><a href="<%=request.getContextPath()%>/index.jsp"><i
						class="fa fa-dashboard"></i> BillingsSystem</a></li>
				<li><a href="#">Quản trị hệ thống</a></li>
				<li class="active">Bảng mã</li>
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
								<a href="admin_bangma-add.jsp" class="btn btn-primary btn-block">
									<i class="ion-fork-repo"></i> Thêm
								</a>
							</div>
						</div>
						<!-- /.box-header -->
						<ul class="nav nav-tabs">
							<li class="active"><a data-toggle="tab" href="#menu1">Nội
									hạt</a></li>
							<li><a data-toggle="tab" href="#menu2">Di động</a></li>
							<li><a data-toggle="tab" href="#menu3">Liên tỉnh</a></li>
							<li><a data-toggle="tab" href="#menu4">Dịch vụ</a></li>
							<li><a data-toggle="tab" href="#menu5">Quốc tế</a></li>
						</ul>
						<!-- /.Start tab-content -->
						<div class="tab-content">

							<!-- /.Menu 1 -->
							<div id="menu1" class="tab-pane fade in active">
								<div class="box-body no-padding table-responsive">
									<table id="datatable-responsive"
										class="display table table-striped table-bordered table-hover"
										cellspacing="0" width="100%">
										<thead>
											<tr>
												<th>#</th>
												<th>Tên mã</th>
												<th>Mã quy ước</th>
												<th>Chiều dài</th>
												<th>Block 1s</th>
												<th>Block 6s</th>
												<th>Block 10s</th>
												<th>Block 1m</th>
												<th>Tác vụ</th>
											</tr>
										</thead>

										<tbody>
											<%
												ArrayList<BangMa> listbangmaNH = BangMaDao.getListBangMa("A");
													for (int i = 0; i < listbangmaNH.size(); i++) {
											%>
											<tr class="gradeA">
												<td><%=i + 1%></td>
												<td><%=listbangmaNH.get(i).getTen()%></td>
												<td><%=listbangmaNH.get(i).getMaQuyUoc()%></td>
												<td><%=listbangmaNH.get(i).getChieuDai()%></td>
												<td>(FPT): <%=listbangmaNH.get(i).getBlock1sFPT()%> </br>(CMC):
													<%=listbangmaNH.get(i).getBlock1sCMC()%></td>
												<td>(FPT): <%=listbangmaNH.get(i).getBlock6sFPT()%> </br>(CMC):
													<%=listbangmaNH.get(i).getBlock6sCMC()%></td>
												<td>(FPT): <%=listbangmaNH.get(i).getBlock10sFPT()%></br>(CMC):
													<%=listbangmaNH.get(i).getBlock10sCMC()%></td>
												<td>(FPT): <%=listbangmaNH.get(i).getBlock1mFPT()%> </br>(CMC):
													<%=listbangmaNH.get(i).getBlock1mCMC()%>
												</td>
												<td><a
													href="<%=request.getContextPath()%>/ManagerBangMa?command=edit&maquyuoc=<%=listbangmaNH.get(i).getMaQuyUoc()%>&chieudai=<%=listbangmaNH.get(i).getChieuDai()%>&tab=noihat"><button
															type="button"
															class="btn btn-primary glyphicon glyphicon-edit"></button></a>
													&nbsp;&nbsp; <a href="#" class="linkDelete"><button
															type="button" id="<%=i + 1%>"
															onclick="clickBt($(this).val())"
															class="btn btn-danger glyphicon glyphicon-trash "
															value="<%=listbangmaNH.get(i).getMaQuyUoc()%>&chieudai=<%=listbangmaNH.get(i).getChieuDai()%>&tab=noihat"></button></a></td>
											</tr>
											<%
												}
											%>
										</tbody>
									</table>
								</div>
							</div>
							<!--/.End Menu 1-->

							<!-- /.Menu 2 -->
							<div id="menu2" class="tab-pane fade">
								<div class="box-body no-padding table-responsive">
									<table id="datatable-responsive"
										class="display table table-striped table-bordered table-hover"
										cellspacing="0" width="100%">
										<thead>
											<tr>
												<th>#</th>
												<th>Tên mã</th>
												<th>Mã quy ước</th>
												<th>Chiều dài</th>
												<th>Block 1s</th>
												<th>Block 6s</th>
												<th>Block 10s</th>
												<th>Block 1m</th>
												<th>Tác vụ</th>
											</tr>
										</thead>

										<tbody>
											<%
												ArrayList<BangMa> listbangmaDD = BangMaDao.getListBangMa("B");
													for (int i = 0; i < listbangmaDD.size(); i++) {
											%>
											<tr class="gradeA">
												<td><%=i + 1%></td>
												<td><%=listbangmaDD.get(i).getTen()%></td>
												<td><%=listbangmaDD.get(i).getMaQuyUoc()%></td>
												<td><%=listbangmaDD.get(i).getChieuDai()%></td>
												<td>(FPT): <%=listbangmaDD.get(i).getBlock1sFPT()%> </br>(CMC):
													<%=listbangmaDD.get(i).getBlock1sCMC()%></td>
												<td>(FPT): <%=listbangmaDD.get(i).getBlock6sFPT()%> </br>(CMC):
													<%=listbangmaDD.get(i).getBlock6sCMC()%></td>
												<td>(FPT): <%=listbangmaDD.get(i).getBlock10sFPT()%></br>(CMC):
													<%=listbangmaDD.get(i).getBlock10sCMC()%></td>
												<td>(FPT): <%=listbangmaDD.get(i).getBlock1mFPT()%> </br>(CMC):
													<%=listbangmaDD.get(i).getBlock1mCMC()%>
												</td>
												<td><a
													href="<%=request.getContextPath()%>/ManagerBangMa?command=edit&maquyuoc=<%=listbangmaDD.get(i).getMaQuyUoc()%>&chieudai=<%=listbangmaDD.get(i).getChieuDai()%>&tab=didong"><button
															type="button"
															class="btn btn-primary glyphicon glyphicon-edit"></button></a>
													&nbsp;&nbsp; <a href="#" class="linkDelete"><button
															type="button" id="<%=i + 1%>"
															onclick="clickBt($(this).val())"
															class="btn btn-danger glyphicon glyphicon-trash "
															value="<%=listbangmaDD.get(i).getMaQuyUoc()%>&chieudai=<%=listbangmaDD.get(i).getChieuDai()%>&tab=didong"></button></a></td>
											</tr>
											<%
												}
											%>
										</tbody>
									</table>
								</div>
							</div>
							<!--/.End Menu 2-->

							<!-- /.Menu 3 -->
							<div id="menu3" class="tab-pane fade">
								<div class="box-body no-padding table-responsive">
									<table id="datatable-responsive"
										class="display table table-striped table-bordered table-hover"
										cellspacing="0" width="100%">
										<thead>
											<tr>
												<th>#</th>
												<th>Tên mã</th>
												<th>Mã quy ước</th>
												<th>Chiều dài</th>
												<th>Block 1s</th>
												<th>Block 6s</th>
												<th>Block 10s</th>
												<th>Block 1m</th>
												<th>Tác vụ</th>
											</tr>
										</thead>

										<tbody>
											<%
												ArrayList<BangMa> listbangmaLT = BangMaDao.getListBangMa("C");
													for (int i = 0; i < listbangmaLT.size(); i++) {
											%>
											<tr class="gradeA">
												<td><%=i + 1%></td>
												<td><%=listbangmaLT.get(i).getTen()%></td>
												<td><%=listbangmaLT.get(i).getMaQuyUoc()%></td>
												<td><%=listbangmaLT.get(i).getChieuDai()%></td>
												<td>(FPT): <%=listbangmaLT.get(i).getBlock1sFPT()%> </br>(CMC):
													<%=listbangmaLT.get(i).getBlock1sCMC()%></td>
												<td>(FPT): <%=listbangmaLT.get(i).getBlock6sFPT()%> </br>(CMC):
													<%=listbangmaLT.get(i).getBlock6sCMC()%></td>
												<td>(FPT): <%=listbangmaLT.get(i).getBlock10sFPT()%></br>(CMC):
													<%=listbangmaLT.get(i).getBlock10sCMC()%></td>
												<td>(FPT): <%=listbangmaLT.get(i).getBlock1mFPT()%> </br>(CMC):
													<%=listbangmaLT.get(i).getBlock1mCMC()%>
												</td>
												<td><a
													href="<%=request.getContextPath()%>/ManagerBangMa?command=edit&maquyuoc=<%=listbangmaLT.get(i).getMaQuyUoc()%>&chieudai=<%=listbangmaLT.get(i).getChieuDai()%>&tab=lientinh"><button
															type="button"
															class="btn btn-primary glyphicon glyphicon-edit"></button></a>
													&nbsp;&nbsp; <a href="#" class="linkDelete"><button
															type="button" id="<%=i + 1%>"
															onclick="clickBt($(this).val())"
															class="btn btn-danger glyphicon glyphicon-trash "
															value="<%=listbangmaLT.get(i).getMaQuyUoc()%>&chieudai=<%=listbangmaLT.get(i).getChieuDai()%>&tab=lientinh"></button></a></td>
											</tr>
											<%
												}
											%>
										</tbody>
									</table>
								</div>
							</div>
							<!--/.End Menu 3-->

							<!-- /.Menu 4 -->
							<div id="menu4" class="tab-pane fade">
								<div class="box-body no-padding table-responsive">
									<table id="datatable-responsive"
										class="display table table-striped table-bordered table-hover"
										cellspacing="0" width="100%">
										<thead>
											<tr>
												<th>#</th>
												<th>Tên mã</th>
												<th>Mã quy ước</th>
												<th>Chiều dài</th>
												<th>Block 1s</th>
												<th>Block 6s</th>
												<th>Block 10s</th>
												<th>Block 1m</th>
												<th>Tác vụ</th>
											</tr>
										</thead>

										<tbody>
											<%
												ArrayList<BangMa> listbangmaDV = BangMaDao.getListBangMa("E");
													for (int i = 0; i < listbangmaDV.size(); i++) {
											%>
											<tr class="gradeA">
												<td><%=i + 1%></td>
												<td><%=listbangmaDV.get(i).getTen()%></td>
												<td><%=listbangmaDV.get(i).getMaQuyUoc()%></td>
												<td><%=listbangmaDV.get(i).getChieuDai()%></td>
												<td>(FPT): <%=listbangmaDV.get(i).getBlock1sFPT()%> </br>(CMC):
													<%=listbangmaDV.get(i).getBlock1sCMC()%></td>
												<td>(FPT): <%=listbangmaDV.get(i).getBlock6sFPT()%> </br>(CMC):
													<%=listbangmaDV.get(i).getBlock6sCMC()%></td>
												<td>(FPT): <%=listbangmaDV.get(i).getBlock10sFPT()%></br>(CMC):
													<%=listbangmaDV.get(i).getBlock10sCMC()%></td>
												<td>(FPT): <%=listbangmaDV.get(i).getBlock1mFPT()%> </br>(CMC):
													<%=listbangmaDV.get(i).getBlock1mCMC()%>
												</td>
												<td><a
													href="<%=request.getContextPath()%>/ManagerBangMa?command=edit&maquyuoc=<%=listbangmaDV.get(i).getMaQuyUoc()%>&chieudai=<%=listbangmaDV.get(i).getChieuDai()%>&tab=dichvu"><button
															type="button"
															class="btn btn-primary glyphicon glyphicon-edit"></button></a>
													&nbsp;&nbsp; <a href="#" class="linkDelete"><button
															type="button" id="<%=i + 1%>"
															onclick="clickBt($(this).val())"
															class="btn btn-danger glyphicon glyphicon-trash "
															value="<%=listbangmaDV.get(i).getMaQuyUoc()%>&chieudai=<%=listbangmaDV.get(i).getChieuDai()%>&tab=dichvu"></button></a></td>
											</tr>
											<%
												}
											%>
										</tbody>
									</table>
								</div>
							</div>
							<!--/.End Menu 4-->

							<!-- /.Menu 5 -->
							<div id="menu5" class="tab-pane fade">
								<div class="box-body no-padding table-responsive">
									<table id="datatable-responsive"
										class="display table table-striped table-bordered table-hover"
										cellspacing="0" width="100%">
										<thead>
											<tr>
												<th>#</th>
												<th>Tên mã</th>
												<th>Mã quy ước</th>
												<th>Chiều dài</th>
												<th>Block 1s</th>
												<th>Block 6s</th>
												<th>Block 10s</th>
												<th>Block 1m</th>
												<th>Tác vụ</th>
											</tr>
										</thead>

										<tbody>
											<%
												ArrayList<BangMa> listbangmaQT = BangMaDao.getListBangMa("D");
													for (int i = 0; i < listbangmaQT.size(); i++) {
											%>
											<tr class="gradeA">
												<td><%=i + 1%></td>
												<td><%=listbangmaQT.get(i).getTen()%></td>
												<td><%=listbangmaQT.get(i).getMaQuyUoc()%></td>
												<td><%=listbangmaQT.get(i).getChieuDai()%></td>
												<td>(FPT): <%=listbangmaQT.get(i).getBlock1sFPT()%> </br>(CMC):
													<%=listbangmaQT.get(i).getBlock1sCMC()%></td>
												<td>(FPT): <%=listbangmaQT.get(i).getBlock6sFPT()%> </br>(CMC):
													<%=listbangmaQT.get(i).getBlock6sCMC()%></td>
												<td>(FPT): <%=listbangmaQT.get(i).getBlock10sFPT()%></br>(CMC):
													<%=listbangmaQT.get(i).getBlock10sCMC()%></td>
												<td>(FPT): <%=listbangmaQT.get(i).getBlock1mFPT()%> </br>(CMC):
													<%=listbangmaQT.get(i).getBlock1mCMC()%>
												</td>
												<td><a
													href="<%=request.getContextPath()%>/ManagerBangMa?command=edit&maquyuoc=<%=listbangmaQT.get(i).getMaQuyUoc()%>&chieudai=<%=listbangmaQT.get(i).getChieuDai()%>&tab=quocte"><button
															type="button"
															class="btn btn-primary glyphicon glyphicon-edit"></button></a>
													&nbsp;&nbsp; <a href="#" class="linkDelete"><button
															type="button" id="<%=i + 1%>"
															onclick="clickBt($(this).val())"
															class="btn btn-danger glyphicon glyphicon-trash "
															value="<%=listbangmaQT.get(i).getMaQuyUoc()%>&chieudai=<%=listbangmaQT.get(i).getChieuDai()%>&tab=quocte"></button></a></td>
											</tr>
											<%
												}
											%>
										</tbody>
									</table>
								</div>
							</div>
							<!--/.End Menu 5-->

						</div>
						<!-- /.End tab-content -->

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
	<%
		}
	%>
	<script>
		function clickBt(text) {
			if (confirm("Bạn có chắc chắn muốn xóa nội dung này?") == true) {
				$(".linkDelete").attr("href",
						"ManagerBangMa?command=delete&maquyuoc=" + text);
			}
		}
	</script>
</body>
</html>