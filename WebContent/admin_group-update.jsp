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
<title>Group update</title>
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

		<!-- Wrapper Contents -->
		<div class="content-wrapper">

			<!-- Content Header (Page header) -->
			<section class="content-header">
			<h1>Cập nhật thông tin</h1>
			<ol class="breadcrumb">
				<li><a href="index.jsp"><i class="fa fa-dashboard"></i>
						BillingsSystem</a></li>
				<li><a href="#">Quản trị hệ thống</a></li>
				<li><a href="admin_group.jsp">Quản lí phòng/ban</a></li>
				<li class="active">Cập nhật thông tin</li>
			</ol>
			</section>

			<!-- Main content -->
			<section class="content">
			<div class="row">
				<div class="col-sm-12">
					<!-- Cập nhật thông tin -->
					<div class="box box-primary">
						<div class="box-header with-border">
							<h3 class="box-title">
								<i class="fa fa-pencil-square"></i> Thông tin phòng/ban
							</h3>
						</div>

						<form action="<%=request.getContextPath()%>/ManagerPhongBan"
							method="post" role="form" class="form-horizontal">
							<div class="box-body">

								<!-- Form group -->
								<div class="form-group">
									<label for="input_tenGroup" class="col-sm-2 control-label">Tên
										phòng/ban: </label>
									<div class="col-sm-4">
										<input type="text" class="form-control" name="txt_tenGroup"
											placeholder="Group name">
									</div>
								</div>
								<!-- Form group -->
								<div class="form-group">
									<label for="inputCompany" class="col-sm-2 control-label">Tên
										công ti: </label>
									<div class="col-sm-4">
										<select class="form-control" name="congty">
											<!-- hien thi cobobox danh sach cong ty -->
											<%
												ArrayList<CongTy> listCongTy = CongTyDao.getListCongTy();
													for (int i = 0; i < listCongTy.size(); i++) {
											%>
											<option selected=""
												value=<%=listCongTy.get(i).getCongTyID()%>><%=listCongTy.get(i).getTenCongTy()%></option>
											<%
												}
											%>
										</select>
									</div>
									<div class="col-sm-2">
										<a href="admin_company-add.jsp"
											class="form-control btn btn-success">Thêm công ti</a>
									</div>
								</div>
								<!--  -->
								<!-- input chua bien command = add -->
								<input type="hidden" name="command" value="add"></input>
								<div class="box-footer text-center">
									<button type="submit" class="btn btn-primary">Xác nhận</button>
								</div>
								<div class="alert alert-success alert-dismissible">
									<button type="button" class="close" data-dismiss="alert"
										aria-hidden="true">×</button>
									<h4>
										<i class="icon fa fa-check"></i> Chúc mừng!!!
									</h4>
									Thông tin đã cập nhật thành công.
								</div>
						</form>
					</div>
					<!-- Cập nhật thông tin -->

				</div>
				<!-- End Left -->
			</div>

			</section>
			<!-- /.content -->
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
	<!-- /.End of wrapper -->

</body>
</html>
