<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>404</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="bootstrap/css/hover.css">
<link rel="stylesheet" type="text/css"
	href="bootstrap/css/hover-min.css">
<link href="bootstrap/css/page404.css" rel="stylesheet" type="text/css"
	media="all" />
</head>
<body>
	<div class="wrap">

		<div class="content">

			<div class="logo">
				<p style="font-size: 100px; color: black; font-family: sans-serif;">Error
					code: 404</p>
				<span style="color: black">Oops! The Page you requested was
					not found!</span>
			</div>

			<div class="buttom">
				<div class="seach_bar">
					<p style="color: black">
						You can go to <span><a href="index.jsp" style="color: blue">Homepage</a></span>
						or search here
					</p>

					<div class="search_box">
						<form>
							<input type="text" value="Search" onfocus="this.value = '';"
								onblur="if (this.value == '') {this.value = 'Search';}"><input
								type="submit" value="">
						</form>
					</div>
				</div>
			</div>

		</div>

	</div>

	<script src="bootstrap/js/jquery-3.1.1.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>