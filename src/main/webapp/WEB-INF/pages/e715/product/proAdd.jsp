<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WEB-INF/pages/e715/layout/header.jsp"></c:import>
<head>
<script type="text/javascript">
	$(function() {
		$('#btnSend').click(function() {
			console.log("search!");
			$.ajax({
				type : "post",
				contentType : 'application/json',
				url : '/product/insert',
				dataType : 'text',
				data : JSON.stringify({
					name : $('#pName').val(),
// 					id : $('#pCategory').val(),
					status : $('input[name=pStatus]:checked').val() +"(" +$('#badStatus').val()+ ")",
					description : $('#pDescription').val(),
					deadline : $('#pDeadline').val(),
// 					$('input[name=radio使用的name的值]:checked').val()
// 					location : $('#pLocation').val(),
// 					location : $('#pLocation').val(),
// 					location : $('#pLocation').val(),
// 					location : $('#pLocation').val(),
// 					location : $('#pLocation').val(),
// 					location : $('#pLocation').val(),
// 					location : $('#pLocation').val(),
					location : $('#pLocation').val(),
				}),
				success : function(data) {
					console.log(data);
// 					$('table').html('');
//  					var body = $('body');
//  					var message = $('<h3></h3>').text(data);
//  					$(body).append(message);
				}
			})
		});
	})
</script>
</head>
<div class="container" style="margin: 50px auto;">
	<form>
		<div class="col-md-1"></div>
		<div class="col-md-5">
			<!-- 			<div class="row"> -->
			<!-- 				<div> -->
			<!-- 					<img src="/resources/imgs/phone.jpg" -->
			<!-- 						style="width: 400px;"> -->
			<!-- 				</div> -->
			<!-- 			</div> -->
			<!-- 			<div class="row"> -->
			<!-- 				<ul class="nav navbar-nav">  -->
			<!-- 					<li><a class="thumbnail" href="#"><img class="smaimg" -->
			<!-- 							src="/resources/imgs/phone.jpg"></a></li> -->
			<!-- 					<li><a class="thumbnail" href="#"><img class="smaimg" -->
			<!-- 							src="/resources/imgs/phone.jpg"></a></li> -->
			<!-- 					<li><a class="thumbnail" href="#"><img class="smaimg" -->
			<!-- 							src="/resources/imgs/phone.jpg"></a></li> -->
			<!-- 					<li><a class="thumbnail" href="#"><img class="smaimg" -->
			<!-- 							src="/resources/imgs/phone.jpg"></a></li> -->
			<!-- 				</ul> -->
			<!-- 			</div> -->

			<div class="row">
				<div class="form-group row">
					<label class="col-sm-3 form-control-label">商品標題/名稱</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="pName" name="pName"
							placeholder="Title or Name" style="width: 80%;">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-3 form-control-label">商品種類</label>
					<div class="col-sm-10">
						<select id="pCategory" name="pCategory">
							<option value="1">3C產品</option>
							<option value="2">課本書籍</option>
							<option value="3">遊戲影音</option>
							<option value="4">日常用品</option>
							<option value="5">文具用品</option>
							<option value="6">傢俱</option>
							<option value="7">家電</option>
							<option value="8">服飾</option>
							<option value="9">食品</option>
							<option value="10">票劵</option>
							<option value="11">化妝保養用品</option>
						</select>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-3">商品狀態</label>
					<div class="col-sm-10">
						<div class="radio">
							<label> <input type="radio" name="pStatus" id="s1"
								value="全新"> 全新
							</label>
						</div>
						<div class="radio">
							<label> <input type="radio" name="pStatus" id="s2"
								value="九成新"> 九成新
							</label>
						</div>
						<div class="radio">
							<label> <input type="radio" name="pStatus" id="s3"
								value="使用過"> 使用過
							</label>
						</div>
						<div class="radio">
							<label> <input type="radio" name="pStatus" id="s4"
								value="破損"> 破損： <input type="text" class="form"
								id="badStatus" name="pStatusBad" placeholder="請敘述破損狀況..">
							</label>
						</div>
					</div>
				</div>
				<div>
					<label>商品描述</label>
					<textarea id="pDescription" style="width: 80%;" class="form-control" rows="8"
						placeholder="商品描述..."></textarea>
				</div>
				<br>
				<div class="form-group row">
					<label for="inputEmail3" class="col-sm-3 form-control-label">交易期限</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="pDeadline"
							name="pDeadLine" placeholder="ex : 2016-01-01"
							style="width: 80%;">
					</div>
				</div>

			</div>
		</div>

		<div class="col-md-5">
			<div class="form-group row">
				<label class="col-sm-3">交易時段</label>
				<div class="col-sm-10">
					<div class="radio">
						<label><input type="radio" name="transTime" value="上午">上午</label>
						<label><input type="radio" name="transTime" value="下午">下午</label>
						<label><input type="radio" name="transTime" value="晚上">晚上</label>
					</div>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-3 form-control-label">交易地點</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="pLocation"
						name="pLocation" placeholder="ex : 地址/捷運站名/地標/學校"
						style="width: 80%;">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-10 form-control-label">交易方式
					(寄件費用，收件者自付)</label>
				<div class="col-sm-10">
					<select name="pTradeStatus">
						<option value="面交">面交</option>
						<option value="宅急便">宅急便</option>
						<option value="超商">超商</option>
						<option value="郵寄">郵寄</option>
					</select>
				</div>
			</div>
			<div>
				<label>希望換到商品</label>
				<div class="radio">
					<label> <input type="radio" name="pWishItem" id="w1"
						value="隨機" checked> 隨機
					</label>
				</div>
				<div class="radio">
					<label> <input type="radio" name="pWishItem" id="w2"
						value="NULL"> 贈送
					</label>
				</div>
				<div class="radio">
					<label> <input type="radio" name="pWishItem" id="w3"
						value="希望商品"> 希望商品：
					</label>
				</div>
				<textarea style="width: 80%;" class="form-control" rows="8"
					placeholder="詳細敘述想要換到的商品"></textarea>
			</div>
			<br>
			<div class="form-group row">
				<label class="col-sm-4 form-control-label">上架與否</label>
				<div class="col-sm-10">
					<div class="radio">
						<label> <input type="radio" name="pPost" id="p1"
							value="TRUE"> 刊登
						</label> <label> <input type="radio" name="pPost" id="p2"
							value="FALSE"> 暫不刊登
						</label>
					</div>
				</div>
			</div>
		</div>
	</form>
	<div class="col-md-1"></div>

</div>
<div style="text-align: center; margin-bottom: 50px;">
	<button id="btnSend" type="button" class="btn btn-success btn-lg">
		<span class="glyphicon glyphicon-send" aria-hidden="true"></span> 送出
		<span class="glyphicon glyphicon-send" aria-hidden="true"></span>
	</button>
</div>

<c:import url="/WEB-INF/pages/e715/layout/footer.jsp"></c:import>