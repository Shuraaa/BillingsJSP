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
<body>
	<%
		String exportToExcel = (String) request.getAttribute("exportToExcel");
		if (exportToExcel != null && exportToExcel.toString().equalsIgnoreCase("YES")) {
			response.setContentType("application/vnd.ms-excel");
			response.setHeader("Content-Disposition", "inline; filename=" + "excel.xls");
		}
		String idcongty = (String) request.getAttribute("congtyid");
		double tilemakeup = CongTyDao.getTiLeMakeUp(idcongty);
		String tencongty = (String) request.getAttribute("tencongty");
		String thangnam = (String) request.getAttribute("thangnam");
	%>
	<!-- Menu 3 -->
	<h3>
		Bảng cước điện thoại chi tiết công ty
		<%=tencongty%>
		tháng
		<%=thangnam%></h3>

	<%
		if (exportToExcel == null) {
	%>
	<button type="button">
		<a
			href="<%=request.getContextPath()%>/ManagerBilling?command=exportPDFdetail&congtyid=<%=idcongty%>&tencongty=<%=tencongty%>&thangnam=<%=thangnam%>&exportToExcel=YES"></a>Export
		to Excel
	</button>
	<%
		}
	%>
	<br>

	<h4>Cước nội hạt</h4>

	<div id="menu3" class="tab-pane fade">
		<!--Neu yeu cau gui ve là thong ke theo dich vu NOI HAT -->
		<%
			ArrayList<LogCall> listlogcall_dv = BillingDao.getListLogCall_DV("A", idcongty, thangnam);
		%>
		<div>
			<div class="box-body no-padding">
				<table align="left" border="2" id="datatable-responsive"
					class="display table table-striped table-bordered dt-responsive"
					cellspacing="0" width="100%">
					<thead>
						<tr bgcolor="lightblue">
							<th>#</th>
							<th>Thuê bao chủ gọi</th>
							<th>Thuê bao được gọi</th>
							<th>Phòng/ban</th>
							<th>Tổng số giây</th>
							<th>Thời gian bắt đầu</th>
							<th>Thời gian kết thúc</th>
							<th>Cost</th>
						</tr>
					</thead>
					<tbody>

						<!-- LIÊN KẾT VỚI DATABASE ĐỂ LẤY DỮ LIỆU TABLE -->
						<%
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
							<td><%=(double) Math.round(
						((listlogcall_dv.get(i).getGiaTien() + listlogcall_dv.get(i).getGiaTien() * tilemakeup) * 100)
								/ 100)%></td>
						</tr>
						<%
							}
						%>
					</tbody>
				</table>
			</div>
		</div>

		<!-- Menu 4 -->
	</div>
	<br>
	<h4>Cước di động</h4>
	<div id="menu4" class="tab-pane fade">
		<!--Neu yeu cau gui ve là thong ke theo dich vu DI DONG -->
		<%
			ArrayList<LogCall> listlogcall_dv1 = BillingDao.getListLogCall_DV("B", idcongty, thangnam);
		%>
		<div>
			<div class="box-body no-padding">
				<table align="left" border="2" id="datatable-responsive"
					class="display table table-striped table-bordered dt-responsive"
					cellspacing="0" width="100%">
					<thead>
						<tr bgcolor="lightblue">
							<th>#</th>
							<th>Thuê bao chủ gọi</th>
							<th>Thuê bao được gọi</th>
							<th>Phòng/ban</th>
							<th>Tổng số giây</th>
							<th>Thời gian bắt đầu</th>
							<th>Thời gian kết thúc</th>
							<th>Cost</th>
						</tr>
					</thead>
					<tbody>
						<!-- LIÊN KẾT VỚI DATABASE ĐỂ LẤY DỮ LIỆU TABLE -->
						<%
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
							<td><%=(double) Math.round(
						((listlogcall_dv1.get(i).getGiaTien() + listlogcall_dv1.get(i).getGiaTien() * tilemakeup) * 100)
								/ 100)%></td>
						</tr>
						<%
							}
						%>

					</tbody>
				</table>
			</div>
		</div>
	</div>
	<br>
	<!-- Menu 5 -->
	<h4>Cước liên tỉnh</h4>
	<div id="menu5" class="tab-pane fade">
		<!--Neu yeu cau gui ve là thong ke theo dich vu NOI HAT -->
		<%
			ArrayList<LogCall> listlogcall_dv2 = BillingDao.getListLogCall_DV("C", idcongty, thangnam);
		%>
		<div>
			<div class="box-body no-padding">
				<table align="left" border="2" id="datatable-responsive"
					class="display table table-striped table-bordered dt-responsive"
					cellspacing="0" width="100%">
					<thead>
						<tr bgcolor="lightblue">
							<th>#</th>
							<th>Thuê bao chủ gọi</th>
							<th>Thuê bao được gọi</th>
							<th>Phòng/ban</th>
							<th>Tổng số giây</th>
							<th>Thời gian bắt đầu</th>
							<th>Thời gian kết thúc</th>
							<th>Cost</th>
						</tr>
					</thead>
					<tbody>
						<!-- LIÊN KẾT VỚI DATABASE ĐỂ LẤY DỮ LIỆU TABLE -->
						<%
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
							<td><%=(double) Math.round(
						((listlogcall_dv2.get(i).getGiaTien() + listlogcall_dv2.get(i).getGiaTien() * tilemakeup) * 100)
								/ 100)%></td>
						</tr>
						<%
							}
						%>

					</tbody>
				</table>
			</div>
		</div>
	</div>
	<br>
	<!-- Menu 6 -->
	<h4>cước quốc tế</h4>
	<div id="menu6" class="tab-pane fade">
		<%
			ArrayList<LogCall> listlogcall_dv3 = BillingDao.getListLogCall_DV("D", idcongty, thangnam);
		%>
		<div>
			<div class="box-body no-padding">
				<table align="left" border="2" id="datatable-responsive"
					class="display table table-striped table-bordered dt-responsive"
					cellspacing="0" width="100%">
					<thead>
						<tr bgcolor="lightblue">
							<th>#</th>
							<th>Thuê bao chủ gọi</th>
							<th>Thuê bao được gọi</th>
							<th>Phòng/ban</th>
							<th>Tổng số giây</th>
							<th>Thời gian bắt đầu</th>
							<th>Thời gian kết thúc</th>
							<th>Cost</th>
						</tr>
					</thead>
					<tbody>
						<!-- LIÊN KẾT VỚI DATABASE ĐỂ LẤY DỮ LIỆU TABLE -->
						<%
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
							<td><%=(double) Math.round(
						((listlogcall_dv3.get(i).getGiaTien() + listlogcall_dv3.get(i).getGiaTien() * tilemakeup) * 100)
								/ 100)%></td>
						</tr>
						<%
							}
						%>

					</tbody>
				</table>
			</div>
		</div>

	</div>
	<br>
	<h4>Cước dịch vụ</h4>
	<div id="menu7" class="tab-pane fade">
		<%
			ArrayList<LogCall> listlogcall_dv4 = BillingDao.getListLogCall_DV("E", idcongty, thangnam);
		%>
		<div>
			<div class="box-body no-padding">
				<table align="left" border="2" id="datatable-responsive"
					class="display table table-striped table-bordered dt-responsive"
					cellspacing="0" width="100%">
					<thead>
						<tr bgcolor="lightblue">
							<th>#</th>
							<th>Thuê bao chủ gọi</th>
							<th>Thuê bao được gọi</th>
							<th>Phòng/ban</th>
							<th>Tổng số giây</th>
							<th>Thời gian bắt đầu</th>
							<th>Thời gian kết thúc</th>
							<th>Cost</th>
						</tr>
					</thead>
					<tbody>
						<!-- LIÊN KẾT VỚI DATABASE ĐỂ LẤY DỮ LIỆU TABLE -->
						<%
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
							<td><%=(double) Math.round(
						((listlogcall_dv4.get(i).getGiaTien() + listlogcall_dv4.get(i).getGiaTien() * tilemakeup) * 100)
								/ 100)%></td>
						</tr>
						<%
							}
						%>

					</tbody>
				</table>
			</div>
		</div>
		<!-- /.box-body -->
	</div>
	<!-- /.box -->
	<br>
	<br>
	<%
		if (exportToExcel == null) {
	%>
	<button type="button">
		<a
			href="<%=request.getContextPath()%>/ManagerBilling?command=exportPDFdetail&congtyid=<%=idcongty%>&tencongty=<%=tencongty%>&thangnam=<%=thangnam%>&exportToExcel=YES"></a>Export
		to Excel
	</button>
	<%
		}
	%>
</body>
</html>