<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WEB-INF/pages/e715/layout/header.jsp"/>
<c:import url="/WEB-INF/pages/layout/meta.jsp" />

<link rel="stylesheet" href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
<script src="//apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="//apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>

<style>
h4{
	color:#000079;
}
#em{
	color:red;
}
/* Hide file input */
#id_image_large {
 display: none;
}
#id_image_large1 {
 display: none;
}
#id_image_large2 {
 display: none;
}
#id_image_large3 {
 display: none;
}
/* Custom upload button appearance*/
#upload {
}
</style>
<div id ="back">
<div class="container" style="margin: 50px auto;">
	<div class="alert alert-warning alert-dismissible" role="alert">
  		<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  		<strong>「除了補充圖片以外」</strong>   以下<strong>所有欄位</strong>都是<strong>必填</strong>的喔！
	</div>
	
	<form action="${pageContext.request.contextPath}/product/update" enctype="multipart/form-data" method="post">
		<div class="col-md-2"></div>
		<div class="col-md-4">
			
				<div class="form-group row">
					<label class="col-sm-6 form-control-label"><h4>商品標題/名稱</h4></label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="name" id="productName"
							placeholder="Title or Name" style="width: 300px;" required="required">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-4 form-control-label"><h4>圖片</h4></label>
					<div class="col-sm-10" align="center">
   						<img id="blah0" src="${pageContext.request.contextPath}/resources/imgs/noImg.jpg" alt="your image" style="width: 200px; height: 200px;"/>
<!--    						<img id="blah0" src="/resources/imgs/noImg.jpg" alt="your image" style="width: 200px; height: 200px;"/> -->
   						<div>
   							<label class="col-md-offset-2 col-sm-8 choose-file btn btn-sm btn-default glyphicon glyphicon-open" id="upload" for="id_image_large">
							<input type="file" id="id_image_large" class ="pPicture" name="pPicture" multiple required="required"></label>
   						</div>
					</div>
				</div>
				<div class="form-group row">
					<div><label class="col-sm-7 form-control-label"><h4>補充圖片  (可免填)</h4></label></div>
					<div class="col-sm-10" align="center">
						<div class="row">
							<div class = " col-sm-4">
   								<img id="blah1" src="${pageContext.request.contextPath}/resources/imgs/noImg.jpg" alt="your image" style="width: 50px; height: 50px; "/>
<!--    								<img id="blah1" src="/resources/imgs/noImg.jpg" alt="your image" style="width: 50px; height: 50px; "/> -->
   							</div>
   							<div class = " col-sm-4">
   								<img id="blah2" src="${pageContext.request.contextPath}/resources/imgs/noImg.jpg" alt="your image" style="width: 50px; height: 50px; "/>
<!--    								<img id="blah2" src="/resources/imgs/noImg.jpg" alt="your image" style="width: 50px; height: 50px; "/> -->
   							</div>
   							<div class = " col-sm-4">
   								<img id="blah3" src="${pageContext.request.contextPath}/resources/imgs/noImg.jpg" alt="your image" style="width: 50px; height: 50px; "/>
<!--    								<img id="blah3" src="/resources/imgs/noImg.jpg" alt="your image" style="width: 50px; height: 50px; "/> -->
							</div>
							</div>
							<div class="row">
								<label class="col-md-offset-1 col-sm-2 choose-file btn btn-sm btn-default glyphicon glyphicon-open" id="upload1" for="id_image_large1">
								<input type="file" id="id_image_large1" class ="pPicture1" name="pPicture1" multiple ></label>

								<label class="col-md-offset-2 col-sm-2 choose-file btn btn-sm btn-default glyphicon glyphicon-open" id="upload2" for="id_image_large2">
								<input type="file" id="id_image_large2" class ="pPicture2" name="pPicture2" multiple "></label>
		
								<label class="col-md-offset-2 col-sm-2 choose-file btn btn-sm btn-default glyphicon glyphicon-open" id="upload3" for="id_image_large3">
								<input type="file" id="id_image_large3" class ="pPicture3" name="pPicture3" multiple "></label>
							</div>
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
							<option value="12">運動用品</option>
							<option value="13">女生</option>
							<option value="14">男生</option>
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
						</div>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-4 form-control-label"><h4>商品描述</h4></label>
					<div class="col-sm-10">
						<textarea name="description" style="width: 300px;" id = "description"
							class="form-control" rows="8" placeholder="商品描述..." required="required" ></textarea>
					</div>
				</div>
			</div>
			
			<div class="col-md-4">
				<div class="form-group row">
					<label class="col-sm-4 form-control-label "><h4>上架與否</h4></label>
					<div class="col-sm-10">
						<div class="radio">
							<label> <input type="radio" name="postStatus" value="FALSE" id="notPost" CHECKED >暫不刊登</label>
							<label> <input type="radio" name="postStatus" value="TRUE" id="yesPost" >刊登</label> 
						</div>
					</div>
				</div>
				<div id="rightSide" style = "display: none;">
					<div>
						<p>截止日期：<input type="text" id="pDeadline" name="pDeadline"></p>
						<p style="color: red;text-align: center;">${errorMsg.timeD}</p>
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
						style="width: 300px;" >
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
				<label class="col-sm-6 form-control-label"><h4>希望換到商品</h4></label>
				<div class="col-sm-10">
					<div class="radio">
						<label> <input type="radio" name="wishItem" value="隨機">隨機</label></div>
					<div class="radio">
						<label> <input type="radio" name="wishItem" value="免費">贈送</label></div>
					<div class="radio">
						<label> <input type="radio" name="wishItem" value="希望商品" id="wish" checked>希望商品</label></div>
					<div id="divWish">
						<textarea id="pWishItem" name="pWishItem" style="width: 300px;" class="form-control" rows="8"
							placeholder="詳細敘述想要換到的商品" ></textarea>
