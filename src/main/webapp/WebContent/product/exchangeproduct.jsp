<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WebContent/layout/header.jsp"></c:import>

<div class="container" style="margin: 50px auto;">
	<div class="row">
		<div class="col-md-3">
			<div class="row">
				<div>
					<img src="/resources/imgs/noname.jpg"
						style="width:250px;" class="img-circle">
				</div>
				<div>
					<ul style="list-style: none;">
						<li><h2>Target Account</h2></li>
						<li>Name</li>
						<li>Nickname</li>
						<li>Phone</li>
						<li>Gender</li>
						<li>Email</li>
						<li>School</li>
					</ul>
				</div>
			</div>
		</div>

		<div class="col-md-6">
			<div class="col-md-6">
				<blockquote>
				  <p>好吃的好吃的好吃的好吃的好吃的好吃的好吃的好吃的</p>
				  <footer>交換物品</footer>
				</blockquote>
			</div>
			<div class="col-md-6">
				<blockquote>
				  <p>不好吃的</p>
				  <footer>我的物品</footer>
				</blockquote>
			</div><br>
			<div class="col-md-12">
				<h4><dl>
				  <dt>交易剩餘時間:</dt>
				  <dd>A long long long long long long long long long long long long long long long long long long long long time ago</dd>
				  <dt>交易方式:</dt>
				  <dd>用手交易</dd>
				  <dt>交易時間:</dt>
				  <dd>A long long time ago</dd>
				  <dt>交易地點:</dt>
				  <dd>A long long time ago</dd>
				</dl></h4>
				
				<br>


			</div>
		</div>


		<div class="col-md-3">
			<div class="row">
				<div>
					<img src="/resources/imgs/user.jpeg"
						style="width: 250px;" class="img-circle">
				</div>
				<div>
					<ul style="list-style: none;">
						<li><h2>My Account</h2></li>
						<li>Name</li>
						<li>Nickname</li>
						<li>Phone</li>
						<li>Gender</li>
						<li>Email</li>
						<li>School</li>
					</ul>
				</div>
			</div>

		</div>

	</div>
	<div style="text-align: center;">
		<p><button type="button" class="btn btn-primary btn-lg">確認</button></p>
	</div>
</div>

	<c:import url="/WebContent/layout/footer.jsp"></c:import>