<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="/resources/js/jquery-1.11.3.js"></script>
<link rel="stylesheet" href="/resources/css/jPages.css">
<script src="/resources/js/jPages.js"></script>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css"
	integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7"
	crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/bootstrap-theme.min.css"
	integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r"
	crossorigin="anonymous">
<script src="/resources/js/bootstrap.min.js"
	integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
	crossorigin="anonymous"></script>


<script>
	$(function() {
		$("div.holder").jPages({
			containerID : "itemContainer",
			perPage : 5
		});
	});
</script>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<body>
	<div class="container">
		<!-- jPage -->
		<div class="holder"></div>
		<!-- Item container (doesn't need to be an UL) -->
		<table>
			<tbody id="itemContainer"><!-- Items -->
				<tr>
				<td><img src="/resources/imgs/aaa.jpg"></td>
				<td><img src="/resources/imgs/aaa.jpg"></td>
				<td><img src="/resources/imgs/aaa.jpg"></td>
				<td><img src="/resources/imgs/aaa.jpg"></td>
				<td><img src="/resources/imgs/aaa.jpg"></td>								
				</tr>
			</tbody>
			<!-- end of itemContainer -->
		</table>

	</div>
	<!-- end of paging -->
</body>
</html>