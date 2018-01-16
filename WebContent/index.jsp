<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Index</title>
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
	<%
		int role = (int) session.getAttribute("role");
			String iD = (String) session.getAttribute("companyID");
			String name = (String) session.getAttribute("companyName");
	%>

	<div class="wrapper">


		<!-- Include this in all index page -->
		<!-- Sidebar da co day du css -->
		<jsp:include page="sideBar.jsp"></jsp:include>
		<!-- /.Include this in all index page -->


		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
			<h1>
				Dashboard <small>Control panel</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
				<li class="active">Dashboard</li>
			</ol>
			</section>

			<!-- Main content -->
			<section class="content"> <!-- Small boxes (Stat box) -->
			<div class="row">
				<div class="col-lg-3 col-xs-6">
					<!-- small box -->
					<%
						if (role == 1 || role == 2) {
					%>
					<div class="small-box bg-aqua">
						<div class="inner">

							<h1>
								<b>Thông tin</b>
							</h1>
						</div>
						<div class="icon">
							<i class="ion-person-stalker"></i>
						</div>
						<a href="<%=request.getContextPath()%>/user_update.jsp"
							class="small-box-footer">Chi tiết <i
							class="fa fa-arrow-circle-right"></i></a>
					</div>
					<%
						} else if (role == 0) {
					%>
					<div class="small-box bg-aqua">
						<div class="inner">

							<h1>
								<b>Đổi mật khẩu</b>
							</h1>
						</div>
						<div class="icon">
							<i class="ion-loop"></i>
						</div>
						<a href="<%=request.getContextPath()%>/user_changePass.jsp"
							class="small-box-footer">Chi tiết <i
							class="fa fa-arrow-circle-right"></i></a>
					</div>
					<%
						}
					%>
				</div>

				<%
					if (role == 1) {
				%>
				<div class="col-lg-3 col-xs-6">
					<div class="small-box bg-red">
						<div class="inner">

							<h1>
								<b>Đổi mật khẩu</b>
							</h1>
						</div>
						<div class="icon">
							<i class="ion-loop"></i>
						</div>
						<a href="<%=request.getContextPath()%>/user_changePass.jsp"
							class="small-box-footer">Chi tiết <i
							class="fa fa-arrow-circle-right"></i></a>
					</div>
				</div>
				<%
					}
				%>

				<!-- ./col -->
				<div class="col-lg-3 col-xs-6">
					<!-- small box -->
					<div class="small-box bg-green">
						<div class="inner">
							<h1>
								<b>Billings</b>
							</h1>
						</div>
						<div class="icon">
							<i class="ion ion-stats-bars"></i>
						</div>
						<%
							if (role == 0) {
						%>
						<a href="<%=request.getContextPath()%>/billings_total.jsp"
							class="small-box-footer">Chi tiết <i
							class="fa fa-arrow-circle-right"></i></a>
						<%
							} else if (role == 1 || role == 2) {
						%>
						<a
							href="<%=request.getContextPath()%>/ManagerBilling?command=detail&congtyid=<%=iD%>&tencongty=<%=name%>"
							class="small-box-footer">Chi tiết <i
							class="fa fa-arrow-circle-right"></i></a>
						<%
							}
						%>
					</div>
				</div>
				<!-- ./col -->

				<%
					if (role == 0) {
				%>
				<div class="col-lg-3 col-xs-6">
					<!-- small box -->
					<div class="small-box bg-red">
						<div class="inner">

							<h1>
								<b>Quản trị</b>
							</h1>
						</div>
						<div class="icon">
							<i class="ion-locked"></i>
						</div>
						<a href="<%=request.getContextPath()%>/admin_user.jsp"
							class="small-box-footer">Chi tiết <i
							class="fa fa-arrow-circle-right"></i></a>
					</div>
				</div>

				<%
					}
				%>
				<!-- ./col -->
				<div class="col-lg-3 col-xs-6">
					<!-- small box -->
					<div class="small-box bg-purple">
						<div class="inner">

							<h1>
								<b>Hướng dẫn</b>
							</h1>
						</div>
						<div class="icon">
							<i class="ion-document-text"></i>
						</div>
						<a href="<%=request.getContextPath()%>/guide.jsp"
							class="small-box-footer">Chi tiết <i
							class="fa fa-arrow-circle-right"></i></a>
					</div>
				</div>
				<!-- ./col -->
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
	<!-- ./wrapper -->
</body>
</html>
