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
<title>Billings</title>
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
			<h1>Billings</h1>
			<ol class="breadcrumb">
				<li><a href="index.jsp"><i class="fa fa-dashboard"></i>
						BillingsSystem</a></li>
				<li class="active">Billings</li>
			</ol>
			</section>

			<!-- Main content -->
			<section class="content">
			<div class="row">

				<!-- UPLOAD FILE -->
				<div class="col-sm-8">
					<div class="box box-primary">
						<div class="box-header with-border">
							<h3 class="box-title">
								<i class="glyphicon glyphicon-upload"></i> UploadFile
							</h3>
						</div>
						<form action="ManagerUploadFile" method="post"
							class="form-horizontal" enctype="multipart/form-data">
							<div class="box-body">
								<div class="row">
									<div class="col-sm-9 pull-left">
										<input type="file" name="inputFileExcel"
											class="custom-file-input">
									</div>
									<div class="col-sm-3 pull-right">
										<button class="btn btn-primary btn-md">
											<i class="glyphicon glyphicon-upload"><span>
													UploadFile</span></i>
										</button>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
				<!--  -->

				<!--PRINT  -->
				<div class="col-sm-3  pull-right">
					<div class="box box-primary">
						<div class="box-header with-border">
							<h3 class="box-title">
								<i class="glyphicon glyphicon-print"></i> Print
							</h3>
						</div>
						<form action="#" class="form-horizontal">
							<div class="box-body">
								<div class="btn-group">
									<a href="#" class="btn btn-default"><i
										class="fa fa-file-pdf-o"></i> .PDF</a> <a href="#"
										class="btn btn-default"><i class="fa fa-file-word-o"></i>
										.CSV</a>
								</div>
							</div>
						</form>
					</div>
				</div>
				<!--  -->

				<!-- TABLES -->
				<div class="col-md-12">
					<div class="box box-primary">
						<div class="box-body no-padding">
							<ul class="nav nav-tabs">
								<li class="active"><a data-toggle="tab" href="#home">Chi
										tiết cước</a></li>
								<li><a data-toggle="tab" href="#menu2">Tổng cước công
										ty</a></li>
								<li><a data-toggle="tab" href="#menu3">Cước nhà mạng
										FPT</a></li>
								<li><a data-toggle="tab" href="#menu4">Cước nhà mạng
										CMC</a></li>
							</ul>

							<!-- /.Start tab-content -->
							<div class="tab-content">

								<!-- /.Home -->
								<div id="home" class="tab-pane fade in active">
									<div class="box-body no-padding">
										<table id="datatable-responsive"
											class="display table table-striped table-bordered dt-responsive"
											cellspacing="0" width="100%">
											<thead>
												<tr>
													<th>#</th>
													<th>Dịch vụ/Service</th>
													<th>Cước/Cost</th>
												</tr>
											</thead>

											<tbody>
												<!-- Bang tinh gia cuoc dien thoai -->
												<%
													// tinh cho cong ty
														double noihat = BillingDao.tinhtongtienall("A");
														double tiennoihat = (double) Math.round(noihat * 100) / 100;

														double lientinh = BillingDao.tinhtongtienall("C");
														double tienlientinh = (double) Math.round(lientinh * 100) / 100;

														double didong = BillingDao.tinhtongtienall("B");
														double tiendidong = (double) Math.round(didong * 100) / 100;

														double quocte = BillingDao.tinhtongtienall("D");
														double tienquocte = (double) Math.round(quocte * 100) / 100;

														double dichvu = BillingDao.tinhtongtienall("E");
														double tiendichvu = (double) Math.round(dichvu * 100) / 100;

														double tongcuocp = tiennoihat + tienlientinh + tiendidong + tienquocte + tiendichvu;
														double tongcuoc7 = (double) Math.round(tongcuocp * 100) / 100;
												%>
												<tr class="gradeA">
													<td><%=1%></td>
													<td>Cước nội hạt / Local Cost</td>
													<td><%=tiennoihat%></td>
												</tr>
												<tr class="gradeA">
													<td><%=2%></td>
													<td>Cước liên tỉnh /Province Cost</td>
													<td><%=tienlientinh%></td>
												</tr>
												<tr class="gradeA">
													<td><%=3%></td>
													<td>Cước di động / Mobile Cost</td>
													<td><%=tiendidong%></td>
												</tr>
												<tr class="gradeA">
													<td><%=4%></td>
													<td>Cước quốc tế / International Cost</td>
													<td><%=tienquocte%></td>
												</tr>
												<tr class="gradeA">
													<td><%=5%></td>
													<td>Cước dịch vụ đặc biệt / Special Service Cost</td>
													<td><%=tiendichvu%></td>
												</tr>
												<tr class="gradeA">
													<td><%=6%></td>
													<td>Tổng cộng cước sử dụng / Total Dialling Cost
														(1+2+3+4+5)</td>
													<td><%=tongcuoc7%></td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
								<!--/.End Home-->

								<!--/.Menu 2-->
								<div id="menu2" class="tab-pane fade">
									<div class="box-body no-padding">
										<table id="datatable-responsive"
											class="display table table-striped table-bordered dt-responsive"
											cellspacing="0" width="100%">
											<thead>
												<tr>
													<th>#</th>
													<th>Công ty</th>
													<th>Cước/Cost</th>
													<th></th>
												</tr>
											</thead>
											<tbody>
												<!-- Bang tinh gia cuoc dien thoai -->
												<%
													// tinh cho cong ty
														ArrayList<CongTy> listCongTy = CongTyDao.getListCongTy();
														for (int i = 0; i < listCongTy.size(); i++) {
												%>
												<tr class="gradeA">
													<td><%=i + 1%></td>
													<td><%=listCongTy.get(i).getTenCongTy()%></td>
													<td><%=BillingDao.totalct(listCongTy.get(i).getCongTyID(), 0)%></td>
													<td><a
														href="<%=request.getContextPath()%>/ManagerBilling?command=detail&congtyid=<%=listCongTy.get(i).getCongTyID()%>&tencongty=<%=listCongTy.get(i).getTenCongTy()%>"><button
																class="btn btn-primary" type="button">Chi tiết
																billing</button></a>
												</tr>
												<%
													}
												%>
												<tr class="gradeA">
													<td><%=listCongTy.size()%></td>
													<td>Tổng tiền</td>
													<td><%=BillingDao.total(0)%></td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
								<!--/.End Menu 2-->

								<!--/.Menu 3-->
								<div id="menu3" class="tab-pane fade">
									<div class="box-body no-padding">
										<table id="datatable-responsive"
											class="display table table-striped table-bordered dt-responsive"
											cellspacing="0" width="100%">
											<thead>
												<tr>
													<th>#</th>
													<th>Đầu số</th>
													<th>Extension</th>
													<th>Ghi chú</th>
													<th>CP thuê bao/tháng</th>
													<th>Cước gốc</th>
													<th>Cước tham khảo (chưa VAT)</th>
												</tr>
											</thead>

											<tbody>
												<!-- Bang tinh gia cuoc dien thoai -->
												<%
													// tinh cho cong ty
														ArrayList<DauSo> listdauso = DauSoDao.getListDauSoNhaMang("FPT");
														for (int i = 0; i < listdauso.size(); i++) {
												%>
												<tr class="gradeA">
													<td><%=i + 1%></td>
													<td><%=listdauso.get(i).getDauSoSuDung()%></td>
													<td>
														<%
															ArrayList<Extension> listextension = ExtensionDao.getListEXDauSo(listdauso.get(i).getDauSoSuDung());
																	for (int j = 0; j < listextension.size(); j++) {
														%> <%=listextension.get(j).getExtensionID()%><br> <%
 	}
 %>
													</td>
													<td>-</td>
													<td>20000.00</td>
													<td><%=BillingDao.tongcuocdausonm(listdauso.get(i).getDauSoSuDung(), "FPT", 0)%></td>
													<td><%=20000 + BillingDao.tongcuocdausonm(listdauso.get(i).getDauSoSuDung(), "FPT", 0)%></td>
												</tr>

												<%
													}
												%>
												<tr class="gradeA">
													<td><%=listCongTy.size()%></td>
													<td>-</td>
													<td>-</td>
													<td>-</td>
													<td>-</td>
													<td>Tổng tiền</td>
													<td><%=BillingDao.tongcuocnhamang("FPT", 0)%></td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
								<!--/.End Menu 3-->

								<!--/.Menu 4-->
								<div id="menu4" class="tab-pane fade">
									<div class="box-body no-padding">
										<table id="datatable-responsive"
											class="display table table-striped table-bordered dt-responsive"
											cellspacing="0" width="100%">
											<thead>
												<tr>
													<th>#</th>
													<th>Đầu số</th>
													<th>Extension</th>
													<th>Ghi chú</th>
													<th>CP thuê bao/tháng</th>
													<th>Cước gốc</th>
													<th>Cước tham khảo (chưa VAT)</th>
												</tr>
											</thead>

											<tbody>
												<!-- Bang tinh gia cuoc dien thoai -->
												<%
													// tinh cho cong ty
														ArrayList<DauSo> listdausocmc = DauSoDao.getListDauSoNhaMang("CMC");
														for (int i = 0; i < listdausocmc.size(); i++) {
												%>
												<tr class="gradeA">
													<td><%=i + 1%></td>
													<td><%=listdausocmc.get(i).getDauSoSuDung()%></td>
													<td>
														<%
															ArrayList<Extension> listextension = ExtensionDao
																			.getListEXDauSo(listdausocmc.get(i).getDauSoSuDung());
																	for (int j = 0; j < listextension.size(); j++) {
														%> <%=listextension.get(j).getExtensionID()%><br> <%
 	}
 %>
													</td>
													<td>-</td>
													<td>20000.00</td>
													<td><%=BillingDao.tongcuocdausonm(listdausocmc.get(i).getDauSoSuDung(), "CMC", 0)%></td>
													<td><%=20000 + BillingDao.tongcuocdausonm(listdausocmc.get(i).getDauSoSuDung(), "CMC", 0)%></td>
												</tr>

												<%
													}
												%>
												<tr class="gradeA">
													<td><%=listCongTy.size()%></td>
													<td>-</td>
													<td>-</td>
													<td>-</td>
													<td>-</td>
													<td>Tổng tiền</td>
													<td><%=BillingDao.tongcuocnhamang("CMC", 0)%></td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
								<!-- /.End Menu 4-->

							</div>
							<!-- /.End tab-content -->

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