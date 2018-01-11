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


	<div class="wrapper">


		<!-- Include this in all index page -->
		<jsp:include page="sideBar.jsp"></jsp:include>
		<!-- /.Include this in all index page -->


		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			
			<%	
			String idextension = (String) request.getAttribute("extensionid");
			String idphongban = (String) request.getAttribute("phongbanid");
				String idcongty = (String) request.getAttribute("congtyid"); 
				double tilemakeup = CongTyDao.getTiLeMakeUp(idcongty);
					String tencongty = (String) request.getAttribute("tencongty"); 
					  String yeucau = (String) request.getAttribute("yeucau");
					ArrayList<PhongBan> listPhongBan = PhongBanDao.getListPBCongTy(idcongty);
					ArrayList<Extension> listExtensions = ExtensionDao.getListEXCongTy(idcongty);
					ArrayList<LogCall> listBilling = BillingDao.getListLogCall_CT(idcongty);
			%>
			<section class="content-header">
			<h1>
				Billings
				<%=tencongty%></h1>
			<ol class="breadcrumb">
				<li><a href="index.jsp"><i class="fa fa-dashboard"></i>
						BillingsSystem</a></li>
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
											<option selected="">Phòng/Ban</option>
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
											<option selected="">Extension</option>

											<!-- LẤY DANH SÁCH GROUP TỪ DATABASE -->
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
								<i class="glyphicon glyphicon-filter"></i> Filter dịch vụ
							</h3>
						</div>

						<form action="<%=request.getContextPath()%>/ManagerBilling"
							class="form-horizontal">
							<div class="box-body">
								<div class="row">
									<div class="col-sm-8">
										<select class="form-control" name="dichvu">
											<option value="A">Nội hạt</option>
											<option value="B">Di động</option>
											<option value="C">Liên tỉnh</option>
											<option value="D">Quốc tế</option>
											<option value="E">Dịch vụ</option>

											<!-- LẤY DANH SÁCH GROUP TỪ DATABASE -->

										</select>
									</div>
									<div class="col-sm-3">
										<input type="hidden" name="congtyid" value="<%=idcongty%>"></input>
										<input type="hidden" name="tencongty" value="<%=tencongty%>"></input>
										<input type="hidden" name="command" value="filter_dichvu"></input>
										<button type="submit"
											class="btn btn-primary glyphicon glyphicon-search">
										</button>
									</div>
								</div>
							</div>
						</form>

					</div>
				</div>
				<%
					
				%>
				<!--  -->
				<div class="col-sm-2">
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

				<div class="col-md-12">

					<div class="box box-primary">
						<div class="box-header">
						<%if(yeucau!="tongbill"){ %>
							<form action="<%=request.getContextPath()%>/ManagerBilling"
									class="form-horizontal">
									<input type="hidden" name="congtyid" value="<%=idcongty%>"></input>
									<input type="hidden" name="tencongty" value="<%=tencongty%>"></input>
									<input type="hidden" name="command" value="detail"></input>
									<button type="submit"
										class="btn btn-primary glyphicon glyphicon-list">
										Tổng</button>
							</form>
							<%} %>
							<ul class="pagination pagination-sm no-margin pull-right">
								<li><a href="#">«</a></li>
								<li><a href="#">1</a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">»</a></li>
							</ul>
						</div>
						<!-- /.box-header -->
						<ul class="nav nav-tabs">
							<li class="active"><a data-toggle="tab" href="#home">Chi
									tiết billing</a></li>
							<%if(yeucau=="tongbill"){%>
							<li><a data-toggle="tab" href="#menu2">Bảng cước thoại</a></li>
							<%} %>
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
									<table class="table table-bordered" cellspacing="0"
										width="100%">
										<thead>
											<tr>
												<th>stt</th>
												<th>Dịch vụ/Service</th>
												<th>Cước/Cost</th>
											</tr>
										</thead>
										
										<tbody>
											<!-- Bang tinh gia cuoc dien thoai -->
											<%
											// tinh cho cong ty
											double noihat= BillingDao.tinhtongtien("A", idcongty);
											double tiennoihat = (double)Math.round(noihat*100)/100;
											double tiennoihatma = (double)Math.round((tiennoihat*(1+tilemakeup))*100)/100;
											
											double lientinh = BillingDao.tinhtongtien("C", idcongty);
											double tienlientinh =(double)Math.round(lientinh*100)/100;
											double tienlientinhma = (double)Math.round((tienlientinh*(1+tilemakeup))*100)/100;
											
											double didong = BillingDao.tinhtongtien("B", idcongty);
											double tiendidong = (double)Math.round(didong*100)/100;
											double tiendidongma = (double)Math.round((tiendidong*(1+tilemakeup))*100)/100;
											
											double quocte = BillingDao.tinhtongtien("D", idcongty);
											double tienquocte = (double)Math.round(quocte*100)/100;
											double tienquoctema = (double)Math.round((tienquocte*(1+tilemakeup))*100)/100;
											
											double dichvu = BillingDao.tinhtongtien("E", idcongty);
											double tiendichvu = (double)Math.round(dichvu*100)/100;
											double tiendichvuma = (double)Math.round((tiendichvu*(1+tilemakeup))*100)/100;
											
											double tongcuocp = 20000 + tiennoihatma + tienlientinhma
													+ tiendidongma + tienquoctema + tiendichvuma;
											double tongcuoc7 = (double)Math.round(tongcuocp*100)/100;
											double phiphucvu8 = (double)Math.round((tongcuoc7 * 5 / 100)*100)/100;;
											double tongcongcuoc9 = (double)Math.round((tongcuoc7 + phiphucvu8)*100)/100;
											double thueVAT = (double)Math.round((tongcongcuoc9 * 10 / 100)*100)/100;
											double tongthanhtoan = (double)Math.round((tongcongcuoc9 + thueVAT)*100)/100;
											
											// tinh cho phong ban
											
											double noihatpb= BillingDao.tinhtongtienpb("A", idphongban);
											double tiennoihatpb = (double)Math.round(noihatpb*100)/100;
											double tiennoihatmapb = (double)Math.round((tiennoihatpb*(1+tilemakeup))*100)/100;
											
											double didongpb = BillingDao.tinhtongtienpb("B", idphongban);
											double tiendidongpb = (double)Math.round(didongpb*100)/100;
											double tiendidongmapb = (double)Math.round((tiendidongpb*(1+tilemakeup))*100)/100;
											
											double lientinhpb = BillingDao.tinhtongtienpb("C", idphongban);
											double tienlientinhpb =(double)Math.round(lientinhpb*100)/100;
											double tienlientinhmapb = (double)Math.round((tienlientinhpb*(1+tilemakeup))*100)/100;
											
											double quoctepb = BillingDao.tinhtongtienpb("D", idphongban);
											double tienquoctepb = (double)Math.round(quoctepb*100)/100;
											double tienquoctemapb= (double)Math.round((tienquoctepb*(1+tilemakeup))*100)/100;
											
											double dichvupb = BillingDao.tinhtongtienpb("E", idphongban);
											double tiendichvupb = (double)Math.round(dichvupb*100)/100;
											double tiendichvumapb = (double)Math.round((tiendichvupb*(1+tilemakeup))*100)/100;
											
											double tongcuocpb = tiennoihatmapb + tienlientinhmapb
													+ tiendidongmapb + tienquoctemapb + tiendichvumapb;
											double tongcuoc7pb = (double)Math.round(tongcuocpb*100)/100;
	
											
										// tinh cho phong ban
											
											double noihatex= BillingDao.tinhtongtienex("A", idextension);
											double tiennoihatex = (double)Math.round(noihatex*100)/100;
											double tiennoihatmaex= (double)Math.round((tiennoihatex*(1+tilemakeup))*100)/100;
											
											double didongex = BillingDao.tinhtongtienex("B", idextension);
											double tiendidongex = (double)Math.round(didongex*100)/100;
											double tiendidongmaex = (double)Math.round((tiendidongex*(1+tilemakeup))*100)/100;
											
											double lientinhex = BillingDao.tinhtongtienex("C", idextension);
											double tienlientinhex =(double)Math.round(lientinhex*100)/100;
											double tienlientinhmaex = (double)Math.round((tienlientinhex*(1+tilemakeup))*100)/100;
											
											double quocteex = BillingDao.tinhtongtienex("D", idextension);
											double tienquocteex = (double)Math.round(quocteex*100)/100;
											double tienquoctemaex= (double)Math.round((tienquocteex*(1+tilemakeup))*100)/100;
											
											double dichvuex = BillingDao.tinhtongtienex("E", idextension);
											double tiendichvuex = (double)Math.round(dichvuex*100)/100;
											double tiendichvumaex = (double)Math.round((tiendichvuex*(1+tilemakeup))*100)/100;
											
											double tongcuocex = tiennoihatmaex + tienlientinhmaex
													+ tiendidongmaex + tienquoctemaex + tiendichvumaex;
											double tongcuoc7ex = (double)Math.round(tongcuocex*100)/100;
											
											%>
											<!-- Bang tinh gia cuoc TONG BILL CONG TY -->
											<%if(yeucau=="tongbill"){
										    %>
											<tr class="gradeA">
												<td><%=1%></td>
												<td>Cước thuê bao tháng / Monthly Cost</td>
												<td><%=20000%></td>
											</tr>
											<tr class="gradeA">
												<td><%=2%></td>
												<td>Cước nội hạt / Local Cost</td>
												<td><%=tiennoihatma%></td>
											</tr>
											<tr class="gradeA">
												<td><%=3%></td>
												<td>Cước liên tỉnh /Province Cost</td>
												<td><%=tienlientinhma%></td>
											</tr>
											<tr class="gradeA">
												<td><%=4%></td>
												<td>Cước di động / Mobile Cost</td>
												<td><%=tiendidongma%></td>
											</tr>
											<tr class="gradeA">
												<td><%=5%></td>
												<td>Cước quốc tế / International Cost</td>
												<td><%=tienquoctema%></td>
											</tr>
											<tr class="gradeA">
												<td><%=6%></td>
												<td>Cước dịch vụ đặc biệt / Special Service Cost</td>
												<td><%=tiendichvuma%></td>
											</tr>
											<tr class="gradeA">
												<td><%=7%></td>
												<td>Tổng cộng cước sử dụng / Total Dialling Cost
													(1+2+3+4+5+6)</td>
												<td><%=tongcuoc7%></td>
											</tr>
											<tr class="gradeA">
												<td><%=8%></td>
												<td>Phí phục vụ / Service Fee(5%)</td>
												<td><%=phiphucvu8%></td>
											</tr>
											<tr class="gradeA">
												<td><%=9%></td>
												<td>Tổng cộng cước phí chưa bao gồm thuế / Total Cost
													exclude Tax (7+8)</td>
												<td><%=tongcongcuoc9%></td>
											</tr>
											<tr class="gradeA">
												<td><%=10%></td>
												<td>Thuế VAT / Tax (10%)</td>
												<td><%=thueVAT%></td>
											</tr>
											<tr class="gradeA">
												<td><%=11%></td>
												<td>Tổng cộng tiền thanh toán / Total Payment (9+10)</td>
												<td><%=tongthanhtoan%></td>
											</tr>
											<%} %>
								<!-- Bang tinh gia cuoc PHONG BAN -->		
											<%
											if(yeucau=="phongban"){  
											ArrayList<LogCall> listexten_pb = BillingDao.getListLogCall_PB(idphongban);
											%>
											
											<tr class="gradeA">
												<td><%=1%></td>
												<td>Cước nội hạt / Local Cost</td>
												<td><%=tiennoihatmapb%></td>
											</tr>
											<tr class="gradeA">
												<td><%=2%></td>
												<td>Cước liên tỉnh /Province Cost</td>
												<td><%=tienlientinhmapb%></td>
											</tr>
											<tr class="gradeA">
												<td><%=3%></td>
												<td>Cước di động / Mobile Cost</td>
												<td><%=tiendidongmapb%></td>
											</tr>
											<tr class="gradeA">
												<td><%=4%></td>
												<td>Cước quốc tế / International Cost</td>
												<td><%=tienquoctemapb%></td>
											</tr>
											<tr class="gradeA">
												<td><%=5%></td>
												<td>Cước dịch vụ đặc biệt / Special Service Cost</td>
												<td><%=tiendichvumapb%></td>
											</tr>
											<tr class="gradeA">
												<td><%=6%></td>
												<td>Tổng cộng cước sử dụng / Total Dialling Cost
													(1+2+3+4+5)</td>
												<td><%=tongcuoc7pb%></td>
											</tr>
											
											<%} %>
							<!-- Bang tinh gia cuoc EXTENSION -->			
											<%
											if(yeucau=="extension"){  

											ArrayList<LogCall> listlogcall_ex = BillingDao.getListLogCall_EX(idextension);
											%>
											
											<tr class="gradeA">
												<td><%=1%></td>
												<td>Cước nội hạt / Local Cost</td>
												<td><%=tiennoihatmaex%></td>
											</tr>
											<tr class="gradeA">
												<td><%=2%></td>
												<td>Cước liên tỉnh /Province Cost</td>
												<td><%=tienlientinhmaex%></td>
											</tr>
											<tr class="gradeA">
												<td><%=3%></td>
												<td>Cước di động / Mobile Cost</td>
												<td><%=tiendidongmaex%></td>
											</tr>
											<tr class="gradeA">
												<td><%=4%></td>
												<td>Cước quốc tế / International Cost</td>
												<td><%=tienquoctemaex%></td>
											</tr>
											<tr class="gradeA">
												<td><%=5%></td>
												<td>Cước dịch vụ đặc biệt / Special Service Cost</td>
												<td><%=tiendichvumaex%></td>
											</tr>
											<tr class="gradeA">
												<td><%=6%></td>
												<td>Tổng cộng cước sử dụng / Total Dialling Cost
													(1+2+3+4+5)</td>
												<td><%=tongcuoc7ex%></td>
											</tr>
											
											<%} %>
										</tbody>
										
									</table>
								</div>
							</div>
							<!--end Menu 01 -->
							<div id="menu2" class="tab-pane fade">
								<!-- Menu 02 -->
								<div id="home" class="tab-pane fade in active">
									<div class="box-body no-padding">
										<table class="table table-bordered" cellspacing="0"
											width="100%">
											<thead>
												<tr>
													<th>stt</th>
													<th></th>
													<th>Tỉ lệ makeup (%)</th>
													<th>Cước Quốc Tế (Chưa VAT)</th>
													<th>Cước Liên tỉnh (Chưa VAT)</th>
													<th>Cước di động (Chưa VAT)</th>
													<th>Cước Dịch vụ (Chưa VAT)</th>
													<th>Cước Nội hạt (Chưa VAT)</th>
													<th>TỔNG CƯỚC GỐC (Chưa VAT)</th>
												</tr>
											</thead>
											<tbody>
												<!-- Bang tinh gia cuoc dien thoai -->
												<%
												double tongcuocchuavat1 = tiennoihat + tienlientinh
												+ tiendidong + tienquocte + tiendichvu;
												double tongcuocchuavat = (double)Math.round((tongcuocchuavat1)*100)/100;
												double tongcuocmakeup = (double)Math.round((tongcuocchuavat+tongcuocchuavat*tilemakeup)*100)/100;
												double thanhtien = tongcuocmakeup+ 20000;
												double VAT = (double)Math.round((thanhtien * 10 / 100)*100)/100;
												double tongcuoc = (double)Math.round((thanhtien + VAT)*100)/100;	
																																	
												%>
												<!-- Bang tinh gia cuoc TONG CONG TY -->
												<%if(yeucau=="tongbill"){
										   		 %>
												<tr class="gradeA">
													<td><%=1%></td>
													<td>Cước ban đầu</td>
													<td></td>
													<td><%=tienquocte%></td>
													<td><%=tienlientinh%></td>
													<td><%=tiendidong%></td>
													<td><%=tiendichvu%></td>
													<td><%=tiennoihat%></td>
													<td><%=tongcuocchuavat%></td>
												</tr>
												<tr class="gradeA">
													<td><%=2%></td>
													<td>Cước ban theo tỉ lệ makeup</td>
													<td><%=tilemakeup*100%></td>
													<td><%=tienquoctema%></td>
													<td><%=tienlientinhma%></td>
													<td><%=tiendidongma%></td>
													<td><%=tiendichvuma%></td>
													<td><%=tiennoihatma%></td>
													<td><%=tongcuocmakeup%></td>
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
													<td><%=thanhtien%></td>
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
													<td><%=VAT%></td>
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
													<td><%=tongcuoc%></td>
												</tr>
												<%} %>
												<!-- Bang tinh gia cuoc EXTENSION -->			
											<%
											if(yeucau=="extension"){  

											ArrayList<LogCall> listlogcall_ex = BillingDao.getListLogCall_EX(idextension);
											%>
											<%} %>
										</tbody>

											</tbody>
										</table>
									</div>
								</div>
								<!--end Menu 02 -->
							</div>
							<div id="menu3" class="tab-pane fade">
								<!--Neu yeu cau gui ve là thong ke theo dich vu NOI HAT -->
								<%
									ArrayList<LogCall> listlogcall_dv = BillingDao.getListLogCall_DV("A",idcongty);
								%>
								<div>
									<div class="box-body no-padding">
										<table id="datatable-responsive"
											class="table table-striped table-bordered dt-responsive nowrap"
											cellspacing="0" width="100%">
											<thead>
												<tr>
													<th>Stt</th>
													<th>Thuê bao chủ gọi</th>
													<th>Thuê bao được gọi</th>
													<th>Phòng/ban</th>
													<th>Tổng số giây</th>
													<th>Thời gian</th>
													<th>Loại cuộc gọi</th>
													<th>Cost(Chưa VAT) (VND)</th>
													<th>Cost đã makeup</th>
												</tr>
											</thead>
											<tbody>

										    	
												<!-- LIÊN KẾT VỚI DATABASE ĐỂ LẤY DỮ LIỆU TABLE -->
												<%if(yeucau=="tongbill"){
													for (int i = 0; i < listlogcall_dv.size(); i++) {
												%>
												<tr class="gradeA">
													<td><%=i + 1%></td>
													<!-- cot extension-->
													<td><%=listlogcall_dv.get(i).getExtensionID()%></td>
													<td><%=listlogcall_dv.get(i).getThueBaoNhan()%></td>
													<td><%=listlogcall_dv.get(i).getTenPhongBan()%></td>
													<td><%=listlogcall_dv.get(i).getThoiGianGoi()%></td>
													<td><%=listlogcall_dv.get(i).getNgayGoi()%></td>
													<td><%=listlogcall_dv.get(i).getLoaiCuocGoi()%></td>
													<td><%=(double)Math.round((listlogcall_dv.get(i).getGiaTien()*100)/100)%></td>
													<td><%=(double)Math.round(((listlogcall_dv.get(i).getGiaTien()+listlogcall_dv.get(i).getGiaTien()*tilemakeup)*100)/100)%></td>
												</tr>
												<%
													}
												}
												%>
												
									<!-- Bang LOGCALL Noi hat PHONG BAN -->		
												<%
												if(yeucau=="phongban"){  
												
												ArrayList<LogCall> listexten_pb = BillingDao.getListLogCall_DVPB("A", idphongban);
												for (int i = 0; i < listexten_pb.size(); i++) {
												%>
												<tr class="gradeA">
													<td><%=i + 1%></td>
													<!-- cot extension-->
													<td><%=listexten_pb.get(i).getExtensionID()%></td>
													<td><%=listexten_pb.get(i).getThueBaoNhan()%></td>
													<td><%=listexten_pb.get(i).getTenPhongBan()%></td>
													<td><%=listexten_pb.get(i).getThoiGianGoi()%></td>
													<td><%=listexten_pb.get(i).getNgayGoi()%></td>
													<td><%=listexten_pb.get(i).getLoaiCuocGoi()%></td>
													<td><%=(double)Math.round((listexten_pb.get(i).getGiaTien()*100)/100)%></td>
													<td><%=(double)Math.round(((listexten_pb.get(i).getGiaTien()+listexten_pb.get(i).getGiaTien()*tilemakeup)*100)/100)%></td>
												</tr>
												<%}
												}
												%>
								<!-- Bang LOGCALL NOI HAT EXTENSION -->			
											<%
											if(yeucau=="extension"){  
											
											ArrayList<LogCall> listlogcall_ex = BillingDao.getListLogCall_DVEX("A", idextension);
											for (int i = 0; i < listlogcall_ex.size(); i++) {
												%>
												<tr class="gradeA">
													<td><%=i + 1%></td>
													<!-- cot extension-->
													<td><%=listlogcall_ex.get(i).getExtensionID()%></td>
													<td><%=listlogcall_ex.get(i).getThueBaoNhan()%></td>
													<td><%=listlogcall_ex.get(i).getTenPhongBan()%></td>
													<td><%=listlogcall_ex.get(i).getThoiGianGoi()%></td>
													<td><%=listlogcall_ex.get(i).getNgayGoi()%></td>
													<td><%=listlogcall_ex.get(i).getLoaiCuocGoi()%></td>
													<td><%=(double)Math.round((listlogcall_ex.get(i).getGiaTien()*100)/100)%></td>
													<td><%=(double)Math.round(((listlogcall_ex.get(i).getGiaTien()+listlogcall_ex.get(i).getGiaTien()*tilemakeup)*100)/100)%></td>
												</tr>
											<%}
											}%>
											</tbody>
										</table>
									</div>
								</div>

								<!-- /.box-body -->
							</div>
							<div id="menu4" class="tab-pane fade">
								<!--Neu yeu cau gui ve là thong ke theo dich vu DI DONG -->
								<%
									ArrayList<LogCall> listlogcall_dv1 = BillingDao.getListLogCall_DV("B",idcongty);
								%>
								<div>
									<div class="box-body no-padding">
										<table id="datatable-responsive"
											class="table table-striped table-bordered dt-responsive nowrap"
											cellspacing="0" width="100%">
											<thead>
												<tr>
													<th>Stt</th>
													<th>Thuê bao chủ gọi</th>
													<th>Thuê bao được gọi</th>
													<th>Phòng/ban</th>
													<th>Tổng số giây</th>
													<th>Thời gian</th>
													<th>Loại cuộc gọi</th>
													<th>Cost(Chưa VAT) (VND)</th>
													<th>Cost đã makeup</th>
												</tr>
											</thead>
											<tbody>
												<!-- LIÊN KẾT VỚI DATABASE ĐỂ LẤY DỮ LIỆU TABLE -->
												<% if(yeucau=="tongbill"){
													for (int i = 0; i < listlogcall_dv1.size(); i++) {
												%>
												<tr class="gradeA">
													<td><%=i + 1%></td>
													<!-- cot extension-->
													<td><%=listlogcall_dv1.get(i).getExtensionID()%></td>
													<td><%=listlogcall_dv1.get(i).getThueBaoNhan()%></td>
													<td><%=listlogcall_dv1.get(i).getTenPhongBan()%></td>
													<td><%=listlogcall_dv1.get(i).getThoiGianGoi()%></td>
													<td><%=listlogcall_dv1.get(i).getNgayGoi()%></td>
													<td><%=listlogcall_dv1.get(i).getLoaiCuocGoi()%></td>
													<td><%=(double)Math.round((listlogcall_dv1.get(i).getGiaTien()*100)/100)%></td>
													<td><%=(double)Math.round(((listlogcall_dv1.get(i).getGiaTien()+listlogcall_dv1.get(i).getGiaTien()*tilemakeup)*100)/100)%></td>
												</tr>
												<%
													}
												}
												%>
								<!-- Bang tinh gia cuoc DI DONG PHONG BAN -->		
												<%
												if(yeucau=="phongban"){  
												
												ArrayList<LogCall> listexten_pb = BillingDao.getListLogCall_DVPB("B", idphongban);
												for (int i = 0; i < listexten_pb.size(); i++) {
												%>
												<tr class="gradeA">
													<td><%=i + 1%></td>
													<!-- cot extension-->
													<td><%=listexten_pb.get(i).getExtensionID()%></td>
													<td><%=listexten_pb.get(i).getThueBaoNhan()%></td>
													<td><%=listexten_pb.get(i).getTenPhongBan()%></td>
													<td><%=listexten_pb.get(i).getThoiGianGoi()%></td>
													<td><%=listexten_pb.get(i).getNgayGoi()%></td>
													<td><%=listexten_pb.get(i).getLoaiCuocGoi()%></td>
													<td><%=(double)Math.round((listexten_pb.get(i).getGiaTien()*100)/100)%></td>
													<td><%=(double)Math.round(((listexten_pb.get(i).getGiaTien()+listexten_pb.get(i).getGiaTien()*tilemakeup)*100)/100)%></td>
												</tr>
												<%}
												}
												%>
						<!-- Bang LOGCALL DI DONG THEO EXTENSION -->			
											<%
											if(yeucau=="extension"){  
										
											ArrayList<LogCall> listlogcall_ex = BillingDao.getListLogCall_DVEX("B", idextension);
											for (int i = 0; i < listlogcall_ex.size(); i++) {
												%>
												<tr class="gradeA">
													<td><%=i + 1%></td>
													<!-- cot extension-->
													<td><%=listlogcall_ex.get(i).getExtensionID()%></td>
													<td><%=listlogcall_ex.get(i).getThueBaoNhan()%></td>
													<td><%=listlogcall_ex.get(i).getTenPhongBan()%></td>
													<td><%=listlogcall_ex.get(i).getThoiGianGoi()%></td>
													<td><%=listlogcall_ex.get(i).getNgayGoi()%></td>
													<td><%=listlogcall_ex.get(i).getLoaiCuocGoi()%></td>
													<td><%=(double)Math.round((listlogcall_ex.get(i).getGiaTien()*100)/100)%></td>
													<td><%=(double)Math.round(((listlogcall_ex.get(i).getGiaTien()+listlogcall_ex.get(i).getGiaTien()*tilemakeup)*100)/100)%></td>
												</tr>
											<%}
											}%>
											</tbody>
										</table>
									</div>
									</div>

									<!-- /.box-body -->
								</div>
								<div id="menu5" class="tab-pane fade">
									<!--Neu yeu cau gui ve là thong ke theo dich vu NOI HAT -->
								<%
									ArrayList<LogCall> listlogcall_dv2 = BillingDao.getListLogCall_DV("C",idcongty);
								%>
								<div>
									<div class="box-body no-padding">
										<table id="datatable-responsive"
											class="table table-striped table-bordered dt-responsive nowrap"
											cellspacing="0" width="100%">
											<thead>
												<tr>
													<th>Stt</th>
													<th>Thuê bao chủ gọi</th>
													<th>Thuê bao được gọi</th>
													<th>Phòng/ban</th>
													<th>Tổng số giây</th>
													<th>Thời gian</th>
													<th>Loại cuộc gọi</th>
													<th>Cost(Chưa VAT) (VND)</th>
													<th>Cost đã makeup</th>
												</tr>
											</thead>
											<tbody>
												<!-- LIÊN KẾT VỚI DATABASE ĐỂ LẤY DỮ LIỆU TABLE -->
												<%if(yeucau=="tongbill"){
													for (int i = 0; i < listlogcall_dv2.size(); i++) {
												%>
												<tr class="gradeA">
													<td><%=i + 1%></td>
													<!-- cot extension-->
													<td><%=listlogcall_dv2.get(i).getExtensionID()%></td>
													<td><%=listlogcall_dv2.get(i).getThueBaoNhan()%></td>
													<td><%=listlogcall_dv2.get(i).getTenPhongBan()%></td>
													<td><%=listlogcall_dv2.get(i).getThoiGianGoi()%></td>
													<td><%=listlogcall_dv2.get(i).getNgayGoi()%></td>
													<td><%=listlogcall_dv2.get(i).getLoaiCuocGoi()%></td>
													<td><%=(double)Math.round((listlogcall_dv2.get(i).getGiaTien()*100)/100)%></td>
													<td><%=(double)Math.round(((listlogcall_dv2.get(i).getGiaTien()+listlogcall_dv2.get(i).getGiaTien()*tilemakeup)*100)/100)%></td>
												</tr>
												<%
													}
												}
												%>
							<!-- Bang LOGCALL LIEN TINH THEO PHONG BAN -->		
												<%
												if(yeucau=="phongban"){  
												
												ArrayList<LogCall> listexten_pb = BillingDao.getListLogCall_DVPB("C", idphongban);
												for (int i = 0; i < listexten_pb.size(); i++) {
												%>
												<tr class="gradeA">
													<td><%=i + 1%></td>
													<!-- cot extension-->
													<td><%=listexten_pb.get(i).getExtensionID()%></td>
													<td><%=listexten_pb.get(i).getThueBaoNhan()%></td>
													<td><%=listexten_pb.get(i).getTenPhongBan()%></td>
													<td><%=listexten_pb.get(i).getThoiGianGoi()%></td>
													<td><%=listexten_pb.get(i).getNgayGoi()%></td>
													<td><%=listexten_pb.get(i).getLoaiCuocGoi()%></td>
													<td><%=(double)Math.round((listexten_pb.get(i).getGiaTien()*100)/100)%></td>
													<td><%=(double)Math.round(((listexten_pb.get(i).getGiaTien()+listexten_pb.get(i).getGiaTien()*tilemakeup)*100)/100)%></td>
												</tr>
												<%}
												}
												%>
							<!-- Bang LOGCALL LIEN TINH THEO EXTENSION -->			
											<%
											if(yeucau=="extension"){  
											
											ArrayList<LogCall> listlogcall_ex = BillingDao.getListLogCall_DVEX("C", idextension);
											for (int i = 0; i < listlogcall_ex.size(); i++) {
												%>
												<tr class="gradeA">
													<td><%=i + 1%></td>
													<!-- cot extension-->
													<td><%=listlogcall_ex.get(i).getExtensionID()%></td>
													<td><%=listlogcall_ex.get(i).getThueBaoNhan()%></td>
													<td><%=listlogcall_ex.get(i).getTenPhongBan()%></td>
													<td><%=listlogcall_ex.get(i).getThoiGianGoi()%></td>
													<td><%=listlogcall_ex.get(i).getNgayGoi()%></td>
													<td><%=listlogcall_ex.get(i).getLoaiCuocGoi()%></td>
													<td><%=(double)Math.round((listlogcall_ex.get(i).getGiaTien()*100)/100)%></td>
													<td><%=(double)Math.round(((listlogcall_ex.get(i).getGiaTien()+listlogcall_ex.get(i).getGiaTien()*tilemakeup)*100)/100)%></td>
												</tr>
											<%}
											}%>
											</tbody>
										</table>
									</div>
								</div>

								<!-- /.box-body -->
								</div>
								<div id="menu6" class="tab-pane fade">
									<!--Neu yeu cau gui ve là thong ke theo dich vu NOI HAT -->
								<%
									ArrayList<LogCall> listlogcall_dv3 = BillingDao.getListLogCall_DV("D",idcongty);
								%>
								<div>
									<div class="box-body no-padding">
										<table id="datatable-responsive"
											class="table table-striped table-bordered dt-responsive nowrap"
											cellspacing="0" width="100%">
											<thead>
												<tr>
													<th>Stt</th>
													<th>Thuê bao chủ gọi</th>
													<th>Thuê bao được gọi</th>
													<th>Phòng/ban</th>
													<th>Tổng số giây</th>
													<th>Thời gian</th>
													<th>Loại cuộc gọi</th>
													<th>Cost(Chưa VAT) (VND)</th>
													<th>Cost đã makeup</th>
												</tr>
											</thead>
											<tbody>
												<!-- LIÊN KẾT VỚI DATABASE ĐỂ LẤY DỮ LIỆU TABLE -->
												<%if(yeucau=="tongbill"){
													for (int i = 0; i < listlogcall_dv3.size(); i++) {
												%>
												<tr class="gradeA">
													<td><%=i + 1%></td>
													<!-- cot extension-->
													<td><%=listlogcall_dv3.get(i).getExtensionID()%></td>
													<td><%=listlogcall_dv3.get(i).getThueBaoNhan()%></td>
													<td><%=listlogcall_dv3.get(i).getTenPhongBan()%></td>
													<td><%=listlogcall_dv3.get(i).getThoiGianGoi()%></td>
													<td><%=listlogcall_dv3.get(i).getNgayGoi()%></td>
													<td><%=listlogcall_dv3.get(i).getLoaiCuocGoi()%></td>
													<td><%=(double)Math.round((listlogcall_dv3.get(i).getGiaTien()*100)/100)%></td>
													<td><%=(double)Math.round(((listlogcall_dv3.get(i).getGiaTien()+listlogcall_dv3.get(i).getGiaTien()*tilemakeup)*100)/100)%></td>
												</tr>
												<%
													}
												}
												%>
								<!-- Bang LOGCALL QUOC TE THEO PHONG BAN -->		
												<%
												if(yeucau=="phongban"){  
												
												ArrayList<LogCall> listexten_pb = BillingDao.getListLogCall_DVPB("D", idphongban);
												for (int i = 0; i < listexten_pb.size(); i++) {
												%>
												<tr class="gradeA">
													<td><%=i + 1%></td>
													<!-- cot extension-->
													<td><%=listexten_pb.get(i).getExtensionID()%></td>
													<td><%=listexten_pb.get(i).getThueBaoNhan()%></td>
													<td><%=listexten_pb.get(i).getTenPhongBan()%></td>
													<td><%=listexten_pb.get(i).getThoiGianGoi()%></td>
													<td><%=listexten_pb.get(i).getNgayGoi()%></td>
													<td><%=listexten_pb.get(i).getLoaiCuocGoi()%></td>
													<td><%=(double)Math.round((listexten_pb.get(i).getGiaTien()*100)/100)%></td>
													<td><%=(double)Math.round(((listexten_pb.get(i).getGiaTien()+listexten_pb.get(i).getGiaTien()*tilemakeup)*100)/100)%></td>
												</tr>
												<%}
												}
												%>
						<!-- Bang LOGCALL QUOC TE THEO EXTENSION -->			
											<%
											if(yeucau=="extension"){  
											
											ArrayList<LogCall> listlogcall_ex = BillingDao.getListLogCall_DVEX("D", idextension);
											for (int i = 0; i < listlogcall_ex.size(); i++) {
												%>
												<tr class="gradeA">
													<td><%=i + 1%></td>
													<!-- cot extension-->
													<td><%=listlogcall_ex.get(i).getExtensionID()%></td>
													<td><%=listlogcall_ex.get(i).getThueBaoNhan()%></td>
													<td><%=listlogcall_ex.get(i).getTenPhongBan()%></td>
													<td><%=listlogcall_ex.get(i).getThoiGianGoi()%></td>
													<td><%=listlogcall_ex.get(i).getNgayGoi()%></td>
													<td><%=listlogcall_ex.get(i).getLoaiCuocGoi()%></td>
													<td><%=(double)Math.round((listlogcall_ex.get(i).getGiaTien()*100)/100)%></td>
													<td><%=(double)Math.round(((listlogcall_ex.get(i).getGiaTien()+listlogcall_ex.get(i).getGiaTien()*tilemakeup)*100)/100)%></td>
												</tr>
											<%}
											}%>
											</tbody>
										</table>
									</div>
								</div>

								<!-- /.box-body -->
								</div>
								<div id="menu7" class="tab-pane fade">
									<!--Neu yeu cau gui ve là thong ke theo dich vu NOI HAT -->
								<%
									ArrayList<LogCall> listlogcall_dv4 = BillingDao.getListLogCall_DV("E",idcongty);
								%>
								<div>
									<div class="box-body no-padding">
										<table id="datatable-responsive"
											class="table table-striped table-bordered dt-responsive nowrap"
											cellspacing="0" width="100%">
											<thead>
												<tr>
													<th>Stt</th>
													<th>Thuê bao chủ gọi</th>
													<th>Thuê bao được gọi</th>
													<th>Phòng/ban</th>
													<th>Tổng số giây</th>
													<th>Thời gian</th>
													<th>Loại cuộc gọi</th>
													<th>Cost(Chưa VAT) (VND)</th>
													<th>Cost đã makeup</th>
												</tr>
											</thead>
											<tbody>
												<!-- LIÊN KẾT VỚI DATABASE ĐỂ LẤY DỮ LIỆU TABLE -->
												<%if(yeucau=="tongbill"){
													for (int i = 0; i < listlogcall_dv4.size(); i++) {
												%>
												<tr class="gradeA">
													<td><%=i + 1%></td>
													<!-- cot extension-->
													<td><%=listlogcall_dv4.get(i).getExtensionID()%></td>
													<td><%=listlogcall_dv4.get(i).getThueBaoNhan()%></td>
													<td><%=listlogcall_dv4.get(i).getTenPhongBan()%></td>
													<td><%=listlogcall_dv4.get(i).getThoiGianGoi()%></td>
													<td><%=listlogcall_dv4.get(i).getNgayGoi()%></td>
													<td><%=listlogcall_dv4.get(i).getLoaiCuocGoi()%></td>
													<td><%=(double)Math.round((listlogcall_dv4.get(i).getGiaTien()*100)/100)%></td>
													<td><%=(double)Math.round(((listlogcall_dv4.get(i).getGiaTien()+listlogcall_dv4.get(i).getGiaTien()*tilemakeup)*100)/100)%></td>
												</tr>
												<%
													}
												}
												%>
									<!-- Bang LOGCALL DICH VU THEO PHONG BAN -->		
												<%
												if(yeucau=="phongban"){  
												
												ArrayList<LogCall> listexten_pb = BillingDao.getListLogCall_DVPB("E", idphongban);
												for (int i = 0; i < listexten_pb.size(); i++) {
												%>
												<tr class="gradeA">
													<td><%=i + 1%></td>
													<!-- cot extension-->
													<td><%=listexten_pb.get(i).getExtensionID()%></td>
													<td><%=listexten_pb.get(i).getThueBaoNhan()%></td>
													<td><%=listexten_pb.get(i).getTenPhongBan()%></td>
													<td><%=listexten_pb.get(i).getThoiGianGoi()%></td>
													<td><%=listexten_pb.get(i).getNgayGoi()%></td>
													<td><%=listexten_pb.get(i).getLoaiCuocGoi()%></td>
													<td><%=(double)Math.round((listexten_pb.get(i).getGiaTien()*100)/100)%></td>
													<td><%=(double)Math.round(((listexten_pb.get(i).getGiaTien()+listexten_pb.get(i).getGiaTien()*tilemakeup)*100)/100)%></td>
												</tr>
												<%}
												}
												%>
							<!-- Bang LOGCALL DICH VU EXTENSION -->			
											<%
											if(yeucau=="extension"){  
											
											ArrayList<LogCall> listlogcall_ex = BillingDao.getListLogCall_DVEX("E", idextension);
											for (int i = 0; i < listlogcall_ex.size(); i++) {
												%>
												<tr class="gradeA">
													<td><%=i + 1%></td>
													<!-- cot extension-->
													<td><%=listlogcall_ex.get(i).getExtensionID()%></td>
													<td><%=listlogcall_ex.get(i).getThueBaoNhan()%></td>
													<td><%=listlogcall_ex.get(i).getTenPhongBan()%></td>
													<td><%=listlogcall_ex.get(i).getThoiGianGoi()%></td>
													<td><%=listlogcall_ex.get(i).getNgayGoi()%></td>
													<td><%=listlogcall_ex.get(i).getLoaiCuocGoi()%></td>
													<td><%=(double)Math.round((listlogcall_ex.get(i).getGiaTien()*100)/100)%></td>
													<td><%=(double)Math.round(((listlogcall_ex.get(i).getGiaTien()+listlogcall_ex.get(i).getGiaTien()*tilemakeup)*100)/100)%></td>
												</tr>
											<%}
											}%>
											</tbody>
										</table>
									</div>
								</div>

								<!-- /.box-body -->
								</div>
							</div>
							<!-- /.box-body -->	
									<div class="box-footer clearfix">
										<ul class="pagination pagination-sm no-margin pull-right">
											<li><a href="#">«</a></li>
											<li><a href="#">1</a></li>
											<li><a href="#">2</a></li>
											<li><a href="#">3</a></li>
											<li><a href="#">»</a></li>
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
						});
	</script>
</body>
</html>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
