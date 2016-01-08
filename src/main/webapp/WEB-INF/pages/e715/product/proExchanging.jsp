<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WebContent/layout/header.jsp"></c:import>

<div class="container" style="margin: 50px auto;">
	<div class="row">
		<div class="col-md-3">
			<div class="row">
				<div>
					<img src="${exchang.productBId.userId.picture}"
						style="width:250px;" class="img-circle">
				</div>
				<div>
					<ul style="list-style: none;">
						<li><h2>A${exchang.productBId.userId.account}</h2></li>
						<li>A${exchang.productBId.userId.name}</li>
						<li>A${exchang.productBId.userId.nickname}</li>
						<li>A${exchang.productBId.userId.phone}</li>
						<li>A${exchang.productBId.userId.sex}</li>
						<li>A${exchang.productBId.userId.email}</li>
						<li>A${exchang.productBId.userId.schoolName}</li>
					</ul>
				</div>
			</div>
		</div>

		<div class="col-md-6">
			<div class="col-md-6">
				<blockquote>
				  <p>A${exchang.productBId.description}</p>
				  <footer>A${exchang.productBId.name}</footer>
				</blockquote>
			</div>
			<div class="col-md-6">
				<blockquote>
				  <p>${thisProduct.description}</p>
				  <footer>${thisProduct.name}</footer>
				</blockquote>
			</div><br>
			<div class="col-md-12">
				<h4><dl>
				  <dt>交易剩餘時間:</dt>
				  <dd>A????????????????????????????????</dd>
				  <dt>交易方式:</dt>
				  <dd>${thisProduct.tradeWay}</dd>
				  <dt>交易時間:</dt>
				  <dd>A{exchang.tradeFinishedTime}</dd>
				  <dt>交易地點:</dt>
				  <dd>${thisProduct.location}</dd>
				</dl></h4>
				
				<br>


			</div>
		</div>


		<div class="col-md-3">
			<div class="row">
				<div>
					<img src="${thisProduct.userId.picture}"
						style="width: 250px;" class="img-circle">
				</div>
				<div align="center">
					<ul style="list-style: none;">
						<li><h2>${thisProduct.userId.account}</h2></li>
						<li>${thisProduct.userId.name}</li>
						<li>${thisProduct.userId.nickname}</li>
						<li>${thisProduct.userId.phone}</li>
						<li>${thisProduct.userId.sex}</li>
						<li>${thisProduct.userId.email}</li>
						<li>${thisProduct.userId.schoolName}</li>
					</ul>
				</div>
			</div>

		</div>

	</div>
	<div style="text-align: center;">
		<button id="btnExchang" type="button" class="btn btn-success btn-lg">
			<span class="glyphicon glyphicon-gift" aria-hidden="true"></span>  已經收到商品囉~
		</button>
	</div>
	<br>
	<div style="text-align: center;">
		<p><button type="button" class="btn btn-primary btn-lg">確認</button></p>
	</div>
</div>

	<c:import url="/WebContent/layout/footer.jsp"></c:import>