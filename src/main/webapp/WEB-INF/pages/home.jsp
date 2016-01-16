<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<c:import url="/WEB-INF/pages/layout/meta.jsp"></c:import>
	<c:import url="/WEB-INF/pages/layout/javascript.jsp"></c:import>
	<c:import url="/WEB-INF/pages/layout/css.jsp"></c:import>
	
	<title>E715</title>
</head>
<body>
<div class="wrap">
	<c:import url="/WEB-INF/pages/layout/navigator.jsp"></c:import>
	

	<div class="jumbotron">
		<div class="container">
			<h1>E715 以物易物網</h1>
			<p></p>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-md-4">
				<h2>操作簡單</h2>
				<p>
					透過瀏覽器就可以簡單地操作，
					可以簡單地上瀏覽與調整，
					相關的設定也非常地容易。
				</p>
			</div>
			<div class="col-md-4">
				<h2>整合容易</h2>
				<p>
					可以輸入或是上傳 FATCA 名冊，系統將會自動顯示相關的名冊內容提供檢查，
					確認無誤之後，便可以產出加密過的 ZIP 提供上傳。
				</p>
			</div>
			<div class="col-md-4">
				<h2>安全保證</h2>
				<p>
					安裝容易，單機運作，
					順利整合 SSL. 產出相關的資訊無資訊安全與個資外洩的疑慮。					
				</p>
			</div>
		</div>
	</div>
	<c:import url="/WEB-INF/pages/layout/footer.jsp"></c:import>
</div>
</body>
</html>