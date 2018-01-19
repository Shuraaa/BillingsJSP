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
		if (exportToExcel != null
				&& exportToExcel.toString().equalsIgnoreCase("YES")) {
			response.setContentType("application/vnd.ms-excel");
			response.setHeader("Content-Disposition", "inline; filename="
					+ "excel.xls");

		}
		String idcongty = (String) request.getAttribute("congtyid");
		double tilemakeup = CongTyDao.getTiLeMakeUp(idcongty);
		String tencongty = (String) request.getAttribute("tencongty");
		String thangnam = (String) request.getAttribute("thangnam");
	%>
	<div class="row">
	<div class="col-sm-6">
	<img class="img-responsive img-thumbnail"src="ManagerDisplayImg?congtyid=<%=idcongty%>"width="40px" height="40px">
	</div>
	<div class="col-sm-6">
	<p>Đơn vị nhận tiền: Công ty <%=tencongty %><p> <br>
                          <%=tencongty %> CO, Ltd. <br>
	Tài khoản VND: 102203129 <br>
	Tài khoản USD: 102203189 <br>
	Swift Code: <br>
	Ngân HàngThương Mại Á Châu (ACB), chi nhánh Mạc Đỉnh Chi, Tp HCM <br>
	Bank: Asia Commercial Bank (ACB), Mac Dinh Chi Branch, HCMC <br>
	</div>
	</div>
	<h3>THÔNG BÁO CƯỚC VIỄN THÔNG	</h3><br>
	(Telecom Cost Announcement)	<br>		
	From 01-05-2016 To 31-05-2016<br>			
	Khách hàng/Customer:		Công ty <%=tencongty %>	<br>
	Địa chỉ/Add:			<br>
	Mã khách hàng/Cus ID:			<br>
	Số thuê bao/Number:		84285105  | 84285106 | 84285107	<br>
	
	
	<table align="left" border="2" id="datatable-responsive"
		class="display table table-striped table-bordered dt-responsive"
		cellspacing="0" width="100%">
		<thead>
			<tr bgcolor="lightgreen">
				<th>#</th>
				<th>Dịch vụ/Service</th>
				<th>Cước/Cost</th>
			</tr>
		</thead>
		<tbody>
			<!-- Bang tinh gia cuoc dien thoai -->
			<%
			
				// tinh cho cong ty
				double noihat = BillingDao.tinhtongtien("A", idcongty, thangnam);
				double tiennoihat = (double) Math.round(noihat * 100) / 100;
				double tiennoihatma = (double) Math
						.round((tiennoihat * (1 + tilemakeup)) * 100) / 100;

				double lientinh = BillingDao.tinhtongtien("C", idcongty, thangnam);
				double tienlientinh = (double) Math.round(lientinh * 100) / 100;
				double tienlientinhma = (double) Math
						.round((tienlientinh * (1 + tilemakeup)) * 100) / 100;

				double didong = BillingDao.tinhtongtien("B", idcongty, thangnam);
				double tiendidong = (double) Math.round(didong * 100) / 100;
				double tiendidongma = (double) Math
						.round((tiendidong * (1 + tilemakeup)) * 100) / 100;

				double quocte = BillingDao.tinhtongtien("D", idcongty, thangnam);
				double tienquocte = (double) Math.round(quocte * 100) / 100;
				double tienquoctema = (double) Math
						.round((tienquocte * (1 + tilemakeup)) * 100) / 100;

				double dichvu = BillingDao.tinhtongtien("E", idcongty, thangnam);
				double tiendichvu = (double) Math.round(dichvu * 100) / 100;
				double tiendichvuma = (double) Math
						.round((tiendichvu * (1 + tilemakeup)) * 100) / 100;

				double tongcuocp = 20000 + tiennoihatma + tienlientinhma
						+ tiendidongma + tienquoctema + tiendichvuma;
				double tongcuoc7 = (double) Math.round(tongcuocp * 100) / 100;
				double phiphucvu8 = (double) Math
						.round((tongcuoc7 * 5 / 100) * 100) / 100;
				;
				double tongcongcuoc9 = (double) Math
						.round((tongcuoc7 + phiphucvu8) * 100) / 100;
				double thueVAT = (double) Math
						.round((tongcongcuoc9 * 10 / 100) * 100) / 100;
				double tongthanhtoan = (double) Math
						.round((tongcongcuoc9 + thueVAT) * 100) / 100;

			%>
			<!-- Bang tinh gia cuoc TONG BILL CONG TY -->
			<tr class="gradeA" bgcolor="lightblue">
				<td><%=1%></td>
				<td>Cước thuê bao tháng / Monthly Cost</td>
				<td><%=20000%></td>
			</tr>
			<tr class="gradeA" bgcolor="lightblue">
				<td><%=2%></td>
				<td>Cước nội hạt / Local Cost</td>
				<td><%=tiennoihatma%></td>
			</tr>
			<tr class="gradeA" bgcolor="lightblue">
				<td><%=3%></td>
				<td>Cước liên tỉnh /Province Cost</td>
				<td><%=tienlientinhma%></td>
			</tr>
			<tr class="gradeA" bgcolor="lightblue">
				<td><%=4%></td>
				<td>Cước di động / Mobile Cost</td>
				<td><%=tiendidongma%></td>
			</tr>
			<tr class="gradeA" bgcolor="lightblue">
				<td><%=5%></td>
				<td>Cước quốc tế / International Cost</td>
				<td><%=tienquoctema%></td>
			</tr>
			<tr class="gradeA" bgcolor="lightblue">
				<td><%=6%></td>
				<td>Cước dịch vụ đặc biệt / Special Service Cost</td>
				<td><%=tiendichvuma%></td>
			</tr>
			<tr class="gradeA" bgcolor="lightblue">
				<td><%=7%></td>
				<td>Tổng cộng cước sử dụng / Total Dialling Cost (1+2+3+4+5+6)</td>
				<td><%=tongcuoc7%></td>
			</tr>
			<tr class="gradeA" bgcolor="lightblue">
				<td><%=8%></td>
				<td>Phí phục vụ / Service Fee(5%)</td>
				<td><%=phiphucvu8%></td>
			</tr>
			<tr class="gradeA" bgcolor="lightblue">
				<td><%=9%></td>
				<td>Tổng cộng cước phí chưa bao gồm thuế / Total Cost exclude
					Tax (7+8)</td>
				<td><%=tongcongcuoc9%></td>
			</tr>
			<tr class="gradeA" bgcolor="lightblue">
				<td><%=10%></td>
				<td>Thuế VAT / Tax (10%)</td>
				<td><%=thueVAT%></td>
			</tr>
			<tr class="gradeA" bgcolor="lightblue">
				<td><%=11%></td>
				<td>Tổng cộng tiền thanh toán / Total Payment (9+10)</td>
				<td><%=tongthanhtoan%></td>
			</tr>
		</tbody>

	</table>
	
	Bằng chữ:	<br>	 		
	By words	<br>			
					
	Công ty Soho chân thành cảm ơn quí khách đã sử dụng các dịch vụ của chúng tôi.Quý khách lưu ý, kể từ ngày nhận được 	<br>			
	giấy báo này, xin quý khách vui lòng thanh toán cho chúng tôi trong thời gian 03 ngày. Mọi thắc mắc của quý khách, xin liên hệ		<br>		
	qua số điện thoại: 08. 6257 0000 / (08). 6258 0000  | (08) 73007997 EXT:100				<br>
	Soho company thank you for using our service. Please pay attention, the payment is within 03 days  when customer receive	<br>			
	this announcement. If customer has any wonders, please contact us with telephone number : 08. 6257 0000 /08. 6258 0000 / 08. 73007997 EXT:100		<br>		
					
					
					
					
	P.1505 Indochina Park Tower - 04 Nguyen Dinh Chieu Street - District 1 - HCM City			<br>	
	Tel: (08). 6257 0000/(08). 6258 0000 - Fax: (08). 6256 0000 - Web: http://www.sohovina.com				<br>
	
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<%
		if (exportToExcel == null) {
	%>
	<a href="<%=request.getContextPath()%>/ManagerBilling?command=exportPDF&congtyid=<%=idcongty%>&tencongty=<%=tencongty%>&thangnam=<%=thangnam%>&exportToExcel=YES">Export to Excel</a>
	<%
		}
	%>
</body>
</html>