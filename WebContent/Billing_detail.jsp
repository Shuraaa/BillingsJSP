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
			<%String idcongty = (String) request.getAttribute("congtyid"); 
			String tencongty = (String) request.getAttribute("tencongty"); 
			  String yeucau = (String) request.getAttribute("yeucau");
			ArrayList<PhongBan> listPhongBan = PhongBanDao.getListPBCongTy(idcongty);
			ArrayList<Extension> listExtensions = ExtensionDao.getListEXCongTy(idcongty);
			ArrayList<LogCall> listBilling = BillingDao.getListLogCall_CT(idcongty);
			 %>
			<section class="content-header">
			<h1>Billings <%=tencongty %></h1>
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

						<form action="<%=request.getContextPath()%>/ManagerBilling" class="form-horizontal">
							<div class="box-body">
								<div class="row">
									<div class="col-sm-8">
										<select class="form-control" name="phongban">
											<option selected="">Phòng/Ban</option>
											<!-- LẤY DANH SÁCH GROUP TỪ DATABASE -->
											<%for (int i = 0; i < listPhongBan.size(); i++) { %>
											<option value="<%=listPhongBan.get(i).getPhongBanID()%>"><%=listPhongBan.get(i).getTenPhongBan()%></option>
											<%} %>
										</select>
									</div>
									<div class="col-sm-3">
									<input type="hidden" name="congtyid" value="<%=idcongty%>"></input>
									<input type="hidden" name="tencongty" value="<%=tencongty%>"></input>
									<input type="hidden" name="command" value="filter_phongban"></input>
									<button type="submit" class="btn btn-primary glyphicon glyphicon-search">
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

						<form action="<%=request.getContextPath()%>/ManagerBilling" class="form-horizontal">
							<div class="box-body">
								<div class="row">
									<div class="col-sm-8">
										<select class="form-control" name="extension">
											<option selected="">Extension</option>

											<!-- LẤY DANH SÁCH GROUP TỪ DATABASE -->
											<%for (int i = 0; i < listExtensions.size(); i++) { %>
											<option value="<%=listExtensions.get(i).getExtensionID()%>"><%=listExtensions.get(i).getExtensionID()%></option>
											<%} %>

										</select>
									</div>
									<div class="col-sm-3">
									<input type="hidden" name="congtyid" value="<%=idcongty%>"></input>
									<input type="hidden" name="tencongty" value="<%=tencongty%>"></input>
									<input type="hidden" name="command" value="filter_extension"></input>
									<button type="submit" class="btn btn-primary glyphicon glyphicon-search">
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

						<form action="<%=request.getContextPath()%>/ManagerBilling" class="form-horizontal">
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
									<button type="submit" class="btn btn-primary glyphicon glyphicon-search">
										</button>
									</div>
								</div>
							</div>
						</form>

					</div>
				</div>
				<% %>
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
							<h3 class="box-title">Danh sách</h3>
							<ul class="pagination pagination-sm no-margin pull-right">
								<li><a href="#">«</a></li>
								<li><a href="#">1</a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">»</a></li>
							</ul>
						</div>
						<!-- /.box-header -->
						<% if(yeucau=="tongbill"){ %>
						<div class="box-body no-padding">
						 <table class="table table-bordered" cellspacing="0" width="100%">
								<thead>
									<tr>
										<th>stt</th>
										<th>Dịch vụ/Service</th>
										<th>Cước/Cost</th>
									</tr>
								</thead>
								<tbody>
									<!-- Bang tinh gia cuoc dien thoai -->
									<% double tiennoihat = BillingDao.tinhtongtien("A",idcongty); 
									double tienlientinh = BillingDao.tinhtongtien("C",idcongty); 
									double tiendidong = BillingDao.tinhtongtien("B",idcongty); 
									double tienquocte = BillingDao.tinhtongtien("D",idcongty); 
									double tiendichvu = BillingDao.tinhtongtien("E",idcongty);
									double tongcuoc7 = 20000+ tiennoihat + tienlientinh + tiendidong + tienquocte + tiendichvu;
									double phiphucvu8 = tongcuoc7 *5/100;
									double tongcongcuoc9 = tongcuoc7+phiphucvu8;
									double thueVAT = tongcongcuoc9 *10/100;
									double tongthanhtoan = tongcongcuoc9+thueVAT;
									%>
									<tr class="gradeA">
										<td><%=1%></td>
										<td>Cước thuê bao tháng / Monthly Cost</td>
										<td><%=20000%></td>
									</tr>
									<tr class="gradeA">
										<td><%=2%></td>
										<td>Cước nội hạt / Local Cost</td>
										<td><%=tiennoihat%></td>
									</tr>
									<tr class="gradeA">
										<td><%=3%></td>
										<td>Cước liên tỉnh /Province Cost</td>
										<td><%=tienlientinh%></td>
									</tr>
									<tr class="gradeA">
										<td><%=4%></td>
										<td>Cước di động / Mobile Cost</td>
										<td><%=tiendidong%></td>
									</tr>
									<tr class="gradeA">
										<td><%=5%></td>
										<td>Cước quốc tế / International Cost</td>
										<td><%=tienquocte%></td>
									</tr>
									<tr class="gradeA">
										<td><%=6%></td>
										<td>Cước dịch vụ đặc biệt / Special Service Cost</td>
										<td><%=tiendichvu%></td>
									</tr>
									<tr class="gradeA">
										<td><%=7%></td>
										<td>Tổng cộng cước sử dụng / Total Dialling Cost (1+2+3+4+5+6)</td>
										<td><%=tongcuoc7%></td>
									</tr>
									<tr class="gradeA">
										<td><%=8%></td>
										<td>Phí phục vụ / Service Fee(5%)</td>
										<td><%=phiphucvu8%></td>
									</tr>
									<tr class="gradeA">
										<td><%=9%></td>
										<td>Tổng cộng cước phí chưa bao gồm thuế / Total Cost exclude Tax (7+8)</td>
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


								</tbody>
							</table>
						</div>

						<%} %>
						<!-- /.box-body -->
						<!-- /.box-header -->
						<!--Neu yeu cau gui ve là thong ke theo phong ban  -->
						<%if(yeucau=="phongban"){  
						String idphongban = (String) request.getAttribute("phongbanid");
						ArrayList<LogCall> listexten_pb = BillingDao.getListLogCall_PB(idphongban);
						%>
						<div>
						<form action="<%=request.getContextPath()%>/ManagerBilling" class="form-horizontal">
						<input type="hidden" name="congtyid" value="<%=idcongty%>"></input>
						<input type="hidden" name="tencongty" value="<%=tencongty%>"></input>
						<input type="hidden" name="command" value="detail"></input>
						<button type="submit" class="btn btn-primary glyphicon glyphicon-list"> Tổng hóa đơn
						</button>
						</form>
						</div>
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
										<th>Thời gian  </th>
										<th>Loại cuộc gọi</th>
										<th>Cost(Chưa VAT) (VND)</th>
									</tr>
								</thead>
								<tbody>
									<!-- LIÊN KẾT VỚI DATABASE ĐỂ LẤY DỮ LIỆU TABLE -->
									<%for (int i = 0; i < listexten_pb.size(); i++) { %>
									<tr class="gradeA">
										<td><%=i + 1%></td>
										<!-- cot extension-->
										<td><%=listexten_pb.get(i).getExtensionID()%></td>
										<td><%=listexten_pb.get(i).getThueBaoNhan()%></td>
										<td><%=listexten_pb.get(i).getTenPhongBan()%></td>
										<td><%=listexten_pb.get(i).getThoiGianGoi()%></td>
										<td><%=listexten_pb.get(i).getNgayGoi()%></td>
										<td><%=listexten_pb.get(i).getLoaiCuocGoi()%></td>
										<td><%=listexten_pb.get(i).getGiaTien()%></td>
									</tr>
									<%} %>
								</tbody>
							</table>
						</div>
						<%} %>
					
						<!-- /.box-body -->
						<!--Neu yeu cau gui ve là thong ke theo extension  -->
						<%if(yeucau=="extension"){  
						String idextension = (String) request.getAttribute("extensionid");
						ArrayList<LogCall> listlogcall_ex = BillingDao.getListLogCall_EX(idextension);
						%>
						<div>
						<form action="<%=request.getContextPath()%>/ManagerBilling" class="form-horizontal">
						<input type="hidden" name="congtyid" value="<%=idcongty%>"></input>
						<input type="hidden" name="tencongty" value="<%=tencongty%>"></input>
						<input type="hidden" name="command" value="detail"></input>
						<button type="submit" class="btn btn-primary glyphicon glyphicon-list"> Tổng hóa đơn
						</button>
						</form>
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
										<th>Thời gian </th>
										<th>Loại cuộc gọi</th>
										<th>Cost(Chưa VAT) (VND)</th>
									</tr>
								</thead>
								<tbody>
									<!-- LIÊN KẾT VỚI DATABASE ĐỂ LẤY DỮ LIỆU TABLE -->
									<%for (int i = 0; i < listlogcall_ex.size(); i++) { %>
									<tr class="gradeA">
										<td><%=i + 1%></td>
										<!-- cot extension-->
										<td><%=listlogcall_ex.get(i).getExtensionID()%></td>
										<td><%=listlogcall_ex.get(i).getThueBaoNhan()%></td>
										<td><%=listlogcall_ex.get(i).getTenPhongBan()%></td>
										<td><%=listlogcall_ex.get(i).getThoiGianGoi()%></td>
										<td><%=listlogcall_ex.get(i).getNgayGoi()%></td>
										<td><%=listlogcall_ex.get(i).getLoaiCuocGoi()%></td>
										<td><%=listlogcall_ex.get(i).getGiaTien()%></td>
									</tr>
									<%} %>
								</tbody>
							</table>
						</div>
						<%} %>
						<!--Neu yeu cau gui ve là thong ke theo dich vu  -->
						<%if(yeucau=="dichvu"){  
						String dichvu = (String) request.getAttribute("dichvu");
						ArrayList<LogCall> listlogcall_dv = BillingDao.getListLogCall_DV(dichvu);
						
						%>
						<div>
						<form action="<%=request.getContextPath()%>/ManagerBilling" class="form-horizontal">
						<input type="hidden" name="congtyid" value="<%=idcongty%>"></input>
						<input type="hidden" name="tencongty" value="<%=tencongty%>"></input>
						<input type="hidden" name="command" value="detail"></input>
						<button type="submit" class="btn btn-primary glyphicon glyphicon-list"> Tổng hóa đơn
						</button>
						</form>
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
										<th>Thời gian  </th>
										<th>Loại cuộc gọi</th>
										<th>Cost(Chưa VAT) (VND)</th>
									</tr>
								</thead>
								<tbody>
									<!-- LIÊN KẾT VỚI DATABASE ĐỂ LẤY DỮ LIỆU TABLE -->
									<%for (int i = 0; i < listlogcall_dv.size(); i++) { %>
									<tr class="gradeA">
										<td><%=i + 1%></td>
										<!-- cot extension-->
										<td><%=listlogcall_dv.get(i).getExtensionID()%></td>
										<td><%=listlogcall_dv.get(i).getThueBaoNhan()%></td>
										<td><%=listlogcall_dv.get(i).getTenPhongBan()%></td>
										<td><%=listlogcall_dv.get(i).getThoiGianGoi()%></td>
										<td><%=listlogcall_dv.get(i).getNgayGoi()%></td>
										<td><%=listlogcall_dv.get(i).getLoaiCuocGoi()%></td>
										<td><%=listlogcall_dv.get(i).getGiaTien()%></td>
									</tr>
									<%} %>
								</tbody>
							</table>
						</div>
						<%} %>
					
						<!-- /.box-body -->
					
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