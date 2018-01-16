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
<title>Company Management</title>
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
			<h1>Quản lí công ti</h1>
			<ol class="breadcrumb">
				<li><a href="<%=request.getContextPath()%>/index.jsp"><i
						class="fa fa-dashboard"></i> BillingsSystem</a></li>
				<li><a href="#">Quản trị hệ thống</a></li>
				<li class="active">Quản lí công ti</li>
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
								<a href="admin_company-add.jsp"
									class="btn btn-primary btn-block"> <i
									class="ion-ios-home-outline"></i> Thêm công ti
								</a>
							</div>
						</div>
						<!-- /.box-header -->

						<div class="box-body no-padding">
							<table id="datatable-responsive"
								class="display table table-striped table-bordered dt-responsive"
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
								<tbody>
									<!-- LIÊN KẾT VỚI DATABASE ĐỂ LẤY DỮ LIỆU TABLE -->
									<!-- phân trang -->
									<%
										ArrayList<CongTy> listCongTy = CongTyDao.getListCongTy();
											for (int i = 0; i < listCongTy.size(); i++) {
									%>
									<tr class="gradeA">
										<td><%=i + 1%></td>
										<td><%=listCongTy.get(i).getTenCongTy()%></td>
										<td><%=listCongTy.get(i).getDiaChi()%></td>
										<td><%=listCongTy.get(i).getMaSoThue()%></td>
										<td><%=listCongTy.get(i).getEmail()%></td>
										<td><%=listCongTy.get(i).getDienThoai()%></td>
										<td><%=listCongTy.get(i).getTiLeMakeUp()*100%></td>
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

	<!-- REQUIRED JS SCRIPTS -->
	<script type="text/javascript" src="js/jquery-ui.js"></script>
	<script>
		function clickBt(text) {
			if (confirm("Bạn có chắc chắn muốn xóa?") == true) {
				$(".linkDelete").attr("href",
						"ManagerCongTy?command=delete&congtyid=" + text);
			}
		}
	</script>
</body>
</body>
</html>
