<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			<section class="content-header">
			<h1>Billings</h1>
			<ol class="breadcrumb">
				<li><a href="index.jsp"><i class="fa fa-dashboard"></i>
						BillingsSystem</a></li>
				<li class="active">Billings</li>
			</ol>
			</section>

			<!-- Main content -->
			<section class="content">
			<div class="row">
				<div class="col-sm-7">
					<div class="box box-primary">

						<div class="box-header with-border">
							<h3 class="box-title">
								<i class="glyphicon glyphicon-filter"></i> Filter
							</h3>
						</div>

						<form action="#" class="form-horizontal">
							<div class="box-body">
								<div class="row">
									<div class="col-sm-4">
										<select class="form-control">
											<option selected="">Công ti</option>

											<!-- LẤY DANH SÁCH CÔNG TI TỪ DATABASE -->

										</select>
									</div>
									<div class="col-sm-3">
										<select class="form-control">
											<option selected="">Phòng/Ban</option>

											<!-- LẤY DANH SÁCH GROUP TỪ DATABASE -->

										</select>
									</div>
									<div class="col-sm-3">
										<select class="form-control">
											<option selected="">Extension</option>

											<!-- LẤY DANH SÁCH EXTENSION TỪ DATABASE -->

										</select>
									</div>
									<div class="col-sm-2">
										<input type="button" class="btn btn-primary btn-block"
											value="Kết quả">
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
								<i class="glyphicon glyphicon-search"></i> Search
							</h3>
						</div>
						<form action="#" class="form-horizontal">
							<div class="box-body">
								<input class="form-control" id="myInput" type="text"
									placeholder="Search..">
							</div>
						</form>

					</div>
				</div>
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
						<div class="box-body no-padding">
							<table id="datatable-responsive"
								class="table table-striped table-bordered dt-responsive nowrap"
								cellspacing="0" width="100%">
								<thead>
									<tr>
										<th>#</th>
										<th>Thuê bao chủ gọi</th>
										<th>Thuê bao được gọi</th>
										<th>Tổng số giây</th>
										<th>Công ti</th>
										<th>Phòng/ban</th>
										<th>Tổng thời gian (hh:mm:ss)</th>
										<th>Thời gian bắt đâu</th>
										<th>Thời gian kết thúc</th>
										<th>Cost(Chưa VAT) (VND)</th>
									</tr>
								</thead>
								<tbody>


									<!-- LIÊN KẾT VỚI DATABASE ĐỂ LẤY DỮ LIỆU TABLE -->


								</tbody>
							</table>
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