<%-- 							<span id="em">${errorMsg.wish}</span> --%>
						</div>
					</div>
				</div>
			</div>
			<div style="text-align: center; margin:50px auto;">
				<button id="btnSend" type="submit" class="btn btn-success btn-lg">
					<span class="glyphicon glyphicon-send" aria-hidden="true"></span> 確認編輯
					<span class="glyphicon glyphicon-send" aria-hidden="true"></span>
				</button>
			</div>
		</div>
		<div class="col-md-2"></div>
	</form>
</div>
</div>
<script type="text/javascript">

	$(function() {
		
// 		$('#divWish').attr('style', 'display:none');

		if(${not empty productY.primaryPicture}){
			console.log("hello"); 
			$('#blah0').attr('src' , "${productY.primaryPicture}");//預設的商品圖片
			$(".pPicture").removeAttr('required');
		}
		if(${not empty productPicturesY[0].picture})
			$('#blah1').attr('src' , "${productPicturesY[0].picture}");//預設的商品圖片1
		if(${not empty productPicturesY[1].picture})
			$('#blah2').attr('src' , "${productPicturesY[1].picture}");//預設的商品圖片2
		if(${not empty productPicturesY[2].picture})
			$('#blah3').attr('src' , "${productPicturesY[2].picture}");//預設的商品圖片3	

			
		$('#productName').val('${productY.name}');//預設的商品名稱
		$('#description').val('${productY.description}');//預設的商品描述
		$('#pCategory').val('${productY.productCategory.id}');//預設的分類
		$("input[name=status][value='${productY.status}']").attr('checked',true);//預設的物品狀態
// 		$("input[name=postStatus][value='${productY.postStatus}']").attr('checked',true);//預設刊登與否
// 		$("input[name=wishItem][value='${productY.wishItem}']").attr('checked',true);//預設希望物品
// 		$('#pWishItem').removeAttr('required');//預設希望商品
// 		var wishItem = "${productY.wishItem}";
		
// 		if( wishItem != ("隨機" || "贈送")){
// 		$('#divWish').attr('style', '');
// 		$('#pWishItem').val('${productY.wishItem}');
// 		}

		//時間
		$('#pDeadline').datepicker();
 		
		//顯示隱藏表格
		$('input[name *= "status"]').change(function(){
			if($(this).val() == "破損"){
				$('#pStatusBad').attr('type', '').attr('required','required');
	 		}else{
	 			$('#pStatusBad').attr('type', 'hidden').removeAttr('required');
	 		}
		});
		
		//按下刊登/不刊登
		$('input[name *= "postStatus"]').change(function(){
			if($(this).val() == "TRUE"){
				$('#rightSide').css('display', 'inline');
				$('#pDeadline').attr('required','required');
				$('#location').attr('required','required');
				$('#pWishItem').attr('required','required');
	 		}else{
	 			$('#rightSide').css('display', 'none');
	 			$('#pDeadline').removeAttr('required');
	 			$('#location').removeAttr('required');
	 			$('#pWishItem').removeAttr('required');
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
		
		//picture
			function readURL(input) {
			    if (input.files && input.files[0]) {
			        var reader = new FileReader();
			        reader.onload = function (e) {
				    	$('#blah0').attr('src', e.target.result);
			        }
			        reader.readAsDataURL(input.files[0]);
			    }
			}
			function readURL1(input) {
			    if (input.files && input.files[0]) {
			        var reader = new FileReader();
			        reader.onload = function (e) {
				    	$('#blah1').attr('src', e.target.result);
			        }
			        reader.readAsDataURL(input.files[0]);
			    }
			}
			function readURL2(input) {
			    if (input.files && input.files[0]) {
			        var reader = new FileReader();
			        reader.onload = function (e) {
				    	$('#blah2').attr('src', e.target.result);
			        }
			        reader.readAsDataURL(input.files[0]);
			    }
			}
			function readURL3(input) {
			    if (input.files && input.files[0]) {
			        var reader = new FileReader();
			        reader.onload = function (e) {
				    	$('#blah3').attr('src', e.target.result);
			        }
			        reader.readAsDataURL(input.files[0]);
			    }
			}
			$(".pPicture").change(function(){
			    readURL(this);
			});
			$(".pPicture1").change(function(){
			    readURL1(this);
			});
			$(".pPicture2").change(function(){
			    readURL2(this);
			});
			$(".pPicture3").change(function(){
			    readURL3(this);
			});
			
	})//$(function()
</script>
<c:import url="/WEB-INF/pages/e715/layout/footer.jsp"></c:import>