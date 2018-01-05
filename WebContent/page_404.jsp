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
	<script>
		$(document).ready(function() {
			$(document).on("contextmenu", function(e) {
				return false;
			});
		});
		s
	</script>
	<script>
		$(document).keydown(function(event) {
			if (event.keyCode == 123) {
				return false;
			} else if (event.ctrlKey && event.shiftKey && event.keyCode == 73) {
				return false;
			}
		});
	</script>
</body>
</html>