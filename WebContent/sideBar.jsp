<%@page import="com.mysql.jdbc.Blob"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>Sidebar</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="dist/css/skins/skin-blue.min.css">
<!-- bootstrap wysihtml5 - text editor -->
<link rel="stylesheet"
	href="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/v/dt/dt-1.10.16/datatables.min.css" />
<style type="text/css">
div.dataTables_wrapper {
	margin: 8px 5px 5px 5px;
}
</style>


<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<%
	String username = (String) session.getAttribute("username");
	String name = (String) session.getAttribute("companyName");
	String iD = (String) session.getAttribute("companyID");
	int role = (int) session.getAttribute("role");
	String url = "";
	if (username.equals("") || username == null) {
		url = "Login.jsp";
	} else {
		url = "Logout";
	}
%>

<body class="hold-transition skin-blue sidebar-mini">

	<!-- Main Header -->
	<header class="main-header"> <!-- Logo --> <a
		href="<%=request.getContextPath()%>/index.jsp" class="logo"> <!-- mini logo for sidebar mini 50x50 pixels -->
		<span class="logo-mini"><b>B</b>S</span> <!-- logo for regular state and mobile devices -->
		<span class="logo-lg"><b>Billings</b>System</span>
	</a> <!-- Header Navbar: style can be found in header.less --> <nav
		class="navbar navbar-static-top"> <!-- Sidebar toggle button-->
	<a href="#" class="sidebar-toggle" data-toggle="offcanvas"
		role="button"> <span class="sr-only">Sidebar</span>
	</a>

	<div class="navbar-custom-menu">
		<ul class="nav navbar-nav">
			<!-- User Account: style can be found in dropdown.less -->
			<li class="dropdown user user-menu"><a href="#"
				class="dropdown-toggle" data-toggle="dropdown"> <img
					src="dist/img/avatar5.png" class="user-image"
					onerror="this.src='dist/img/avatar5.png';"> <%
 	if (role == 0) {
 %> <b class="hidden-xs" style="color: #ff3333"><%=name%></b> <%
 	} else if (role == 1) {
 %> <b class="hidden-xs" style="color: #ffff80"><%=name%></b> <%
 	} else {
 %> <b class="hidden-xs"><%=name%></b> <%
 	}
 %></a>

				<ul class="dropdown-menu">
					<!-- User image -->
					<li class="user-header"><img
						src="ManagerDisplayImg?congtyid=<%=iD%>" class="img-rounded"
						onerror="this.src='dist/img/avatar5.png';">
						<p style="font-size: 22px">
							<%
								if (role == 0) {
							%><b style="color: #ff3333;"><%=username%></b>
							<%
								} else if (role == 1) {
							%><b style="color: #ffff80;"><%=username%></b>
							<%
								} else {
							%>
							<b><%=username%></b>
							<%
								}
							%>
						</p></li>

					<!--User Menu Footer-->
					<li class="user-footer">
						<div class="pull-left">
							<%
								if (role == 1) {
							%>
							<a href="<%=request.getContextPath()%>/user_update.jsp"
								class="btn btn-default btn-flat">Cập nhật thông tin</a>
							<%
								} else {
							%>
							<a href="<%=request.getContextPath()%>/user_changePass.jsp"
								class="btn btn-default btn-flat">Đổi mật khẩu</a>
							<%
								}
							%>
						</div>
						<div class="pull-right">
							<a href="<%=request.getContextPath()%>/Logout"
								class="btn btn-default btn-flat">Đăng xuất</a>
						</div>
					</li>
				</ul></li>
		</ul>
	</div>
	</nav> </header>

	<!-- Left side column. contains the logo and sidebar -->
	<aside class="main-sidebar" style=" position: fixed;height: 100%;">
	<!-- sidebar: style can be found in sidebar.less --> <section
		class="sidebar"> <!-- Sidebar USER panel -->
	<div class="user-panel">
		<div class="pull-left image">
			<img src="ManagerDisplayImg?congtyid=<%=iD%>"
				class="user-image img-responsive"
				onerror="this.src='dist/img/avatar5.png';">
		</div>
		<div class="pull-left info">
			<p>Welcome</p>
			<%
				if (role == 0) {
			%>
			<p style="color: #ff3333; font-style: bold;">
				<%
					} else if (role == 1) {
				%>
			
			<p style="color: #ffff80; font-style: bold;">
				<%
					} else if (role == 2) {
				%>
			
			<p style="font-style: bold;">
				<%
					}
				%>
				<span><%=username%></span>
			</p>
		</div>
	</div>
	<!-- Sidebar menu -->
	<ul class="sidebar-menu">
		<li class="header">DANH MỤC</li>

		<li class="treeview"><a href="#"> <i
				class="glyphicon glyphicon-user"></i> <span> Thông tin</span> <i
				class="fa fa-angle-left pull-right"></i>
		</a>
			<ul class="treeview-menu">

				<!-- List 1 -->
				<%
					if (role == 1 || role == 2) {
				%>
				<li><a href="<%=request.getContextPath()%>/user_update.jsp"><i
						class="glyphicon glyphicon-pencil"></i> Cập nhật thông tin</a></li>
				<%
					}
					if (role == 0 || role == 1) {
				%>
				<li><a href="<%=request.getContextPath()%>/user_changePass.jsp"><i
						class="glyphicon glyphicon-lock"></i> Cập nhật mật khẩu</a></li>
				<%
					}
				%>
			</ul></li>
		<!-- /.List 1 -->

		<!-- List 2 -->
		<%
			if (role == 1 || role == 2) {
		%>
		<li><a
			href="<%=request.getContextPath()%>/ManagerBilling?command=detail&congtyid=<%=iD%>&tencongty=<%=name%>">
				<i class="glyphicon glyphicon-list-alt"></i> <span>Billings</span>
		</a></li>
		<%
			} else if (role == 0) {
		%>
		<li class="treeview"><a href="#"> <i
				class="glyphicon glyphicon-list-alt"></i> <span>Billings</span> <i
				class="fa fa-angle-left pull-right"></i>
		</a>
			<ul class="treeview-menu">
				<li><a href="<%=request.getContextPath()%>/billings_total.jsp"><i
						class="glyphicon glyphicon-file"></i> <span>Billings</span></a></li>
				<li><a href="<%=request.getContextPath()%>/import.jsp"><i
						class="glyphicon glyphicon-import"></i> Import</a></li>
			</ul></li>
		<!-- /.List 2 -->

		<!-- List 3 -->
		<%
			}
			if (role == 0) {
		%>
		<li class="treeview"><a href="#"> <i
				class="glyphicon glyphicon-link"></i><span> Quản trị hệ thống</span>
				<i class="fa fa-angle-left pull-right"></i>
		</a>
			<ul class="treeview-menu">
				<li><a href="<%=request.getContextPath()%>/admin_bangma.jsp"><i
						class="glyphicon glyphicon-book"></i> Bảng mã cuộc gọi</a></li>
				<li><a href="<%=request.getContextPath()%>/admin_user.jsp"><i
						class="fa fa-users"></i> Quản lí tài khoản</a></li>
				<li><a href="<%=request.getContextPath()%>/admin_company.jsp"><i
						class="glyphicon glyphicon-briefcase"></i> Quản lí công ti</a></li>
				<li><a href="<%=request.getContextPath()%>/admin_group.jsp"><i
						class="glyphicon glyphicon-th-large"></i> Quản lí phòng/ban</a></li>
				<li><a href="<%=request.getContextPath()%>/admin_dauso.jsp"><i
						class="glyphicon glyphicon-th-list"></i> Quản lí đầu số</a></li>
				<li><a href="<%=request.getContextPath()%>/admin_extension.jsp"><i
						class="glyphicon glyphicon-th"></i> Quản lí Extension</a></li>
			</ul></li>
		<%
			}
		%>
		<!-- /.List 3 -->

		<li><a href="guide.jsp"><i class="fa fa-book"></i> <span>Hướng
					dẫn sử dụng</span></a></li>
		<li><a href="<%=request.getContextPath()%>/Logout"><i
				class="glyphicon glyphicon-log-out"></i> <span>Đăng xuất</span></a></li>
	</ul>
	</section> <!-- /.sidebar --> </aside>
	<!-- /.content-wrapper -->


	<!-- REQUIRED JS SCRIPTS -->
	<!-- Datatable -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.datatables.net/v/dt/dt-1.10.16/datatables.min.js"></script>
	<!-- Bootstrap 3.3.6 -->
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<!-- Select2 -->
	<script src="plugins/select2/select2.full.min.js"></script>
	<!-- InputMask -->
	<script src="plugins/input-mask/jquery.inputmask.js"></script>
	<script src="plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
	<script src="plugins/input-mask/jquery.inputmask.extensions.js"></script>
	<!-- SlimScroll 1.3.0 -->
	<script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
	<!-- FastClick -->
	<script src="plugins/fastclick/fastclick.js"></script>
	<!-- AdminLTE App -->
	<script src="dist/js/app.min.js"></script>

</body>
</html>