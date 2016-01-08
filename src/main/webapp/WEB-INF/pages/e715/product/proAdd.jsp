<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WEB-INF/pages/e715/layout/header.jsp"/>
<c:import url="/WEB-INF/pages/layout/meta.jsp" />
<script type="text/javascript">
	$(function() {
		$('#bad').focusin(function(){
			$('#pStatusBad').attr('type', 'text');
		});
		$('#bad').focusout(function(){
			$('#pStatusBad').attr('type', 'hidden');
		});
		$('#wish').focusin(function(){
			$('#divWish').attr('style', '');
		});
		$('#wish').focusout(function(){
			$('#divWish').attr('style', 'display:none');
		});
		$('#notPost').focusin(function(){
			$('#divDeadline').attr('style', 'display:none');
		});
		$('#notPost').focusout(function(){
			$('#divDeadline').attr('style', '');
		});
		
		
		
		
		$('#btnSend').click(function() {
			swal({
				title : "新增成功",
				text : "您已新增一項商品",
				type : "success",
				showCancelButton : false,
				confirmButtonColor : "#F5A056",
				closeOnConfirm : true
			});
		})
	})
</script>
<div class="container" style="margin: 50px auto;">
	<p>${result} </p>
	<form action="/product/insert" enctype="multipart/form-data" method="post">
		<div class="col-md-1"></div>
		<div class="col-md-5">
			<div class="row">
				<div class="form-group row">
					<label class="col-sm-3 form-control-label">商品標題/名稱</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="name"
							placeholder="Title or Name" style="width: 80%;">${errorMsg.name}
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
							<label> <input type="radio" name="status" value="全新" checked>全新</label></div>
						<div class="radio">
							<label> <input type="radio" name="status" value="九成新">九成新</label></div>
						<div class="radio">
							<label> <input type="radio" name="status" value="使用過">使用過</label></div>
						<div class="radio">
							<label> <input type="radio" name="status" value="破損" id="bad">破損 &nbsp;
							<input type="hidden" class="form" id="pStatusBad" name="pStatusBad" 
								placeholder="請敘述破損狀況.."></label></div>
					</div>
				</div>
				<div>
					<label>商品描述</label>
					<textarea name="description" style="width: 80%;" 
						class="form-control" rows="8" placeholder="商品描述..."></textarea>
				</div>
				<br>
				<div class="form-group row">
				<label class="col-sm-4 form-control-label">上架與否</label>
				<div class="col-sm-10">
					<div class="radio">
						<label> <input type="radio" name="postStatus" value="TRUE" checked>刊登</label> 
						<label> <input type="radio" name="postStatus" value="FALSE" id="notPost">暫不刊登</label>
					</div>
				</div>
				</div>
				<div class="form-group row" id="divDeadline">
					<label for="inputEmail3" class="col-sm-3 form-control-label">交易期限</label>
					<div class="col-sm-10">
						西元<input type="text" name="pyyyy" placeholder="2016" size="4" maxlength="4">年
						<input type="text" name="pMM" placeholder="12" size="2" maxlength="2">月
						<input type="text" name="pdd" placeholder="31" size="2" maxlength="2">日
						<input type="text" name="pHH" placeholder="23" size="2" maxlength="2">時
						<input type="text" name="pmm" placeholder="59" size="2" maxlength="2">分
					</div>
				</div>
			</div>
		</div>

		<div class="col-md-5">
			<div class="form-group row">
				<label class="col-sm-3">圖片</label>
				<div class="col-sm-10">
					<input type="file" name="pPicture" multiple>
				</div>
			</div>
			<br>
			<div class="form-group row">
				<label class="col-sm-3">交易時段</label>
				<div class="col-sm-10">
					<div class="radio">
						<label><input type="radio" name="transactionTime" value="上午" checked>上午</label>
						<label><input type="radio" name="transactionTime" value="下午">下午</label>
						<label><input type="radio" name="transactionTime" value="晚上">晚上</label>
					</div>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-3 form-control-label">交易地點</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="location"
						name="location" placeholder="ex : 地址/捷運站名/地標/學校"
						style="width: 80%;">
				</div>
			</div>
			<br>
			<div class="form-group row">
				<label class="col-sm-10 form-control-label">交易方式
					(寄件費用，收件者自付)</label>
				<div class="col-sm-10">
					<select name="tradeWay">
						<option value="面交">面交</option>
						<option value="宅急便">宅急便</option>
						<option value="超商">超商</option>
						<option value="郵寄">郵寄</option>
					</select>
				</div>
			</div>
			<br>
			<div>
				<label>希望換到商品</label>
				<div class="radio">
					<label> <input type="radio" name="wishItem" value="隨機" checked>隨機</label></div>
				<div class="radio">
					<label> <input type="radio" name="wishItem" value="NULL">贈送</label></div>
				<div class="radio">
					<label> <input type="radio" name="wishItem" value="希望商品" id="wish">希望商品</label></div>
				<div id="divWish" style="display:none">
					<textarea name="pWishItem" style="width: 80%;" class="form-control" rows="8"
						placeholder="詳細敘述想要換到的商品"></textarea></div>
				</div>
			<div style="text-align: center; margin:50px auto;">
				<button id="btnSend" type="submit" class="btn btn-success btn-lg">
					<span class="glyphicon glyphicon-send" aria-hidden="true"></span> 送出
					<span class="glyphicon glyphicon-send" aria-hidden="true"></span>
				</button>
			</div>
		</div>
	</form>
</div>
<c:import url="/WEB-INF/pages/e715/layout/footer.jsp"></c:import>