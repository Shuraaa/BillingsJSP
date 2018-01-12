<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Footer</title>
<!-- Tell the browser to be responsive to screen width -->
</head>

<body class="hold-transition skin-blue sidebar-mini">

	<footer class="main-footer">
	<div class="pull-right hidden-xs">
		<b>Version</b> 1.0.0
	</div>
	<strong>Copyright &copy; 2017 <a href="#">ATHL</a>.
	</strong> All rights reserved. </footer>

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
	<script>
		$(document).ready(function() {
			$('table.display').DataTable({
				stateSave : true
			});
		});
	</script>
</body>
</html>