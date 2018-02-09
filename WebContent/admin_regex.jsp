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
	%>

	<div class="wrapper">

		<!-- Include this in all index page -->
		<jsp:include page="sideBar.jsp"></jsp:include>
		<!-- /.Include this in all index page -->


		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
			<h1>Regular expression</h1>
			<ol class="breadcrumb">
				<li><a href="<%=request.getContextPath()%>/index.jsp"><i
						class="fa fa-dashboard"></i> BillingsSystem</a></li>
				<li><a href="#">Quản trị hệ thống</a></li>
				<li class="active">Regular expression</li>
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
								<a href="admin_regex-add.jsp" class="btn btn-primary btn-block">
									<i class="ion-android-options"></i> Thêm
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
												<th>Block 1s</th>
												<th>Block 6s</th>
												<th>Block 10s</th>
												<th>Block 1m</th>
												<th>Tác vụ</th>
											</tr>
										</thead>

										<tbody>
											<%
												ArrayList<Regex> listRegexNH = RegexDao.getListRegex("regexnoihat");
													for (int i = 0; i < listRegexNH.size(); i++) {
											%>
											<tr class="gradeA">
												<td><%=i + 1%></td>
												<td><%=listRegexNH.get(i).getTen()%></td>
												<td>(FPT): <%=listRegexNH.get(i).getBlock1sFPT()%> </br>(CMC):
													<%=listRegexNH.get(i).getBlock1sCMC()%></td>
												<td>(FPT): <%=listRegexNH.get(i).getBlock6sFPT()%> </br>(CMC):
													<%=listRegexNH.get(i).getBlock6sCMC()%></td>
												<td>(FPT): <%=listRegexNH.get(i).getBlock10sFPT()%></br>(CMC):
													<%=listRegexNH.get(i).getBlock10sCMC()%></td>
												<td>(FPT): <%=listRegexNH.get(i).getBlock1mFPT()%> </br>(CMC):
													<%=listRegexNH.get(i).getBlock1mCMC()%>
												</td>
												<td><a
													href="<%=request.getContextPath()%>/ManagerRegex?command=edit&tenbang=<%="regexnoihat"%>&tenRegex=<%=listRegexNH.get(i).getTen()%>&regexString=<%=listRegexNH.get(i).getRegex()%>&block1sfpt=<%=listRegexNH.get(i).getBlock1sFPT()%>&block1scmc=<%=listRegexNH.get(i).getBlock1sCMC()%>&block6sfpt=<%=listRegexNH.get(i).getBlock6sFPT()%>&block6scmc=<%=listRegexNH.get(i).getBlock6sCMC()%>&block10sfpt=<%=listRegexNH.get(i).getBlock10sFPT()%>&block10scmc=<%=listRegexNH.get(i).getBlock10sCMC()%>&block1mfpt=<%=listRegexNH.get(i).getBlock1mFPT()%>&block1mcmc=<%=listRegexNH.get(i).getBlock1mFPT()%>"><button
															type="button"
															class="btn btn-primary glyphicon glyphicon-edit"></button></a>
													&nbsp;&nbsp; <a
													href="<%=request.getContextPath()%>/ManagerRegex?command=delete&tenRegex=<%=listRegexNH.get(i).getRegex()%>&tenbang=<%="regexnoihat"%>"><button
															class="btn btn-danger glyphicon glyphicon-trash "></button></a></td>
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
												<th>Block 1s</th>
												<th>Block 6s</th>
												<th>Block 10s</th>
												<th>Block 1m</th>
												<th>Tác vụ</th>
											</tr>
										</thead>

										<tbody>
											<%
												ArrayList<Regex> listRegexDD = RegexDao.getListRegex("regexdidong");
													for (int i = 0; i < listRegexDD.size(); i++) {
											%>
											<tr class="gradeA">
												<td><%=i + 1%></td>
												<td><%=listRegexDD.get(i).getTen()%></td>
												<td>(FPT): <%=listRegexDD.get(i).getBlock1sFPT()%> </br>(CMC):
													<%=listRegexDD.get(i).getBlock1sCMC()%></td>
												<td>(FPT): <%=listRegexDD.get(i).getBlock6sFPT()%> </br>(CMC):
													<%=listRegexDD.get(i).getBlock6sCMC()%></td>
												<td>(FPT): <%=listRegexDD.get(i).getBlock10sFPT()%></br>(CMC):
													<%=listRegexDD.get(i).getBlock10sCMC()%></td>
												<td>(FPT): <%=listRegexDD.get(i).getBlock1mFPT()%> </br>(CMC):
													<%=listRegexDD.get(i).getBlock1mCMC()%>
												</td>
												<td><a
													href="<%=request.getContextPath()%>/ManagerRegex?command=edit&tenRegex=<%=listRegexDD.get(i).getTen()%>&tenbang=<%="regexdidong"%>&regexString=<%=listRegexDD.get(i).getRegex()%>&block1sfpt=<%=listRegexDD.get(i).getBlock1sFPT()%>&block1scmc=<%=listRegexDD.get(i).getBlock1sCMC()%>&block6sfpt=<%=listRegexDD.get(i).getBlock6sFPT()%>&block6scmc=<%=listRegexDD.get(i).getBlock6sCMC()%>&block10sfpt=<%=listRegexDD.get(i).getBlock10sFPT()%>&block10scmc=<%=listRegexDD.get(i).getBlock10sCMC()%>&block1mfpt=<%=listRegexDD.get(i).getBlock1mFPT()%>&block1mcmc=<%=listRegexDD.get(i).getBlock1mFPT()%>"><button
															type="button"
															class="btn btn-primary glyphicon glyphicon-edit"></button></a>
													&nbsp;&nbsp; <a
													href="<%=request.getContextPath()%>/ManagerRegex?command=delete&tenRegex=<%=listRegexDD.get(i).getRegex()%>&tenbang=<%="regexdidong"%>"><button
															class="btn btn-danger glyphicon glyphicon-trash "></button></a></td>
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
												<th>Block 1s</th>
												<th>Block 6s</th>
												<th>Block 10s</th>
												<th>Block 1m</th>
												<th>Tác vụ</th>
											</tr>
										</thead>

										<tbody>
											<%
												ArrayList<Regex> listRegexLT = RegexDao.getListRegex("regexlientinh");
													for (int i = 0; i < listRegexLT.size(); i++) {
											%>
											<tr class="gradeA">
												<td><%=i + 1%></td>
												<td><%=listRegexLT.get(i).getTen()%></td>
												<td>(FPT): <%=listRegexLT.get(i).getBlock1sFPT()%> </br>(CMC):
													<%=listRegexLT.get(i).getBlock1sCMC()%></td>
												<td>(FPT): <%=listRegexLT.get(i).getBlock6sFPT()%> </br>(CMC):
													<%=listRegexLT.get(i).getBlock6sCMC()%></td>
												<td>(FPT): <%=listRegexLT.get(i).getBlock10sFPT()%></br>(CMC):
													<%=listRegexLT.get(i).getBlock10sCMC()%></td>
												<td>(FPT): <%=listRegexLT.get(i).getBlock1mFPT()%> </br>(CMC):
													<%=listRegexLT.get(i).getBlock1mCMC()%>
												</td>
												<td><a
													href="<%=request.getContextPath()%>/ManagerRegex?command=edit&tenbang=<%="regexlientinh"%>&tenRegex=<%=listRegexLT.get(i).getTen()%>&regexString=<%=listRegexLT.get(i).getRegex()%>&block1sfpt=<%=listRegexLT.get(i).getBlock1sFPT()%>&block1scmc=<%=listRegexLT.get(i).getBlock1sCMC()%>&block6sfpt=<%=listRegexLT.get(i).getBlock6sFPT()%>&block6scmc=<%=listRegexLT.get(i).getBlock6sCMC()%>&block10sfpt=<%=listRegexLT.get(i).getBlock10sFPT()%>&block10scmc=<%=listRegexLT.get(i).getBlock10sCMC()%>&block1mfpt=<%=listRegexLT.get(i).getBlock1mFPT()%>&block1mcmc=<%=listRegexLT.get(i).getBlock1mFPT()%>"><button
															type="button"
															class="btn btn-primary glyphicon glyphicon-edit"></button></a>
													&nbsp;&nbsp; <a
													href="<%=request.getContextPath()%>/ManagerRegex?command=delete&tenRegex=<%=listRegexLT.get(i).getRegex()%>&tenbang=<%="regexlientinh"%>"><button
															class="btn btn-danger glyphicon glyphicon-trash "></button></a></td>
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
												<th>Block 1s</th>
												<th>Block 6s</th>
												<th>Block 10s</th>
												<th>Block 1m</th>
												<th>Tác vụ</th>
											</tr>
										</thead>

										<tbody>
											<%
												ArrayList<Regex> listRegexDV = RegexDao.getListRegex("regexdichvu");
													for (int i = 0; i < listRegexDV.size(); i++) {
											%>
											<tr class="gradeA">
												<td><%=i + 1%></td>
												<td><%=listRegexDV.get(i).getTen()%></td>
												<td>(FPT): <%=listRegexDV.get(i).getBlock1sFPT()%> </br>(CMC):
													<%=listRegexDV.get(i).getBlock1sCMC()%></td>
												<td>(FPT): <%=listRegexDV.get(i).getBlock6sFPT()%> </br>(CMC):
													<%=listRegexDV.get(i).getBlock6sCMC()%></td>
												<td>(FPT): <%=listRegexDV.get(i).getBlock10sFPT()%></br>(CMC):
													<%=listRegexDV.get(i).getBlock10sCMC()%></td>
												<td>(FPT): <%=listRegexDV.get(i).getBlock1mFPT()%> </br>(CMC):
													<%=listRegexDV.get(i).getBlock1mCMC()%>
												</td>
												<td><a
													href="<%=request.getContextPath()%>/ManagerRegex?command=edit&tenRegex=<%=listRegexDV.get(i).getTen()%>&tenbang=<%="regexdichvu"%>&regexString=<%=listRegexDV.get(i).getRegex()%>&block1sfpt=<%=listRegexDV.get(i).getBlock1sFPT()%>&block1scmc=<%=listRegexDV.get(i).getBlock1sCMC()%>&block6sfpt=<%=listRegexDV.get(i).getBlock6sFPT()%>&block6scmc=<%=listRegexDV.get(i).getBlock6sCMC()%>&block10sfpt=<%=listRegexDV.get(i).getBlock10sFPT()%>&block10scmc=<%=listRegexDV.get(i).getBlock10sCMC()%>&block1mfpt=<%=listRegexDV.get(i).getBlock1mFPT()%>&block1mcmc=<%=listRegexDV.get(i).getBlock1mFPT()%>"><button
															type="button"
															class="btn btn-primary glyphicon glyphicon-edit"></button></a>
													&nbsp;&nbsp; <a
													href="<%=request.getContextPath()%>/ManagerRegex?command=delete&tenRegex=<%=listRegexDV.get(i).getRegex()%>&tenbang=<%="regexdichvu"%>"><button
															class="btn btn-danger glyphicon glyphicon-trash "></button></a></td>
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
												<th>Block 1s</th>
												<th>Block 6s</th>
												<th>Block 10s</th>
												<th>Block 1m</th>
												<th>Tác vụ</th>
											</tr>
										</thead>

										<tbody>
											<%
												ArrayList<Regex> listRegexQT = RegexDao.getListRegex("regexquocte");
													for (int i = 0; i < listRegexQT.size(); i++) {
											%>
											<tr class="gradeA">
												<td><%=i + 1%></td>
												<td><%=listRegexQT.get(i).getTen()%></td>
												<td>(FPT): <%=listRegexQT.get(i).getBlock1sFPT()%> </br>(CMC):
													<%=listRegexQT.get(i).getBlock1sCMC()%></td>
												<td>(FPT): <%=listRegexQT.get(i).getBlock6sFPT()%> </br>(CMC):
													<%=listRegexQT.get(i).getBlock6sCMC()%></td>
												<td>(FPT): <%=listRegexQT.get(i).getBlock10sFPT()%></br>(CMC):
													<%=listRegexQT.get(i).getBlock10sCMC()%></td>
												<td>(FPT): <%=listRegexQT.get(i).getBlock1mFPT()%> </br>(CMC):
													<%=listRegexQT.get(i).getBlock1mCMC()%>
												</td>
												<td><a
													href="<%=request.getContextPath()%>/ManagerRegex?command=edit&tenRegex=<%=listRegexQT.get(i).getTen()%>&tenbang=<%="regexquocte"%>&regexString=<%=listRegexQT.get(i).getRegex()%>&block1sfpt=<%=listRegexQT.get(i).getBlock1sFPT()%>&block1scmc=<%=listRegexQT.get(i).getBlock1sCMC()%>&block6sfpt=<%=listRegexQT.get(i).getBlock6sFPT()%>&block6scmc=<%=listRegexQT.get(i).getBlock6sCMC()%>&block10sfpt=<%=listRegexQT.get(i).getBlock10sFPT()%>&block10scmc=<%=listRegexQT.get(i).getBlock10sCMC()%>&block1mfpt=<%=listRegexQT.get(i).getBlock1mFPT()%>&block1mcmc=<%=listRegexQT.get(i).getBlock1mFPT()%>"><button
															type="button"
															class="btn btn-primary glyphicon glyphicon-edit"></button></a>
													&nbsp;&nbsp; <a
													href="<%=request.getContextPath()%>/ManagerRegex?command=delete&tenRegex=<%=listRegexQT.get(i).getRegex()%>&tenbang=<%="regexquocte"%>"><button
															class="btn btn-danger glyphicon glyphicon-trash "></button></a></td>
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
						"ManagerRegex?command=delete&maquyuoc=" + text);
			}
		}
	</script>
</body>
</html>