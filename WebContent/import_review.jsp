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
		String importdate = (String) request.getAttribute("importdate");
	%>
	<!-- Menu -->
	<h3>Bảng cước điện thoại đã nhập</h3>

	<div id="menu" class="tab-pane fade">

		<%
			ArrayList<LogCall> listlogcall_importdate = BillingDao.getListLogCall_ImportDate(importdate);
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
							<th>Tổng số giây</th>
							<th>Thời gian bắt đầu</th>
							<th>Thời gian kết thúc</th>
						</tr>
					</thead>
					<tbody>

						<!-- LIÊN KẾT VỚI DATABASE ĐỂ LẤY DỮ LIỆU TABLE -->
						<%
							for (int i = 0; i < listlogcall_importdate.size(); i++) {
						%>
						<tr class="gradeA">
							<td><%=i + 1%></td>
							<!-- cot extension-->
							<td><%=listlogcall_importdate.get(i).getExtensionID()%></td>
							<td><%=listlogcall_importdate.get(i).getThueBaoNhan()%></td>
							<td><%=listlogcall_importdate.get(i).getThoiGianGoi()%></td>
							<td><%=listlogcall_importdate.get(i).getThoiGianBatDau()%></td>
							<td><%=listlogcall_importdate.get(i).getThoiGianKetThuc()%></td>
						</tr>
						<%
							}
						%>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<!-- /.Menu -->
</body>
</html>