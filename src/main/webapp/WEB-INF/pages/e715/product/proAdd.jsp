<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WEB-INF/pages/e715/layout/header.jsp"/>
<c:import url="/WEB-INF/pages/layout/meta.jsp" />

<link rel="stylesheet" href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
<script src="//apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="//apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
<link rel="stylesheet" href="jqueryui/style.css">
<style>
h4{
	color:#000079;
}
#em{
	color:red;
}
</style>
<script type="text/javascript">
	$(function() {
		//時間
		$('#pStartTime').datepicker();
		$('#pDeadline').datepicker();
		
		//顯示隱藏表格
		$('input[name *= "status"]').change(function(){
			if($(this).val() == "破損"){
				$('#pStatusBad').attr('type', '').attr('required','required');
	 		}else{
	 			$('#pStatusBad').attr('type', 'hidden').removeAttr('required');
	 		}
		});
		$('input[name *= "postStatus"]').change(function(){
			if($(this).val() == "TRUE"){
				$('#pStartTime').attr('type', '').attr('required','required');
				$('#pDeadline').attr('type', '').attr('required','required');
	 		}else{
	 			$('#pStartTime').attr('type', 'hidden').removeAttr('required');
	 			$('#pDeadline').attr('type', 'hidden').removeAttr('required');
	 		}
		});
		$('input[name *= "wishItem"]').change(function(){
			if($(this).val() == "希望商品"){
				$('#divWish').attr('style', '');
				$('#pWishItem').attr('required','required');
	 		}else{
	 			$('#divWish').attr('style', 'display:none');
	 			$('#pWishItem').removeAttr('required');
	 		}
		});
		
// 		$('#btnSend').click(function() {
// 			swal({
// 				title : "新增成功",
// 				text : "您已新增一項商品",
// 				type : "success",
// 				showCancelButton : false,
// 				confirmButtonColor : "#F5A056",
// 				closeOnConfirm : true
// 			});
// 		});
	})
</script>
<div class="container" style="margin: 50px auto;">
	<div class="alert alert-warning alert-dismissible" role="alert">
  		<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  		以下<strong>所有欄位</strong>都是<strong>必填</strong>的喔！      別忘了上傳一張精美照片～
	</div>
	<form action="/product/insert" enctype="multipart/form-data" method="post">
		<div class="col-md-1"></div>
		<div class="col-md-5">
			<div class="row">
				<div class="form-group row">
					<label class="col-sm-4 form-control-label"><h4>商品標題/名稱</h4></label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="name"
							placeholder="Title or Name" style="width: 80%;" required="required">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-4 form-control-label"><h4>商品種類</h4></label>
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
					<label class="col-sm-4 form-control-label"><h4>商品狀態</h4></label>
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
								placeholder="請敘述破損狀況.." required="required"></label>
<%-- 							<span id="em">${errorMsg.status}</span> --%>
						</div>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-4 form-control-label"><h4>商品描述</h4></label>
					<div class="col-sm-10">
						<textarea name="description" style="width: 80%;" 
							class="form-control" rows="8" placeholder="商品描述..." required="required"></textarea>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-4 form-control-label"><h4>上架與否</h4></label>
					<div class="col-sm-10">
						<div class="radio">
							<label> <input type="radio" name="postStatus" value="TRUE" id="yesPost" checked>刊登</label> 
							<label> <input type="radio" name="postStatus" value="FALSE" id="notPost" >暫不刊登</label>
						</div>
					</div>
				</div>
				<div>
					<div>
						<p>刊登日期：<input type="text" id="pStartTime" name="pStartTime" required="required">
<%-- 						<span id="em">${errorMsg.timeS}</span> --%>
						</p>
					</div>
					<div>
						<p>截止日期：<input type="text" id="pDeadline" name="pDeadline" required="required">
<%-- 						<span id="em">${errorMsg.timsD}</span> --%>
						</p>
					</div>
				</div>
			</div>
		</div>

		<div class="col-md-5">
			<div class="form-group row">
				<label class="col-sm-4 form-control-label"><h4>圖片</h4></label>
				<div class="col-sm-10">
					<input type="file" name="pPicture" multiple  required="required">
				</div>
			</div>
			<br>
			<div class="form-group row">
				<label class="col-sm-4 form-control-label"><h4>交易時段</h4></label>
				<div class="col-sm-10">
					<div class="radio">
						<label><input type="radio" name="transactionTime" value="上午" checked>上午</label>
						<label><input type="radio" name="transactionTime" value="下午">下午</label>
						<label><input type="radio" name="transactionTime" value="晚上">晚上</label>
					</div>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-4 form-control-label"><h4>交易地點</h4></label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="location"
						name="location" placeholder="ex : 地址/捷運站名/地標/學校"
						style="width: 80%;" required="required">
				</div>
			</div>
			<br>
			<div class="form-group row">
				<label class="col-sm-10 form-control-label"><h4>交易方式 (寄件費用，收件者自付)</h4></label>
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
			<div class="form-group row">
				<label class="col-sm-4 form-control-label"><h4>希望換到商品</h4></label>
				<div class="col-sm-10">
					<div class="radio">
						<label> <input type="radio" name="wishItem" value="隨機">隨機</label></div>
					<div class="radio">
						<label> <input type="radio" name="wishItem" value="免費">贈送</label></div>
					<div class="radio">
						<label> <input type="radio" name="wishItem" value="希望商品" id="wish" checked>希望商品</label></div>
					<div id="divWish">
						<textarea id="pWishItem" name="pWishItem" style="width: 90%;" class="form-control" rows="8"
							placeholder="詳細敘述想要換到的商品" required="required"></textarea>
<%-- 							<span id="em">${errorMsg.wish}</span> --%>
					</div>
				</div>
			<div style="text-align: center; margin:50px auto;">
				<button id="btnSend" type="submit" class="btn btn-success btn-lg">
					<span class="glyphicon glyphicon-send" aria-hidden="true"></span> 送出
					<span class="glyphicon glyphicon-send" aria-hidden="true"></span>
				</button>
			</div>
		</div>
		</div>
	</form>
</div>
<c:import url="/WEB-INF/pages/e715/layout/footer.jsp"></c:import>