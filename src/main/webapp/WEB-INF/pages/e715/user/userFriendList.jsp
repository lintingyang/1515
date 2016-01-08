<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link
	href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css"
	rel="stylesheet">
<c:import url="/WEB-INF/pages/e715/layout/header.jsp" />



<div class="container" style="margin: 50px auto;">
	<div style="height: 250px">
		<div class="col-md-4"></div>
		<div class="col-md-4">
			<div class="row">
				<ul class="nav navbar-nav">
					<li><img class="img-circle" style="width: 200px;"
						src="/resources/imgs/noname.jpg"></li>
					<li><ul style="list-style: none;">
							<li><h4>
									Account <a href="#"></a>
								</h4></li>
							<li>Name</li>
							<li>台灣大學</li>
						</ul></li>
					<li><span class="glyphicon glyphicon-plus">123</span></li>

				</ul>
			</div>
		</div>
		<div class="col-md-4"></div>
	</div>
	<div class="col-md-12">
		<div>
			<!-- Nav tabs -->
			<br> <br>
			<ul class="nav nav-tabs" role="tablist">
				<li role="presentation" class="active"><a href="#friend"
					aria-controls="home" role="tab" data-toggle="tab">好友名單</a></li>
				<li role="presentation"><a href="#banlist"
					aria-controls="profile" role="tab" data-toggle="tab">黑名單</a></li>
			</ul>
			<!-- Tab panes -->
			<div class="tab-content">
				<div role="tabpanel" class="tab-pane active" id="friend">
					<br>
					<div class="row">
						<div class="col-md-3">
							<div align="center">
								<a href="/WebContent/user/myProfile.jsp"> <img class="img-circle" style="height: 80px;"
									src="/resources/imgs/noname.jpg"></a>
								<p>Account</p>
								<p>Name</p>
								<p>台灣大學</p>
								<button type="button" class="btn btn-warning btn-lg">
									<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
									取消關注
								</button>
							</div>
						</div>
						<div class="col-md-3">
							<div align="center">
								<a href="/WebContent/user/myProfile.jsp"> <img class="img-circle" style="height: 80px;"
									src="/resources/imgs/noname.jpg"></a>
								<p>Account</p>
								<p>Name</p>
								<p>台灣大學</p>
								<button type="button" class="btn btn-warning btn-lg">
									<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
									取消關注
								</button>
							</div>
						</div>
						<div class="col-md-3">
							<div align="center">
								<a href="/WebContent/user/myProfile.jsp"> <img class="img-circle" style="height: 80px;"
									src="/resources/imgs/noname.jpg"></a>
								<p>Account</p>
								<p>Name</p>
								<p>台灣大學</p>
								<button type="button" class="btn btn-warning btn-lg">
									<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
									取消關注
								</button>
							</div>
						</div>
						<div class="col-md-3">
							<div align="center">
								<a href="/WebContent/user/myProfile.jsp"> <img class="img-circle" style="height: 80px;"
									src="/resources/imgs/noname.jpg"></a>
								<p>Account</p>
								<p>Name</p>
								<p>台灣大學</p>
								<button type="button" class="btn btn-warning btn-lg">
									<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
									取消關注
								</button>
							</div>
						</div>
					</div>
				</div>
				<div role="tabpanel" class="tab-pane" id="banlist">
					<br>
					<div class="row">
						<div class="col-md-3">
							<div align="center">
								<a href="/WebContent/user/myProfile.jsp"> <img class="img-circle" style="height: 80px;"
									src="/resources/imgs/noname.jpg"></a>
								<p>Account</p>
								<p>Name</p>
								<p>台灣大學</p>
								<button type="button" class="btn btn-success btn-lg">
									<span class="glyphicon glyphicon-repeat" aria-hidden="true"></span>
									取消封鎖
								</button>
							</div>
						</div>
						<div class="col-md-3">
							<div align="center">
								<a href="/WebContent/user/myProfile.jsp"> <img class="img-circle" style="height: 80px;"
									src="/resources/imgs/noname.jpg"></a>
								<p>Account</p>
								<p>Name</p>
								<p>台灣大學</p>
								<button type="button" class="btn btn-success btn-lg">
									<span class="glyphicon glyphicon-repeat" aria-hidden="true"></span>
									取消封鎖
								</button>
							</div>
						</div>
						<div class="col-md-3">
							<div align="center">
								<a href="/WebContent/user/myProfile.jsp"> <img class="img-circle" style="height: 80px;"
									src="/resources/imgs/noname.jpg"></a>
								<p>Account</p>
								<p>Name</p>
								<p>台灣大學</p>
								<button type="button" class="btn btn-success btn-lg">
									<span class="glyphicon glyphicon-repeat" aria-hidden="true"></span>
									取消封鎖
								</button>
							</div>
						</div>
						<div class="col-md-3">
							<div align="center">
								<a href="/WebContent/user/myProfile.jsp"> <img class="img-circle" style="height: 80px;"
									src="/resources/imgs/noname.jpg"></a>
								<p>Account</p>
								<p>Name</p>
								<p>台灣大學</p>
								<button type="button" class="btn btn-success btn-lg">
									<span class="glyphicon glyphicon-repeat" aria-hidden="true"></span>
									取消封鎖
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<nav style="text-align: center;">
		<ul class="pagination">
			<li><a href="#" aria-label="Previous"> <span
					aria-hidden="true">&laquo;</span>
			</a></li>
			<li><a href="#">1</a></li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li><a href="#">4</a></li>
			<li><a href="#">5</a></li>
			<li><a href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
			</a></li>
		</ul>
	</nav>
</div>


<c:import url="/WebContent/layout/footer.jsp"></c:import>