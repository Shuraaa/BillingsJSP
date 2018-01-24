<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.awt.List"%>
<%@page import="java.util.*"%>
<%@page import="model.*"%>
<%@page import="Dao.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Extension add</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<script type="text/javascript"
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.1/jquery.validate.min.js"></script>
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
			<h1>Thêm Extension mới</h1>
			<ol class="breadcrumb">
				<li><a href="index.jsp"><i class="fa fa-dashboard"></i>
						BillingsSystem</a></li>
				<li><a href="#">Quản trị hệ thống</a></li>
				<li><a href="admin_extension.jsp">Quản lí Extension</a></li>
				<li class="active">Thêm Extension</li>
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

								<i class="fa fa-pencil-square"></i> Thông tin Extension
							</h3>
						</div>

						<form action="<%=request.getContextPath()%>/ManagerExtension"
							method="get" role="form" class="form-horizontal" id="form">
							<div class="box-body">

								<%
									String idcongty = (String) request.getAttribute("choncongty");
										if ((idcongty == null)) {
								%>
								<!-- Form group -->
								<div class="form-group">
									<label for="inputCompany" class="col-sm-2 control-label">Chọn
										công ti: </label>
									<div class="col-sm-4">
										<select class="form-control" name="congty">

											<!-- KẾT NỐI LẤY DỮ LIỆU HIỂN THỊ TỪ DATABASE -->
											<%
												ArrayList<CongTy> listCongTy = CongTyDao.getListCongTy();
														for (int i = 0; i < listCongTy.size(); i++) {
											%>
											<option value=<%=listCongTy.get(i).getCongTyID()%>><%=listCongTy.get(i).getTenCongTy()%></option>
											<%
												}
											%>
										</select>

									</div>
									<input type="hidden" name="command" value="choncongty"></input>
									<div class="col-sm-2">
										<button type="submit" class="btn btn-primary btn-block">Xác
											nhận</button>
									</div>
									<div class="col-sm-2">
										<a href="<%=request.getContextPath()%>/admin_company-add.jsp"
											class="form-control btn btn-success btn-block">Thêm công
											ti</a>
									</div>
								</div>

								<%
									} else {
								%>
								<!-- Form group -->
								<div class="form-group">
									<label for="input_extension" class="col-sm-2 control-label">Extension:
									</label>
									<div class="col-sm-4">
										<input type="text" class="form-control" name="txt_extension"
											placeholder="Extension name">
										<!-- xử lý ngoại lệ extension-->
										<%
											String errorextension = (String) request.getAttribute("errorextension");
													if (errorextension != null) {
										%>
										<p style="color: #990000; font-style: italic;"><%=errorextension%></p>
										<%
											}
										%>
									</div>
								</div>

								<!-- Form group -->
								<div class="form-group">
									<label for="inputGroup" class="col-sm-2 control-label">Đầu
										số: </label>
									<div class="col-sm-4">
										<select class="form-control" name="txt_DauSo">

											<!-- KẾT NỐI LẤY DỮ LIỆU HIỂN THỊ TỪ DATABASE -->
											<%
												ArrayList<DauSo> listDauSo = DauSoDao.getListDauSoCongTy(idcongty);
														for (int i = 0; i < listDauSo.size(); i++) {
											%>
											<option value=<%=listDauSo.get(i).getDauSoSuDung()%>><%=listDauSo.get(i).getDauSoSuDung()%></option>
											<%
												}
											%>

										</select>
									</div>
									<div class="col-sm-2">
										<a href="admin_dauso-add.jsp"
											class="form-control btn btn-success btn-block">Thêm đầu
											số</a>
									</div>
								</div>

								<!--  -->
								<div class="form-group">
									<label for="inputGroup" class="col-sm-2 control-label">Phòng/ban:
									</label>
									<div class="col-sm-4">
										<select class="form-control" name="phongban">

											<!-- KẾT NỐI LẤY DỮ LIỆU HIỂN THỊ TỪ DATABASE -->
											<%
												ArrayList<PhongBan> listPhongBan = PhongBanDao.getListPBCongTy(idcongty);
														for (int i = 0; i < listPhongBan.size(); i++) {
											%>
											<option value=<%=listPhongBan.get(i).getPhongBanID()%>><%=listPhongBan.get(i).getTenPhongBan()%></option>
											<%
												}
											%>

										</select>
									</div>
									<div class="col-sm-2">
										<a href="admin_group-add.jsp"
											class="form-control btn btn-success btn-block">Thêm
											phòng/ban</a>
									</div>
								</div>

								<!--  -->
								<input type="hidden" name="command" value="add"></input>
								<div class="box-footer text-center">
									<button type="submit" class="btn btn-primary">Xác nhận</button>
								</div>
							</div>
						</form>
					</div>
					<!-- Cập nhật thông tin -->
					<%
						}
					%>
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
	<script>
		$(document)
				.ready(
						function() {
							var validator = $("#form")
									.validate(
											{
												rules : {
													txt_extension : "required"
												},
												messages : {
													txt_extension : "Vui lòng nhập vào Extension"
												},
												errorElement : "em",
												errorPlacement : function(
														error, element) {
													// Add the `help-block` class to the error element
													error
															.addClass("help-block");

													// Add `has-feedback` class to the parent div.form-group
													// in order to add icons to inputs
													element
															.parents(
																	".col-sm-4")
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
																	".col-sm-4")
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
																	".col-sm-4")
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
