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
<title>IMPORT</title>
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
				<li><a href="#">Billings</a></li>
				<li class="active">Import</li>
			</ol>
			</section>

			<!-- Main content -->
			<section class="content">
			<div class="row">

				<!-- /.UPLOAD FILE -->
				<div class="col-sm-8">
					<div class="box box-primary">
						<div class="box-header with-border">
							<h3 class="box-title">
								<i class="glyphicon glyphicon-import"></i> Import File
							</h3>
						</div>
						<form action="ManagerUploadFile" method="POST"
							class="form-horizontal" enctype="multipart/form-data" id="form">
							<div class="box-body">
								<div class="row">
									<div class="col-sm-5">
										<input type="file" name="inputFileExcel"
											class="custom-file-input form-control">
									</div>
									<div class="col-sm-5">
										<input type="text" placeholder="Sheet Index"
											name="input_sheetIndex" class="form-control" maxlength="6">
									</div>
									<div class="col-sm-2">
										<button type="submit" class="btn btn-primary form-control">
											<i class="glyphicon glyphicon-save"></i> Import
										</button>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
				<!-- /.End -->

				<div class="col-md-12">

					<div class="box box-primary">
						<div class="box-header">
							<h3 class="box-title">Danh sách</h3>
						</div>
						<!-- /.box-header -->
						<div class="box-body no-padding">
							<table id="datatable-responsive"
								class="display table table-striped table-bordered dt-responsive"
								cellspacing="0" width="100%">
								<thead>
									<tr>
										<th>#</th>
										<th>Ngày cập nhật</th>
										<th>Số dòng</th>
										<th>Tên File</th>
										<th>Tác vụ</th>
									</tr>
								</thead>
								<tbody>

									<!-- LIÊN KẾT VỚI DATABASE ĐỂ LẤY DỮ LIỆU TABLE -->
									<%
									ArrayList<LichSu> arrLichSu = LichSuDAO.getListOfLichSu();
											for (int i = 0; i < arrLichSu.size(); i++) {
									%>
									<tr class="gradeA">
										<td><%=i+1 %></td>

										<td><%=arrLichSu.get(i).getNgayImport()%></td>

										<td><%=arrLichSu.get(i).getSoDong()%></td>

										<td><a href="ManagerBilling?command=importDetail"><u><%=arrLichSu.get(i).getTenFile()%></u></a></td>
										<td><a href="#" class="linkDelete"><button
													type="button" onclick="clickBt($(this).val())"
													class="btn btn-danger glyphicon glyphicon-trash"></button></a></td>
									</tr>
									<%
										}
									%>

								</tbody>
							</table>
						</div>
						<!-- /.box-body -->
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
			if (confirm("Bạn có chắc chắn muốn xóa nội dung này?") == true) {
				$(".linkDelete").attr("href",
						"ManagerBilling?command=delete&importID=" + text);
			}
		}
	</script>
	<script>
		$(document)
				.ready(
						function() {
							var validator = $("#form")
									.validate(
											{
												rules : {
													inputFileExcel : {
														required : true,
														extension : "xls|xlsx"
													},
													input_sheetIndex : {
														required : true,
														number : true,
														maxlength : [ 6 ]
													}
												},
												messages : {
													inputFileExcel : {
														required : "Vui lòng chọn File Excel",
														extension : "Vui lòng chọn File có định dạng xls hoặc xlsx",
													},
													input_sheetIndex : {
														required : "Vui lòng nhập vào trang Excel cần Import",
														number : "Vui lòng nhập vào kiểu số",
														maxlength : "Tối đa 6 chữ số"
													}
												},
												errorElement : "em",
												errorPlacement : function(
														error, element) {
													// Add the help-block class to the error element
													error
															.addClass("help-block");
													// Add has-feedback class to the parent div.form-group
													// in order to add icons to inputs
													element
															.parents(
																	".col-sm-5")
															.addClass(
																	"has-feedback");
													if (element.prop("type") === "checkbox") {
														error
																.insertAfter(element
																		.parent("label"));
													} else {
														error
																.insertAfter(element);
													}
													// Add the span element, if doesn't exists, and apply the icon classes to it.
													if (!element.next("span")[0]) {
														$(
																"<span class='glyphicon glyphicon-remove form-control-feedback'></span>")
																.insertAfter(
																		element);
													}
												},
												success : function(label,
														element) {
													// Add the span element, if doesn't exists, and apply the icon classes to it.
													if (!$(element)
															.next("span")[0]) {
														$(
																"<span class='glyphicon glyphicon-ok form-control-feedback'></span>")
																.insertAfter(
																		$(element));
													}
												},
												highlight : function(element,
														errorClass, validClass) {
													$(element)
															.parents(
																	".col-sm-5")
															.addClass(
																	"has-error")
															.removeClass(
																	"has-success");
													$(element)
															.next("span")
															.addClass(
																	"glyphicon-remove")
															.removeClass(
																	"glyphicon-ok");
												},
												unhighlight : function(element,
														errorClass, validClass) {
													$(element)
															.parents(
																	".col-sm-5")
															.addClass(
																	"has-success")
															.removeClass(
																	"has-error");
													$(element)
															.next("span")
															.addClass(
																	"glyphicon-ok")
															.removeClass(
																	"glyphicon-remove");
												}
											});
						});
	</script>
</body>
</html>