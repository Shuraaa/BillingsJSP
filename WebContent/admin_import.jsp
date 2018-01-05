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
<title>Import</title>
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
			<h1>Import</h1>
			<ol class="breadcrumb">
				<li><a href="index.jsp"><i class="fa fa-dashboard"></i>
						BillingsSystem</a></li>
				<li><a href="#">Quản trị hệ thống</a></li>
				<li class="active">Import</li>
			</ol>

			</section>

			<!-- Main content -->
			<section class="content">
			<div class="row">

				<!--  -->
				<div class="col-sm-6 pull-left">
					<div class="box box-primary">
						<div class="box-header with-border">
							<h3 class="box-title">
								<i class="glyphicon glyphicon-import"></i> Import
							</h3>
						</div>
						<form action="#" class="form-horizontal">
							<div class="box-body">
								<input type="file" class="form-control">
							</div>
							<div class="box-footer">
								<a href="#" class="btn btn-primary pull-right"> Xác nhận</a>
							</div>
						</form>
					</div>
				</div>

				<div class="col-md-6">
					<div class="box box-primary">
						<div class="box-header with-border">
							<i class="fa fa-book"></i>
							<h3 class="box-title">Cách Import</h3>
						</div>
						<!-- /.box-header -->
						<div class="box-body">
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
								Tempora laboriosam illum quasi ipsa, maxime accusantium mollitia
								deleniti illo reprehenderit neque dolorem officiis tenetur
								doloribus, dolorum ut nisi, impedit qui aperiam?</p>
							<h4>1. Lorem ipsum dolor sit amet.</h4>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
								Ex cupiditate laborum aliquid eveniet, reprehenderit sunt
								maiores molestias assumenda quos recusandae.</p>
							<h4>2. Lorem ipsum dolor sit amet.</h4>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
								Mollitia numquam dignissimos earum laudantium corporis, animi
								fuga quae! Rerum optio, iusto minima quae soluta deleniti
								praesentium, esse eaque inventore dolorem nam quod laudantium
								rem saepe dicta alias minus, iure quis. Non reiciendis provident
								cumque ut, distinctio culpa, quam maiores magnam aliquam.</p>
							<h4>3. Lorem ipsum dolor sit.</h4>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
								Et architecto commodi nemo ipsa similique dignissimos debitis
								pariatur maxime illo ratione.</p>
						</div>
					</div>
					<!-- /.box -->
				</div>
				<!--  -->

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
