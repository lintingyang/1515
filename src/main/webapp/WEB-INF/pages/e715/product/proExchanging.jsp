<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WebContent/layout/header.jsp"></c:import>

<div class="container" style="margin: 50px auto;">
	<div class="row">
		<div class="col-md-3">
			<div class="row">
				<div>
					<img src="${exchange.productBId.userId.picture}"
						style="width:250px;" class="img-circle">
				</div>
				<div align="center">
					<ul style="list-style: none;">
						<li><h2>${exchange.productBId.userId.account}</h2></li>
						<li>${exchange.productBId.userId.name}</li>
						<li>${exchange.productBId.userId.nickname}</li>
						<li>${exchange.productBId.userId.phone}</li>
						<li>${exchange.productBId.userId.sex}</li>
						<li>${exchange.productBId.userId.email}</li>
						<li>${exchange.productBId.userId.schoolName}</li>
					</ul>
				</div>
			</div>
		</div>

		<div class="col-md-6">
			<div class="col-md-6">
				<blockquote>
				  <p>${exchange.productBId.description}</p>
				  <footer>A${exchange.productBId.name}</footer>
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
				  <dd>${exchange.tradeFinishedTime}</dd>
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
		<p><button type="button" class="btn btn-primary btn-lg"
			onclick="javascript:location.href='${thisProduct.id}'">回您交易的商品頁</button></p>
	</div>
</div>

	<c:import url="/WebContent/layout/footer.jsp"></c:import>