<%@page import="java.awt.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="model.*"%>
<%@page import="Dao.*"%>
<%@page import="java.text.DecimalFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js">
</script>
<![endif]-->
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
			<%
				// dinh dang tien tệ
					DecimalFormat formatter = new DecimalFormat("###,###,###.##");

					String idextension = (String) request.getAttribute("extensionid");
					String idphongban = (String) request.getAttribute("phongbanid");
					String idcongty = (String) request.getAttribute("congtyid");
					double tilemakeup = CongTyDao.getTiLeMakeUp(idcongty);
					String tencongty = (String) request.getAttribute("tencongty");
					String yeucau = (String) request.getAttribute("yeucau");
					ArrayList<PhongBan> listPhongBan = PhongBanDao.getListPBCongTy(idcongty);
					ArrayList<Extension> listExtensions = ExtensionDao.getListEXCongTy(idcongty);
					ArrayList<LogCall> listBilling = BillingDao.getListLogCall_CT(idcongty);
					String yeucauthang = (String) request.getAttribute("yeucauthang");
					// filter theo thang
					String thangnam = "";
					if (yeucauthang == "thangnam") {
						String thang = (String) request.getAttribute("thangnam");
						thangnam = thang;
					} else {
						thangnam = "12";
					}
			%>
			<section class="content-header">
			<h1>
				Billings
				<%=tencongty%>
				tháng
				<%=thangnam%></h1>
			<%
				if (yeucau == "phongban") {
			%>
			<h1>
				(<%=PhongBanDao.getTenPhongBan(idphongban)%>)
			</h1>
			<%
				}
			%> <%
 	if (yeucau == "extension") {
 %>
			<h1>
				Extension (<%=idextension%>)
			</h1>
			<%
				}
			%>
			<ol class="breadcrumb">
				<li><a href="<%=request.getContextPath()%>/index.jsp"><i
						class="fa fa-dashboard"></i> BillingsSystem</a></li>
				<li class="active">Billings</li>
			</ol>
			</section>

			<!-- Main content -->
			<section class="content">
			<div class="row">
				<div class="col-sm-3">
					<div class="box box-primary">
						<div class="box-header with-border">
							<h3 class="box-title">
								<i class="glyphicon glyphicon-filter"></i> Filter phòng ban
							</h3>
						</div>

						<form action="<%=request.getContextPath()%>/ManagerBilling"
							class="form-horizontal">
							<div class="box-body">
								<div class="row">
									<div class="col-sm-8">
										<select class="form-control" name="phongban">
											<option disabled selected>Phòng/Ban</option>
											<!-- LẤY DANH SÁCH GROUP TỪ DATABASE -->
											<%
												for (int i = 0; i < listPhongBan.size(); i++) {
											%>
											<option value="<%=listPhongBan.get(i).getPhongBanID()%>"><%=listPhongBan.get(i).getTenPhongBan()%></option>
											<%
												}
											%>
										</select>
									</div>
									<div class="col-sm-3">
										<input type="hidden" name="congtyid" value="<%=idcongty%>"></input>
										<input type="hidden" name="tencongty" value="<%=tencongty%>"></input>
										<input type="hidden" name="command" value="filter_phongban"></input>
										<input type="hidden" name="thangnam" value=<%=thangnam%>></input>
										<button type="submit"
											class="btn btn-primary glyphicon glyphicon-search">
										</button>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
				<!--  -->

				<div class="col-sm-3">
					<div class="box box-primary">
						<div class="box-header with-border">
							<h3 class="box-title">
								<i class="glyphicon glyphicon-filter"></i> Filter extension
							</h3>
						</div>

						<form action="<%=request.getContextPath()%>/ManagerBilling"
							class="form-horizontal">
							<div class="box-body">
								<div class="row">
									<div class="col-sm-8">
										<select class="form-control" name="extension">
											<option disabled selected>Extension</option>

											<!-- LẤY DANH SÁCH EXT TỪ DATABASE -->
											<%
												for (int i = 0; i < listExtensions.size(); i++) {
											%>
											<option value="<%=listExtensions.get(i).getExtensionID()%>"><%=listExtensions.get(i).getExtensionID()%></option>
											<%
												}
											%>
										</select>
									</div>
									<div class="col-sm-3">
										<input type="hidden" name="congtyid" value="<%=idcongty%>"></input>
										<input type="hidden" name="tencongty" value="<%=tencongty%>"></input>
										<input type="hidden" name="command" value="filter_extension"></input>
										<input type="hidden" name="thangnam" value=<%=thangnam%>></input>
										<button type="submit"
											class="btn btn-primary glyphicon glyphicon-search">
										</button>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>

				<!--  -->
				<div class="col-sm-3">
					<div class="box box-primary">
						<div class="box-header with-border">
							<h3 class="box-title">
								<i class="glyphicon glyphicon-filter"></i> Tháng
							</h3>
						</div>

						<form action="<%=request.getContextPath()%>/ManagerBilling"
							class="form-horizontal">
							<div class="box-body">
								<div class="row">
									<div class="col-sm-8">
										<select class="form-control" name="thangnam">
											<%
												for (int i = 0; i < BillingDao.getListThang().length; i++) {
														if (BillingDao.getListThang()[i] != null) {
											%>
											<option value=<%=BillingDao.getListThang()[i]%>>Tháng
												<%=BillingDao.getListThang()[i]%>
											</option>
											<%
												}
													}
											%>

											<!-- LẤY DANH SÁCH GROUP TỪ DATABASE -->

										</select>
									</div>
									<div class="col-sm-3">
										<input type="hidden" name="congtyid" value="<%=idcongty%>"></input>
										<input type="hidden" name="tencongty" value="<%=tencongty%>"></input>
										<input type="hidden" name="yc" value="<%=yeucau%>"></input> <input
											type="hidden" name="command" value="filter_thangnam"></input>
										<button type="submit"
											class="btn btn-primary glyphicon glyphicon-search">
										</button>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>

				<!-- Export File -->
				<div class="col-sm-3">
					<div class="box box-primary">
						<div class="box-header with-border">
							<h3 class="box-title">
								<i class="glyphicon glyphicon-export"></i> Export
							</h3>
						</div>
						<div class="box-body">
							<!-- /btn-group -->
							<div class="btn-group">
								<div class="btn-group dropdown">
									<button type="button" class="btn btn-primary dropdown-toggle"
										data-toggle="dropdown">
										<i class="fa fa-file-excel-o"></i> Excel <span class="caret"></span>
									</button>
									<ul class="dropdown-menu">
										<li><a
											href="<%=request.getContextPath()%>/ManagerBilling?command=exportPDF&congtyid=<%=idcongty%>&tencongty=<%=tencongty%>&thangnam=<%=thangnam%>">Sumary</a></li>
										<li><a
											href="<%=request.getContextPath()%>/ManagerBilling?command=exportPDFdetail&congtyid=<%=idcongty%>&tencongty=<%=tencongty%>&thangnam=<%=thangnam%>">Detail</a></li>
									</ul>
								</div>

								<div class="btn-group dropdown">
									<button type="button" class="btn btn-primary dropdown-toggle"
										data-toggle="dropdown">
										<i class="fa fa-file-word-o"></i> Word <span class="caret"></span>
									</button>
									<ul class="dropdown-menu">
										<li><a href="#">Sumary</a></li>
										<li><a href="#">Detail</a></li>
									</ul>
								</div>
							</div>
							<!-- /.btn-group -->
						</div>
					</div>
				</div>
				<!--  -->

				<div class="col-md-12">
					<div class="box box-primary">
						<div class="box-header">
							<%
								if (yeucau != "tongbill") {
							%>
							<form action="<%=request.getContextPath()%>/ManagerBilling"
								class="form-horizontal">
								<input type="hidden" name="congtyid" value="<%=idcongty%>"></input>
								<input type="hidden" name="tencongty" value="<%=tencongty%>"></input>
								<input type="hidden" name="command" value="detail"></input>
								<button type="submit" class="btn btn-primary">
									<i class="glyphicon glyphicon-list"> Tổng</i>
								</button>
							</form>
							<%
								}
							%>
						</div>
						<!-- /.box-header -->

						<ul class="nav nav-tabs">
							<li class="active"><a data-toggle="tab" href="#home">Chi
									tiết</a></li>
							<%
								if (yeucau == "tongbill") {
							%>
							<li><a data-toggle="tab" href="#menu2">Bảng cước thoại</a></li>
							<%
								}
							%>
							<li><a data-toggle="tab" href="#menu3">Nội hạt</a></li>
							<li><a data-toggle="tab" href="#menu4">Di động</a></li>
							<li><a data-toggle="tab" href="#menu5">Liên tỉnh</a></li>
							<li><a data-toggle="tab" href="#menu6">Quốc tế</a></li>
							<li><a data-toggle="tab" href="#menu7">Dịch vụ</a></li>
						</ul>

						<div class="tab-content">
							<!-- Menu 01 -->
							<div id="home" class="tab-pane fade in active">
								<div class="box-body no-padding">
									<table id="datatable-responsive"
										class="display table table-striped table-bordered dt-responsive"
										cellspacing="0" width="100%">
										<thead>
											<tr>
												<th>#</th>
												<th>Dịch vụ/Service</th>
												<th>Cước/Cost (VNĐ)</th>
											</tr>
										</thead>
										<tbody>
											<!-- Bang tinh gia cuoc dien thoai -->
											<%
												// tinh cho cong ty
													double noihat = BillingDao.tinhtongtien("A", idcongty, thangnam);
													double tiennoihat = (double) Math.round(noihat * 100) / 100;
													double tiennoihatma = (double) Math.round((tiennoihat * (1 + tilemakeup)) * 100) / 100;
													double lientinh = BillingDao.tinhtongtien("C", idcongty, thangnam);
													double tienlientinh = (double) Math.round(lientinh * 100) / 100;
													double tienlientinhma = (double) Math.round((tienlientinh * (1 + tilemakeup)) * 100) / 100;
													double didong = BillingDao.tinhtongtien("B", idcongty, thangnam);
													double tiendidong = (double) Math.round(didong * 100) / 100;
													double tiendidongma = (double) Math.round((tiendidong * (1 + tilemakeup)) * 100) / 100;
													double quocte = BillingDao.tinhtongtien("D", idcongty, thangnam);
													double tienquocte = (double) Math.round(quocte * 100) / 100;
													double tienquoctema = (double) Math.round((tienquocte * (1 + tilemakeup)) * 100) / 100;
													double dichvu = BillingDao.tinhtongtien("E", idcongty, thangnam);
													double tiendichvu = (double) Math.round(dichvu * 100) / 100;
													double tiendichvuma = (double) Math.round((tiendichvu * (1 + tilemakeup)) * 100) / 100;
													double tongcuocp = 20000 + tiennoihatma + tienlientinhma + tiendidongma + tienquoctema + tiendichvuma;
													double tongcuoc7 = (double) Math.round(tongcuocp * 100) / 100;
													double phiphucvu8 = (double) Math.round((tongcuoc7 * 5 / 100) * 100) / 100;
													;
													double tongcongcuoc9 = (double) Math.round((tongcuoc7 + phiphucvu8) * 100) / 100;
													double thueVAT = (double) Math.round((tongcongcuoc9 * 10 / 100) * 100) / 100;
													double tongthanhtoan = (double) Math.round((tongcongcuoc9 + thueVAT) * 100) / 100;
													// tinh cho phong ban
													double noihatpb = BillingDao.tinhtongtienpb("A", idphongban, thangnam);
													double tiennoihatpb = (double) Math.round(noihatpb * 100) / 100;
													double tiennoihatmapb = (double) Math.round((tiennoihatpb * (1 + tilemakeup)) * 100) / 100;
													double didongpb = BillingDao.tinhtongtienpb("B", idphongban, thangnam);
													double tiendidongpb = (double) Math.round(didongpb * 100) / 100;
													double tiendidongmapb = (double) Math.round((tiendidongpb * (1 + tilemakeup)) * 100) / 100;
													double lientinhpb = BillingDao.tinhtongtienpb("C", idphongban, thangnam);
													double tienlientinhpb = (double) Math.round(lientinhpb * 100) / 100;
													double tienlientinhmapb = (double) Math.round((tienlientinhpb * (1 + tilemakeup)) * 100) / 100;
													double quoctepb = BillingDao.tinhtongtienpb("D", idphongban, thangnam);
													double tienquoctepb = (double) Math.round(quoctepb * 100) / 100;
													double tienquoctemapb = (double) Math.round((tienquoctepb * (1 + tilemakeup)) * 100) / 100;
													double dichvupb = BillingDao.tinhtongtienpb("E", idphongban, thangnam);
													double tiendichvupb = (double) Math.round(dichvupb * 100) / 100;
													double tiendichvumapb = (double) Math.round((tiendichvupb * (1 + tilemakeup)) * 100) / 100;
													double tongcuocpb = tiennoihatmapb + tienlientinhmapb + tiendidongmapb + tienquoctemapb
															+ tiendichvumapb;
													double tongcuoc7pb = (double) Math.round(tongcuocpb * 100) / 100;
													// tinh cho phong ban
													double noihatex = BillingDao.tinhtongtienex("A", idextension, thangnam);
													double tiennoihatex = (double) Math.round(noihatex * 100) / 100;
													double tiennoihatmaex = (double) Math.round((tiennoihatex * (1 + tilemakeup)) * 100) / 100;
													double didongex = BillingDao.tinhtongtienex("B", idextension, thangnam);
													double tiendidongex = (double) Math.round(didongex * 100) / 100;
													double tiendidongmaex = (double) Math.round((tiendidongex * (1 + tilemakeup)) * 100) / 100;
													double lientinhex = BillingDao.tinhtongtienex("C", idextension, thangnam);
													double tienlientinhex = (double) Math.round(lientinhex * 100) / 100;
													double tienlientinhmaex = (double) Math.round((tienlientinhex * (1 + tilemakeup)) * 100) / 100;
													double quocteex = BillingDao.tinhtongtienex("D", idextension, thangnam);
													double tienquocteex = (double) Math.round(quocteex * 100) / 100;
													double tienquoctemaex = (double) Math.round((tienquocteex * (1 + tilemakeup)) * 100) / 100;
													double dichvuex = BillingDao.tinhtongtienex("E", idextension, thangnam);
													double tiendichvuex = (double) Math.round(dichvuex * 100) / 100;
													double tiendichvumaex = (double) Math.round((tiendichvuex * (1 + tilemakeup)) * 100) / 100;
													double tongcuocex = tiennoihatmaex + tienlientinhmaex + tiendidongmaex + tienquoctemaex
															+ tiendichvumaex;
													double tongcuoc7ex = (double) Math.round(tongcuocex * 100) / 100;
											%>
											<!-- Bang tinh gia cuoc TONG BILL CONG TY -->
											<%
												if (yeucau == "tongbill") {
											%>
											<tr class="gradeA">
												<td><%=1%></td>
												<td>Cước thuê bao tháng / Monthly Cost</td>
												<td><%=formatter.format(20000.00)%></td>
											</tr>
											<tr class="gradeA">
												<td><%=2%></td>
												<td>Cước nội hạt / Local Cost</td>
												<td><%=formatter.format(tiennoihatma)%></td>
											</tr>
											<tr class="gradeA">
												<td><%=3%></td>
												<td>Cước liên tỉnh /Province Cost</td>
												<td><%=formatter.format(tienlientinhma)%></td>
											</tr>
											<tr class="gradeA">
												<td><%=4%></td>
												<td>Cước di động / Mobile Cost</td>
												<td><%=formatter.format(tiendidongma)%></td>
											</tr>
											<tr class="gradeA">
												<td><%=5%></td>
												<td>Cước quốc tế / International Cost</td>
												<td><%=formatter.format(tienquoctema)%></td>
											</tr>
											<tr class="gradeA">
												<td><%=6%></td>
												<td>Cước dịch vụ đặc biệt / Special Service Cost</td>
												<td><%=formatter.format(tiendichvuma)%></td>
											</tr>
											<tr class="gradeA">
												<td><%=7%></td>
												<td>Tổng cộng cước sử dụng / Total Dialling Cost
													(1+2+3+4+5+6)</td>
												<td><%=formatter.format(tongcuoc7)%></td>
											</tr>
											<tr class="gradeA">
												<td><%=8%></td>
												<td>Phí phục vụ / Service Fee(5%)</td>
												<td><%=formatter.format(phiphucvu8)%></td>
											</tr>
											<tr class="gradeA">
												<td><%=9%></td>
												<td>Tổng cộng cước phí chưa bao gồm thuế / Total Cost
													exclude Tax (7+8)</td>
												<td><%=formatter.format(tongcongcuoc9)%></td>
											</tr>
											<tr class="gradeA">
												<td><%=10%></td>
												<td>Thuế VAT / Tax (10%)</td>
												<td><%=formatter.format(thueVAT)%></td>
											</tr>
											<tr class="gradeA">
												<td><%=11%></td>
												<td>Tổng cộng tiền thanh toán / Total Payment (9+10)</td>
												<td><%=formatter.format(tongthanhtoan)%></td>
											</tr>
											<%
												}
											%>

											<!-- Bang tinh gia cuoc PHONG BAN -->
											<%
												if (yeucau == "phongban") {
														ArrayList<LogCall> listexten_pb = BillingDao.getListLogCall_PB(idphongban);
											%>
											<tr class="gradeA">
												<td><%=1%></td>
												<td>Cước nội hạt / Local Cost</td>
												<td><%=formatter.format(tiennoihatmapb)%></td>
											</tr>
											<tr class="gradeA">
												<td><%=2%></td>
												<td>Cước liên tỉnh /Province Cost</td>
												<td><%=formatter.format(tienlientinhmapb)%></td>
											</tr>
											<tr class="gradeA">
												<td><%=3%></td>
												<td>Cước di động / Mobile Cost</td>
												<td><%=formatter.format(tiendidongmapb)%></td>
											</tr>
											<tr class="gradeA">
												<td><%=4%></td>
												<td>Cước quốc tế / International Cost</td>
												<td><%=formatter.format(tienquoctemapb)%></td>
											</tr>
											<tr class="gradeA">
												<td><%=5%></td>
												<td>Cước dịch vụ đặc biệt / Special Service Cost</td>
												<td><%=formatter.format(tiendichvumapb)%></td>
											</tr>
											<tr class="gradeA">
												<td><%=6%></td>
												<td>Tổng cộng cước sử dụng / Total Dialling Cost
													(1+2+3+4+5)</td>
												<td><%=formatter.format(tongcuoc7pb)%></td>
											</tr>
											<%
												}
											%>

											<!-- Bang tinh gia cuoc EXTENSION -->
											<%
												if (yeucau == "extension") {
														ArrayList<LogCall> listlogcall_ex = BillingDao.getListLogCall_EX(idextension);
											%>
											<tr class="gradeA">
												<td><%=1%></td>
												<td>Cước nội hạt / Local Cost</td>
												<td><%=formatter.format(tiennoihatmaex)%></td>
											</tr>
											<tr class="gradeA">
												<td><%=2%></td>
												<td>Cước liên tỉnh /Province Cost</td>
												<td><%=formatter.format(tienlientinhmaex)%></td>
											</tr>
											<tr class="gradeA">
												<td><%=3%></td>
												<td>Cước di động / Mobile Cost</td>
												<td><%=formatter.format(tiendidongmaex)%></td>
											</tr>
											<tr class="gradeA">
												<td><%=4%></td>
												<td>Cước quốc tế / International Cost</td>
												<td><%=formatter.format(tienquoctemaex)%></td>
											</tr>
											<tr class="gradeA">
												<td><%=5%></td>
												<td>Cước dịch vụ đặc biệt / Special Service Cost</td>
												<td><%=formatter.format(tiendichvumaex)%></td>
											</tr>
											<tr class="gradeA">
												<td><%=6%></td>
												<td>Tổng cộng cước sử dụng / Total Dialling Cost
													(1+2+3+4+5)</td>
												<td><%=formatter.format(tongcuoc7ex)%></td>
											</tr>
											<%
												}
											%>
										</tbody>

									</table>
								</div>
							</div>
							<!--end Menu 01 -->

							<!-- Menu 02 -->
							<div id="menu2" class="tab-pane fade">
								<div id="home" class="tab-pane fade in active">
									<div class="box-body no-padding">
										<table id="datatable-responsive"
											class="display table table-striped table-bordered dt-responsive"
											cellspacing="0" width="100%">
											<thead>
												<tr>
													<th>#</th>
													<th></th>
													<th>Tỉ lệ makeup (%)</th>
													<th>Cước Quốc Tế (Chưa VAT)</th>
													<th>Cước Liên tỉnh (Chưa VAT)</th>
													<th>Cước di động (Chưa VAT)</th>
													<th>Cước Dịch vụ (Chưa VAT)</th>
													<th>Cước Nội hạt (Chưa VAT)</th>
													<th>TỔNG CƯỚC GỐC (Chưa VAT) (VNĐ)</th>
												</tr>
											</thead>
											<tbody>
												<!-- Bang tinh gia cuoc dien thoai -->
												<%
													double tongcuocchuavat1 = tiennoihat + tienlientinh + tiendidong + tienquocte + tiendichvu;
														double tongcuocchuavat = (double) Math.round((tongcuocchuavat1) * 100) / 100;
														double tongcuocmakeup = (double) Math.round((tongcuocchuavat + tongcuocchuavat * tilemakeup) * 100)
																/ 100;
														double thanhtien = tongcuocmakeup + 20000;
														double VAT = (double) Math.round((thanhtien * 10 / 100) * 100) / 100;
														double tongcuoc = (double) Math.round((thanhtien + VAT) * 100) / 100;
												%>
												<!-- Bang tinh gia cuoc TONG CONG TY -->
												<%
													if (yeucau == "tongbill") {
												%>
												<tr class="gradeA">
													<td><%=1%></td>
													<td>Cước ban đầu</td>
													<td></td>
													<td><%=formatter.format(tienquocte)%></td>
													<td><%=formatter.format(tienlientinh)%></td>
													<td><%=formatter.format(tiendidong)%></td>
													<td><%=formatter.format(tiendichvu)%></td>
													<td><%=formatter.format(tiennoihat)%></td>
													<td><%=formatter.format(tongcuocchuavat)%></td>
												</tr>
												<tr class="gradeA">
													<td><%=2%></td>
													<td>Cước ban theo tỉ lệ makeup</td>
													<td><%=tilemakeup * 100%></td>
													<td><%=formatter.format(tienquoctema)%></td>
													<td><%=formatter.format(tienlientinhma)%></td>
													<td><%=formatter.format(tiendidongma)%></td>
													<td><%=formatter.format(tiendichvuma)%></td>
													<td><%=formatter.format(tiennoihatma)%></td>
													<td><%=formatter.format(tongcuocmakeup)%></td>
												</tr>
												<tr class="gradeA">
													<td><%=3%></td>
													<td>Cước thuê bao tháng</td>
													<td>-</td>
													<td>-</td>
													<td>-</td>
													<td>-</td>
													<td>-</td>
													<td>-</td>
													<td><%=20000%></td>
												</tr>
												<tr class="gradeA">
													<td><%=4%></td>
													<td>Thành tiền</td>
													<td>-</td>
													<td>-</td>
													<td>-</td>
													<td>-</td>
													<td>-</td>
													<td>-</td>
													<td><%=formatter.format(thanhtien)%></td>
												</tr>
												<tr class="gradeA">
													<td><%=5%></td>
													<td>VAT 10%</td>
													<td>-</td>
													<td>-</td>
													<td>-</td>
													<td>-</td>
													<td>-</td>
													<td>-</td>
													<td><%=formatter.format(VAT)%></td>
												</tr>
												<tr class="gradeA">
													<td><%=6%></td>
													<td>Tổng cước (+VAT)</td>
													<td>-</td>
													<td>-</td>
													<td>-</td>
													<td>-</td>
													<td>-</td>
													<td>-</td>
													<td><%=formatter.format(tongcuoc)%></td>
												</tr>
												<%
													}
												%>
												<!-- Bang tinh gia cuoc EXTENSION -->
												<%
													if (yeucau == "extension") {
															ArrayList<LogCall> listlogcall_ex = BillingDao.getListLogCall_EX(idextension);
												%>
												<%
													}
												%>
											</tbody>

											</tbody>
										</table>
									</div>
								</div>
								<!--end Menu 02 -->
							</div>

							<!-- Menu 3 -->
							<div id="menu3" class="tab-pane fade">
								<!--Neu yeu cau gui ve là thong ke theo dich vu NOI HAT -->
								<%
									ArrayList<LogCall> listlogcall_dv = BillingDao.getListLogCall_DV("A", idcongty, thangnam);
								%>
								<div>
									<div class="box-body no-padding">
										<table id="datatable-responsive"
											class="display table table-striped table-bordered dt-responsive"
											cellspacing="0" width="100%">
											<thead>
												<tr>
													<th>#</th>
													<th>Thuê bao chủ gọi</th>
													<th>Thuê bao được gọi</th>
													<th>Phòng/ban</th>
													<th>Tổng số giây</th>
													<th>Thời gian bắt đầu</th>
													<th>Thời gian kết thúc</th>
													<th>Cost(Chưa makeup) (VND)</th>
													<th>Cost (VNĐ)</th>
												</tr>
											</thead>
											<tbody>

												<!-- LIÊN KẾT VỚI DATABASE ĐỂ LẤY DỮ LIỆU TABLE -->
												<%
													if (yeucau == "tongbill") {
															for (int i = 0; i < listlogcall_dv.size(); i++) {
												%>
												<tr class="gradeA">
													<td><%=i + 1%></td>
													<!-- cot extension-->
													<td><%=listlogcall_dv.get(i).getExtensionID()%></td>
													<td><%=listlogcall_dv.get(i).getThueBaoNhan()%></td>
													<td><%=listlogcall_dv.get(i).getTenPhongBan()%></td>
													<td><%=listlogcall_dv.get(i).getThoiGianGoi()%></td>
													<td><%=listlogcall_dv.get(i).getThoiGianBatDau()%></td>
													<td><%=listlogcall_dv.get(i).getThoiGianKetThuc()%></td>

													<td><%=formatter
								.format((double) Math.round((listlogcall_dv.get(i).getGiaTien() * 100) / 100))%></td>
													<td><%=formatter.format((double) Math.round(
								((listlogcall_dv.get(i).getGiaTien() + listlogcall_dv.get(i).getGiaTien() * tilemakeup)
										* 100) / 100))%></td>
												</tr>
												<%
													}
														}
												%>

												<!-- Bang LOGCALL Noi hat PHONG BAN -->
												<%
													if (yeucau == "phongban") {
															ArrayList<LogCall> listexten_pb = BillingDao.getListLogCall_DVPB("A", idphongban, thangnam);
															for (int i = 0; i < listexten_pb.size(); i++) {
												%>
												<tr class="gradeA">
													<td><%=i + 1%></td>
													<!-- cot extension-->
													<td><%=listexten_pb.get(i).getExtensionID()%></td>
													<td><%=listexten_pb.get(i).getThueBaoNhan()%></td>
													<td><%=listexten_pb.get(i).getTenPhongBan()%></td>
													<td><%=listexten_pb.get(i).getThoiGianGoi()%></td>
													<td><%=listexten_pb.get(i).getThoiGianBatDau()%></td>
													<td><%=listexten_pb.get(i).getThoiGianKetThuc()%></td>

													<td><%=formatter.format((double) Math.round((listexten_pb.get(i).getGiaTien() * 100) / 100))%></td>
													<td><%=formatter.format((double) Math.round(
								((listexten_pb.get(i).getGiaTien() + listexten_pb.get(i).getGiaTien() * tilemakeup)
										* 100) / 100))%></td>
												</tr>
												<%
													}
														}
												%>
												<!-- Bang LOGCALL NOI HAT EXTENSION -->
												<%
													if (yeucau == "extension") {
															ArrayList<LogCall> listlogcall_ex = BillingDao.getListLogCall_DVEX("A", idextension, thangnam);
															for (int i = 0; i < listlogcall_ex.size(); i++) {
												%>
												<tr class="gradeA">
													<td><%=i + 1%></td>
													<!-- cot extension-->
													<td><%=listlogcall_ex.get(i).getExtensionID()%></td>
													<td><%=listlogcall_ex.get(i).getThueBaoNhan()%></td>
													<td><%=listlogcall_ex.get(i).getTenPhongBan()%></td>
													<td><%=listlogcall_ex.get(i).getThoiGianGoi()%></td>
													<td><%=listlogcall_ex.get(i).getThoiGianBatDau()%></td>
													<td><%=listlogcall_ex.get(i).getThoiGianKetThuc()%></td>

													<td><%=formatter
								.format((double) Math.round((listlogcall_ex.get(i).getGiaTien() * 100) / 100))%></td>
													<td><%=formatter.format((double) Math.round(
								((listlogcall_ex.get(i).getGiaTien() + listlogcall_ex.get(i).getGiaTien() * tilemakeup)
										* 100) / 100))%></td>
												</tr>
												<%
													}
														}
												%>
											</tbody>
										</table>
									</div>
								</div>

								<!-- Menu 4 -->
							</div>
							<div id="menu4" class="tab-pane fade">
								<!--Neu yeu cau gui ve là thong ke theo dich vu DI DONG -->
								<%
									ArrayList<LogCall> listlogcall_dv1 = BillingDao.getListLogCall_DV("B", idcongty, thangnam);
								%>
								<div>
									<div class="box-body no-padding">
										<table id="datatable-responsive"
											class="display table table-striped table-bordered dt-responsive"
											cellspacing="0" width="100%">
											<thead>
												<tr>
													<th>#</th>
													<th>Thuê bao chủ gọi</th>
													<th>Thuê bao được gọi</th>
													<th>Phòng/ban</th>
													<th>Tổng số giây</th>
													<th>Thời gian bắt đầu</th>
													<th>Thời gian kết thúc</th>
													<th>Cost(Chưa makeup) (VND)</th>
													<th>Cost (VNĐ)</th>
												</tr>
											</thead>
											<tbody>
												<!-- LIÊN KẾT VỚI DATABASE ĐỂ LẤY DỮ LIỆU TABLE -->
												<%
													if (yeucau == "tongbill") {
															for (int i = 0; i < listlogcall_dv1.size(); i++) {
												%>
												<tr class="gradeA">
													<td><%=i + 1%></td>
													<!-- cot extension-->
													<td><%=listlogcall_dv1.get(i).getExtensionID()%></td>
													<td><%=listlogcall_dv1.get(i).getThueBaoNhan()%></td>
													<td><%=listlogcall_dv1.get(i).getTenPhongBan()%></td>
													<td><%=listlogcall_dv1.get(i).getThoiGianGoi()%></td>
													<td><%=listlogcall_dv1.get(i).getThoiGianBatDau()%></td>
													<td><%=listlogcall_dv1.get(i).getThoiGianKetThuc()%></td>
													<td><%=formatter
								.format((double) Math.round((listlogcall_dv1.get(i).getGiaTien() * 100) / 100))%></td>
													<td><%=formatter.format((double) Math.round(((listlogcall_dv1.get(i).getGiaTien()
								+ listlogcall_dv1.get(i).getGiaTien() * tilemakeup) * 100) / 100))%></td>
												</tr>
												<%
													}
														}
												%>
												<!-- Bang tinh gia cuoc DI DONG PHONG BAN -->
												<%
													if (yeucau == "phongban") {
															ArrayList<LogCall> listexten_pb = BillingDao.getListLogCall_DVPB("B", idphongban, thangnam);
															for (int i = 0; i < listexten_pb.size(); i++) {
												%>
												<tr class="gradeA">
													<td><%=i + 1%></td>
													<!-- cot extension-->
													<td><%=listexten_pb.get(i).getExtensionID()%></td>
													<td><%=listexten_pb.get(i).getThueBaoNhan()%></td>
													<td><%=listexten_pb.get(i).getTenPhongBan()%></td>
													<td><%=listexten_pb.get(i).getThoiGianGoi()%></td>
													<td><%=listexten_pb.get(i).getThoiGianBatDau()%></td>
													<td><%=listexten_pb.get(i).getThoiGianKetThuc()%></td>
													<td><%=formatter.format((double) Math.round((listexten_pb.get(i).getGiaTien() * 100) / 100))%></td>
													<td><%=formatter.format((double) Math.round(
								((listexten_pb.get(i).getGiaTien() + listexten_pb.get(i).getGiaTien() * tilemakeup)
										* 100) / 100))%></td>
												</tr>
												<%
													}
														}
												%>
												<!-- Bang LOGCALL DI DONG THEO EXTENSION -->
												<%
													if (yeucau == "extension") {
															ArrayList<LogCall> listlogcall_ex = BillingDao.getListLogCall_DVEX("B", idextension, thangnam);
															for (int i = 0; i < listlogcall_ex.size(); i++) {
												%>
												<tr class="gradeA">
													<td><%=i + 1%></td>
													<!-- cot extension-->
													<td><%=listlogcall_ex.get(i).getExtensionID()%></td>
													<td><%=listlogcall_ex.get(i).getThueBaoNhan()%></td>
													<td><%=listlogcall_ex.get(i).getTenPhongBan()%></td>
													<td><%=listlogcall_ex.get(i).getThoiGianGoi()%></td>
													<td><%=listlogcall_ex.get(i).getThoiGianBatDau()%></td>
													<td><%=listlogcall_ex.get(i).getThoiGianKetThuc()%></td>
													<td><%=formatter
								.format((double) Math.round((listlogcall_ex.get(i).getGiaTien() * 100) / 100))%></td>
													<td><%=formatter.format((double) Math.round(
								((listlogcall_ex.get(i).getGiaTien() + listlogcall_ex.get(i).getGiaTien() * tilemakeup)
										* 100) / 100))%></td>
												</tr>
												<%
													}
														}
												%>
											</tbody>
										</table>
									</div>
								</div>
							</div>

							<!-- Menu 5 -->
							<div id="menu5" class="tab-pane fade">
								<!--Neu yeu cau gui ve là thong ke theo dich vu NOI HAT -->
								<%
									ArrayList<LogCall> listlogcall_dv2 = BillingDao.getListLogCall_DV("C", idcongty, thangnam);
								%>
								<div>
									<div class="box-body no-padding">
										<table id="datatable-responsive"
											class="display table table-striped table-bordered dt-responsive"
											cellspacing="0" width="100%">
											<thead>
												<tr>
													<th>#</th>
													<th>Thuê bao chủ gọi</th>
													<th>Thuê bao được gọi</th>
													<th>Phòng/ban</th>
													<th>Tổng số giây</th>
													<th>Thời gian bắt đầu</th>
													<th>Thời gian kết thúc</th>
													<th>Cost(Chưa makeup) (VND)</th>
													<th>Cost (VNĐ)</th>
												</tr>
											</thead>
											<tbody>
												<!-- LIÊN KẾT VỚI DATABASE ĐỂ LẤY DỮ LIỆU TABLE -->
												<%
													if (yeucau == "tongbill") {
															for (int i = 0; i < listlogcall_dv2.size(); i++) {
												%>
												<tr class="gradeA">
													<td><%=i + 1%></td>
													<!-- cot extension-->
													<td><%=listlogcall_dv2.get(i).getExtensionID()%></td>
													<td><%=listlogcall_dv2.get(i).getThueBaoNhan()%></td>
													<td><%=listlogcall_dv2.get(i).getTenPhongBan()%></td>
													<td><%=listlogcall_dv2.get(i).getThoiGianGoi()%></td>
													<td><%=listlogcall_dv2.get(i).getThoiGianBatDau()%></td>
													<td><%=listlogcall_dv2.get(i).getThoiGianKetThuc()%></td>
													<td><%=formatter
								.format((double) Math.round((listlogcall_dv2.get(i).getGiaTien() * 100) / 100))%></td>
													<td><%=formatter.format((double) Math.round(((listlogcall_dv2.get(i).getGiaTien()
								+ listlogcall_dv2.get(i).getGiaTien() * tilemakeup) * 100) / 100))%></td>
												</tr>
												<%
													}
														}
												%>
												<!-- Bang LOGCALL LIEN TINH THEO PHONG BAN -->
												<%
													if (yeucau == "phongban") {
															ArrayList<LogCall> listexten_pb = BillingDao.getListLogCall_DVPB("C", idphongban, thangnam);
															for (int i = 0; i < listexten_pb.size(); i++) {
												%>
												<tr class="gradeA">
													<td><%=i + 1%></td>
													<!-- cot extension-->
													<td><%=listexten_pb.get(i).getExtensionID()%></td>
													<td><%=listexten_pb.get(i).getThueBaoNhan()%></td>
													<td><%=listexten_pb.get(i).getTenPhongBan()%></td>
													<td><%=listexten_pb.get(i).getThoiGianGoi()%></td>
													<td><%=listexten_pb.get(i).getThoiGianBatDau()%></td>
													<td><%=listexten_pb.get(i).getThoiGianKetThuc()%></td>
													<td><%=formatter.format((double) Math.round((listexten_pb.get(i).getGiaTien() * 100) / 100))%></td>
													<td><%=formatter.format((double) Math.round(
								((listexten_pb.get(i).getGiaTien() + listexten_pb.get(i).getGiaTien() * tilemakeup)
										* 100) / 100))%></td>
												</tr>
												<%
													}
														}
												%>
												<!-- Bang LOGCALL LIEN TINH THEO EXTENSION -->
												<%
													if (yeucau == "extension") {
															ArrayList<LogCall> listlogcall_ex = BillingDao.getListLogCall_DVEX("C", idextension, thangnam);
															for (int i = 0; i < listlogcall_ex.size(); i++) {
												%>
												<tr class="gradeA">
													<td><%=i + 1%></td>
													<!-- cot extension-->
													<td><%=listlogcall_ex.get(i).getExtensionID()%></td>
													<td><%=listlogcall_ex.get(i).getThueBaoNhan()%></td>
													<td><%=listlogcall_ex.get(i).getTenPhongBan()%></td>
													<td><%=listlogcall_ex.get(i).getThoiGianGoi()%></td>
													<td><%=listlogcall_ex.get(i).getThoiGianBatDau()%></td>
													<td><%=listlogcall_ex.get(i).getThoiGianKetThuc()%></td>
													<td><%=formatter
								.format((double) Math.round((listlogcall_ex.get(i).getGiaTien() * 100) / 100))%></td>
													<td><%=formatter.format((double) Math.round(
								((listlogcall_ex.get(i).getGiaTien() + listlogcall_ex.get(i).getGiaTien() * tilemakeup)
										* 100) / 100))%></td>
												</tr>
												<%
													}
														}
												%>
											</tbody>
										</table>
									</div>
								</div>
							</div>

							<!-- Menu 6 -->
							<div id="menu6" class="tab-pane fade">
								<!--Neu yeu cau gui ve là thong ke theo dich vu NOI HAT -->
								<%
									ArrayList<LogCall> listlogcall_dv3 = BillingDao.getListLogCall_DV("D", idcongty, thangnam);
								%>
								<div>
									<div class="box-body no-padding">
										<table id="datatable-responsive"
											class="display table table-striped table-bordered dt-responsive"
											cellspacing="0" width="100%">
											<thead>
												<tr>
													<th>#</th>
													<th>Thuê bao chủ gọi</th>
													<th>Thuê bao được gọi</th>
													<th>Phòng/ban</th>
													<th>Tổng số giây</th>
													<th>Thời gian bắt đầu</th>
													<th>Thời gian kết thúc</th>
													<th>Cost(Chưa makeup) (VND)</th>
													<th>Cost (VNĐ)</th>
												</tr>
											</thead>
											<tbody>
												<!-- LIÊN KẾT VỚI DATABASE ĐỂ LẤY DỮ LIỆU TABLE -->
												<%
													if (yeucau == "tongbill") {
															for (int i = 0; i < listlogcall_dv3.size(); i++) {
												%>
												<tr class="gradeA">
													<td><%=i + 1%></td>
													<!-- cot extension-->
													<td><%=listlogcall_dv3.get(i).getExtensionID()%></td>
													<td><%=listlogcall_dv3.get(i).getThueBaoNhan()%></td>
													<td><%=listlogcall_dv3.get(i).getTenPhongBan()%></td>
													<td><%=listlogcall_dv3.get(i).getThoiGianGoi()%></td>
													<td><%=listlogcall_dv3.get(i).getThoiGianBatDau()%></td>
													<td><%=listlogcall_dv3.get(i).getThoiGianKetThuc()%></td>
													<td><%=formatter
								.format((double) Math.round((listlogcall_dv3.get(i).getGiaTien() * 100) / 100))%></td>
													<td><%=formatter.format((double) Math.round(((listlogcall_dv3.get(i).getGiaTien()
								+ listlogcall_dv3.get(i).getGiaTien() * tilemakeup) * 100) / 100))%></td>
												</tr>
												<%
													}
														}
												%>
												<!-- Bang LOGCALL QUOC TE THEO PHONG BAN -->
												<%
													if (yeucau == "phongban") {
															ArrayList<LogCall> listexten_pb = BillingDao.getListLogCall_DVPB("D", idphongban, thangnam);
															for (int i = 0; i < listexten_pb.size(); i++) {
												%>
												<tr class="gradeA">
													<td><%=i + 1%></td>
													<!-- cot extension-->
													<td><%=listexten_pb.get(i).getExtensionID()%></td>
													<td><%=listexten_pb.get(i).getThueBaoNhan()%></td>
													<td><%=listexten_pb.get(i).getTenPhongBan()%></td>
													<td><%=listexten_pb.get(i).getThoiGianGoi()%></td>
													<td><%=listexten_pb.get(i).getThoiGianBatDau()%></td>
													<td><%=listexten_pb.get(i).getThoiGianKetThuc()%></td>
													<td><%=formatter.format((double) Math.round((listexten_pb.get(i).getGiaTien() * 100) / 100))%></td>
													<td><%=formatter.format((double) Math.round(
								((listexten_pb.get(i).getGiaTien() + listexten_pb.get(i).getGiaTien() * tilemakeup)
										* 100) / 100))%></td>
												</tr>
												<%
													}
														}
												%>
												<!-- Bang LOGCALL QUOC TE THEO EXTENSION -->
												<%
													if (yeucau == "extension") {
															ArrayList<LogCall> listlogcall_ex = BillingDao.getListLogCall_DVEX("D", idextension, thangnam);
															for (int i = 0; i < listlogcall_ex.size(); i++) {
												%>
												<tr class="gradeA">
													<td><%=i + 1%></td>
													<!-- cot extension-->
													<td><%=listlogcall_ex.get(i).getExtensionID()%></td>
													<td><%=listlogcall_ex.get(i).getThueBaoNhan()%></td>
													<td><%=listlogcall_ex.get(i).getTenPhongBan()%></td>
													<td><%=listlogcall_ex.get(i).getThoiGianGoi()%></td>
													<td><%=listlogcall_ex.get(i).getThoiGianBatDau()%></td>
													<td><%=listlogcall_ex.get(i).getThoiGianKetThuc()%></td>
													<td><%=formatter
								.format((double) Math.round((listlogcall_ex.get(i).getGiaTien() * 100) / 100))%></td>
													<td><%=formatter.format((double) Math.round(
								((listlogcall_ex.get(i).getGiaTien() + listlogcall_ex.get(i).getGiaTien() * tilemakeup)
										* 100) / 100))%></td>
												</tr>
												<%
													}
														}
												%>
											</tbody>
										</table>
									</div>
								</div>

							</div>
							<div id="menu7" class="tab-pane fade">
								<!--Neu yeu cau gui ve là thong ke theo dich vu NOI HAT -->
								<%
									ArrayList<LogCall> listlogcall_dv4 = BillingDao.getListLogCall_DV("E", idcongty, thangnam);
								%>
								<div>
									<div class="box-body no-padding">
										<table id="datatable-responsive"
											class="display table table-striped table-bordered dt-responsive"
											cellspacing="0" width="100%">
											<thead>
												<tr>
													<th>#</th>
													<th>Thuê bao chủ gọi</th>
													<th>Thuê bao được gọi</th>
													<th>Phòng/ban</th>
													<th>Tổng số giây</th>
													<th>Thời gian bắt đầu</th>
													<th>Thời gian kết thúc</th>
													<th>Cost(Chưa makeup) (VND)</th>
													<th>Cost (VNĐ)</th>
												</tr>
											</thead>
											<tbody>
												<!-- LIÊN KẾT VỚI DATABASE ĐỂ LẤY DỮ LIỆU TABLE -->
												<%
													if (yeucau == "tongbill") {
															for (int i = 0; i < listlogcall_dv4.size(); i++) {
												%>
												<tr class="gradeA">
													<td><%=i + 1%></td>
													<!-- cot extension-->
													<td><%=listlogcall_dv4.get(i).getExtensionID()%></td>
													<td><%=listlogcall_dv4.get(i).getThueBaoNhan()%></td>
													<td><%=listlogcall_dv4.get(i).getTenPhongBan()%></td>
													<td><%=listlogcall_dv4.get(i).getThoiGianGoi()%></td>
													<td><%=listlogcall_dv4.get(i).getThoiGianBatDau()%></td>
													<td><%=listlogcall_dv4.get(i).getThoiGianKetThuc()%></td>
													<td><%=formatter
								.format((double) Math.round((listlogcall_dv4.get(i).getGiaTien() * 100) / 100))%></td>
													<td><%=formatter.format((double) Math.round(((listlogcall_dv4.get(i).getGiaTien()
								+ listlogcall_dv4.get(i).getGiaTien() * tilemakeup) * 100) / 100))%></td>
												</tr>
												<%
													}
														}
												%>
												<!-- Bang LOGCALL DICH VU THEO PHONG BAN -->
												<%
													if (yeucau == "phongban") {
															ArrayList<LogCall> listexten_pb = BillingDao.getListLogCall_DVPB("E", idphongban, thangnam);
															for (int i = 0; i < listexten_pb.size(); i++) {
												%>
												<tr class="gradeA">
													<td><%=i + 1%></td>
													<!-- cot extension-->
													<td><%=listexten_pb.get(i).getExtensionID()%></td>
													<td><%=listexten_pb.get(i).getThueBaoNhan()%></td>
													<td><%=listexten_pb.get(i).getTenPhongBan()%></td>
													<td><%=listexten_pb.get(i).getThoiGianGoi()%></td>
													<td><%=listexten_pb.get(i).getThoiGianBatDau()%></td>
													<td><%=listexten_pb.get(i).getThoiGianKetThuc()%></td>
													<td><%=formatter.format((double) Math.round((listexten_pb.get(i).getGiaTien() * 100) / 100))%></td>
													<td><%=formatter.format((double) Math.round(
								((listexten_pb.get(i).getGiaTien() + listexten_pb.get(i).getGiaTien() * tilemakeup)
										* 100) / 100))%></td>
												</tr>
												<%
													}
														}
												%>
												<!-- Bang LOGCALL DICH VU EXTENSION -->
												<%
													if (yeucau == "extension") {
															ArrayList<LogCall> listlogcall_ex = BillingDao.getListLogCall_DVEX("E", idextension, thangnam);
															for (int i = 0; i < listlogcall_ex.size(); i++) {
												%>
												<tr class="gradeA">
													<td><%=i + 1%></td>
													<!-- cot extension-->
													<td><%=listlogcall_ex.get(i).getExtensionID()%></td>
													<td><%=listlogcall_ex.get(i).getThueBaoNhan()%></td>
													<td><%=listlogcall_ex.get(i).getTenPhongBan()%></td>
													<td><%=listlogcall_ex.get(i).getThoiGianGoi()%></td>
													<td><%=listlogcall_ex.get(i).getThoiGianBatDau()%></td>
													<td><%=listlogcall_ex.get(i).getThoiGianKetThuc()%></td>
													<td><%=formatter
								.format((double) Math.round((listlogcall_ex.get(i).getGiaTien() * 100) / 100))%></td>
													<td><%=formatter.format((double) Math.round(
								((listlogcall_ex.get(i).getGiaTien() + listlogcall_ex.get(i).getGiaTien() * tilemakeup)
										* 100) / 100))%></td>
												</tr>
												<%
													}
														}
												%>
											</tbody>
										</table>
									</div>
								</div>
								<!-- /.box-body -->
							</div>
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