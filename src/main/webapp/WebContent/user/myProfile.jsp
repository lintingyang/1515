<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WebContent/layout/header.jsp"></c:import>

<div class="container" style="margin: 50px auto;">

	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<div class="col-md-3"></div>
			<div class="col-md-3" style="text-align: center;margin-top:20px;">
				<img class="img-circle" style="width: 120px;"
					src="/resources/imgs/noname.jpg">
			</div>
			<div class="col-md-6">
				<br> 
				<ul style="list-style: none;">
					<li><a href="#"><span class="glyphicon glyphicon-envelope iconpme" ></span></a> 
						<a href="#"><span class="glyphicon glyphicon-plus iconpme"  style="margin-left: 20px;"></span></a></li>
					<li><h4 >Lintingyang</h4></li>
					<li><span style="color: gray;">淡江大學</span><br></li>


				</ul>
			</div>
		</div>
		<div class="col-md-1"></div>
	</div>

	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<div class="col-md-3"></div>
			<div class="col-md-3" style="text-align: center;">
				<div class="row">
				<h4 style="color: gray;">Account</h4>	
				</div>
				<div class="row">
					<div class="col-md-1"></div>
					<div class="col-md-5">
						<a href="#"><span
							class="glyphicon glyphicon-thumbs-up iconpro">11</span><span
							class="badge"></span></a>
					</div>
					<div class="col-md-5">
						<a href="#"><span
							class="glyphicon glyphicon-thumbs-down iconpro">22</span></a>
					</div>
					<div class="col-md-1"></div>
				</div>
			</div>
			<div class="col-md-6"><span style="margin-left:40px;color:gray;">about me....</span></div>
		</div>
		<div class="col-md-1"></div>
	</div>

	<hr>

	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<div class="col-md-3">
				<div class="prolist">
					<img class="prodimg" src="/resources/imgs/phone.jpg">雙雙的Mac
				</div>
			</div>
			<div class="col-md-3">
				<div class="prolist">
					<img class="prodimg" src="/resources/imgs/phone.jpg">雙雙的Mac
				</div>
			</div>
			<div class="col-md-3">
				<div class="prolist">
					<img class="prodimg" src="/resources/imgs/phone.jpg">雙雙的Mac
				</div>
			</div>
			<div class="col-md-3">
				<div class="prolist">
					<img class="prodimg" src="/resources/imgs/phone.jpg">雙雙的Mac
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