<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WebContent/layout/header.jsp"></c:import>
<div class="container" style="margin: 50px auto;">
	<div class="col-md-6">
		<div class="row">
			<div>
				<img src="/resources/imgs/phone.jpg"
					style="width: 400px;">
			</div>
		</div>
		<div class="row">
			<ul class="nav navbar-nav">
				<li><a class="thumbnail" href="#"><img class="smaimg"
						src="/resources/imgs/phone.jpg"></a></li>
				<li><a class="thumbnail" href="#"><img class="smaimg"
						src="/resources/imgs/phone.jpg"></a></li>
				<li><a class="thumbnail" href="#"><img class="smaimg"
						src="/resources/imgs/phone.jpg"></a></li>
				<li><a class="thumbnail" href="#"><img class="smaimg"
						src="/resources/imgs/phone.jpg"></a></li>
			</ul>
		</div>
		<div class="row">
			<hr>
			<ul class="nav navbar-nav">
				<li><img class="img-circle" style="width: 100px;"
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
	<div class="col-md-6">
		<h3>IPhone 6s</h3>
		<div>
			<h5>希望交易商品：</h5>
			<br> 星巴克一杯

		</div>
		<hr>
		<div>
			<h5>描述：</h5>
			<br> 全新未拆
		</div>
		<hr>
		<div>
			<h5>交易地點：淡江大學校園</h5>
			<h5>交易期限：2016-1-1  ~ 2016-2-1</h5>
			<h5>交易時段：下午</h5>
		</div>
		<hr>
		<div>
			<h5>交易方式：</h5>
			貨運
		</div>

		<div class="container"
			style="width: 100%; height: 100px; text-align: center;">
			<input class="btn btn-primary btn-lg" type="button" value="我要交換" onclick="location.href='/WebContent/product/exchangeproduct.jsp'">
		</div>
	</div>


	<div class="col-md-12">
		<div>
			<!-- Nav tabs -->
			<br> <br>
			<ul class="nav nav-tabs" role="tablist">
				<li role="presentation" class="active"><a href="#question"
					aria-controls="home" role="tab" data-toggle="tab">問與答</a></li>
				<li role="presentation"><a href="#exchange"
					aria-controls="profile" role="tab" data-toggle="tab">交換物品</a></li>
			</ul>

			<!-- Tab panes -->
			<div class="tab-content">
				<div role="tabpanel" class="tab-pane active" id="question">
					question
					<table class="table table-striped">
						<tr>
							<td><h4>Question:</h4>我可以用兩個CityCoffee跟你換嗎
								<hr>
								<h4>Answer:</h4>不行喔<br></td>
						</tr>
						<tr>
							<td><h4>Question:</h4> 全新的嗎
								<hr>
								<h4>Answer:</h4>九成新<br></td>
						</tr>
						<tr>
							<td><h4>Question:</h4>AAA <br>
								<hr>
								<h4>Answer:</h4>BBB<br></td>
						</tr>
					</table>
					<div>
						
						<div style="text-align: center;">
						
							<textarea   rows="9" cols="100" placeholder="提出發問..."></textarea>
							<br>
							<br> <input type="button" value="送出" class="btn btn-primary">
							<div class="checkbox">
								<label> <input type="checkbox"> 匿名發言
								</label>
							</div>
						</div>
					</div>

				</div>







				<div role="tabpanel" class="tab-pane" id="exchange">
					exchange
					<table class="table table-striped">
						<tr>
							<td>
								<div class="col-md-2">
									<img src="/resources/imgs/phone.jpg"
										style="height: 100px;">
								</div>
								<div class="col-md-6">
									<h4>星巴克紀念杯款</h4>
									物品狀況：九成新 <br>產品描述：j123oi21j3oijelkwjeq;oijaksjd;alkdjsqkje;lqwkej;ls
								</div>
								<div class="col-md-4" style="border-left: 1px dashed gray;">
									<ul class="nav navbar-nav">
										<li><img class="img-circle" style="height: 80px;"
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
							</td>
						</tr>
						<tr>
							<td>
								<div class="col-md-2">
									<img src="/resources/imgs/phone.jpg"
										style="height: 100px;">
								</div>
								<div class="col-md-6">
									<h4>星巴克紀念杯款</h4>
									物品狀況：九成新 <br>產品描述：j123oi21j3oijelkwjeq;oijaksjd;alkdjsqkje;lqwkej;ls
									<input type="button" value="我想跟你換">
								</div>
								<div class="col-md-4" style="border-left: 1px dashed gray;">
									<ul class="nav navbar-nav">
										<li><img class="img-circle" style="height: 80px;"
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
							</td>
						</tr>
						<tr>
							<td>
								<div class="col-md-2">
									<img src="/resources/imgs/phone.jpg"
										style="height: 100px;">
								</div>
								<div class="col-md-6">
									<h4>星巴克紀念杯款</h4>
									物品狀況：九成新 <br>產品描述：j123oi21j3oijelkwjeq;oijaksjd;alkdjsqkje;lqwkej;ls
								</div>
								<div class="col-md-4" style="border-left: 1px dashed gray;">
									<ul class="nav navbar-nav">
										<li><img class="img-circle" style="height: 80px;"
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
							</td>
						</tr>

						<tr>
							<td>
								<div class="col-md-2">
									<img src="/resources/imgs/phone.jpg"
										style="height: 100px;">
								</div>
								<div class="col-md-6">
									<h4>星巴克紀念杯款</h4>
									物品狀況：九成新 <br>產品描述：j123oi21j3oijelkwjeq;oijaksjd;alkdjsqkje;lqwkej;ls
								</div>
								<div class="col-md-4" style="border-left: 1px dashed gray;">
									<ul class="nav navbar-nav">
										<li><img class="img-circle" style="height: 80px;"
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
							</td>
						</tr>



					</table>



				</div>

			</div>

		</div>
	</div>
</div>


<c:import url="/WebContent/layout/footer.jsp"></c:import>