<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WEB-INF/pages/e715/layout/header.jsp"></c:import>
<c:import url="/WEB-INF/pages/layout/meta.jsp"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user.css" />
<style>
/* body, html { */
/*   height: 100%; */
/*   font-size: 20px; */
/*   font-family: Source Sans Pro; */
/* } */
/* http://jsfiddle.net/i_heart_php/x8f0dqun/ */
#go {
  position: absolute;
  top: 30px;
  left: 50%;
  transform: translate(-50%, 0%);
  color: white;
  border: 0;
  background: #71c341;
  width: 100px;
  height: 30px;
  border-radius: 6px;
  font-size: 1rem;
  transition: background 0.2s ease;
  outline: none;
}
#go:hover {
  background: #8ecf68;
}
#go:active {
  background: #5a9f32;
}

.message {
  position: absolute;
  top: -200px;
  left: 50%;
  transform: translate(-50%, 0%);
  width: 300px;
  background: white;
  border-radius: 8px;
  padding: 30px;
  text-align: center;
  font-weight: 300;
  color: #2c2928;
  opacity: 0;
  transition: top 0.3s cubic-bezier(0.31, 0.25, 0.5, 1.5), opacity 0.2s ease-in-out;
}
.message .check {
  position: absolute;
  top: -20px;
  left: 50%;
  transform: translate(-50%, -50%) scale(4);
  width: 120px;
  height: 110px;
  background: #71c341;
  color: white;
  font-size: 5.8rem;
  padding-top: 10px;
  border-radius: 50%;
  opacity: 0;
  transition: transform 0.2s 0.25s cubic-bezier(0.31, 0.25, 0.5, 1.5), opacity 0.1s 0.25s ease-in-out;
}
.message .scaledown {
  transform: translate(-50%, -50%) scale(1);
  opacity: 1;
}
.message p {
  margin: 25px 0px;
  padding: 0;
}
.message p:nth-child(2) {
  margin: 40px 0px 0px 0px;
}
.message #ok {
  position: relative;
  color: white;
  border: 0;
  background: #71c341;
  width: 100%;
  height: 50px;
  border-radius: 6px;
  font-size: 1.2rem;
  transition: background 0.2s ease;
  outline: none;
}
.message #ok:hover {

  background: #8ecf68;
}
.message #ok:active {
  background: #5a9f32;
}

.comein {
  top: 150px;
  opacity: 1;
}


</style>
<div class="container" style="margin: 50px auto;">

	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<div class="col-md-3"></div>
			<div class="col-md-3" style="text-align: center;margin-top:20px;">
				<img class="img-circle" style="width: 120px;"
					src="${currUser.picture}">
			</div>
			<div class="col-md-6">
				<br> 
				<ul style="list-style: none;">
					<li>
						<c:if test="${currUser.id ne user.id}">
						<a id ="sendmail" href="#"><span class="glyphicon glyphicon-envelope iconpme" ></span></a> 
							<c:if test="${!relation}">
								<a href="#" onclick="addFriend(event);" class="addFriend"><span class="glyphicon glyphicon-plus iconpme"  style="margin-left: 20px;"></span></a>
							</c:if>
						</c:if>
					</li>
					<li><h4>${currUser.name}</h4></li>
					<li><span style="color: gray;">${currUser.schoolName}</span><br></li>


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
				<h4 style="color: gray;">${currUser.account}</h4>	
				</div>
				<div class="row">
					<div class="col-md-1"></div>
					<div class="col-md-5">
						<span class="glyphicon glyphicon-thumbs-up iconpro">${good}</span><span
							class="badge"></span>
					</div>
					<div class="col-md-5">
						<span class="glyphicon glyphicon-thumbs-down iconpro">${bad}</span>
					</div>
					<div class="col-md-1"></div>
				</div>
			</div>
			<div class="col-md-6"><span style="margin-left:40px;color:gray;">${currUser.aboutMe}</span></div>
		</div>
		<div class="col-md-1"></div>
	</div>
	


	<hr>

	<div class="row">
			<div id="itemContainer">

			</div>
		<div class="holder"></div>
	</div>


</div>



<!-- 編輯郵件畫面 -->
<div class="modal fade" id="editemail" tabindex="-1" role="dialog" aria-labelledby="editmail" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true"> </span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="editmail">編輯郵件</h4>
      </div>
      <form role="form"><!--  FORM撰寫EMAIL表單 -->
	      <div class="modal-body">
			  <div class="form-group">
			  	<label for="exampleInputEmail1">主旨</label>
			    <input type="email" class="form-control" id="title" name="title" placeholder="輸入主旨">
			  </div>
			  
			  <div class="form-group">
			    <label for="reciver">收件人</label>
			    <input type="text" class="form-control drop_down_btn" id="receiver" name="receiver" placeholder="收件人帳號" value="${currUser.account}">
				<div class="input_select_block" style="z-index:3;position: fixed;width:100%;">  
				        <ul class="dropdownfriendlist" >  
						 </ul>  
				    </div>  
			  </div>
			  
			  <div class="form-group">
			    <label for="exampleInputFile">內文</label>
			    <textarea  class= "form-control" rows="10" cols="" name="article" id="article"></textarea>
			    <p class="help-block">請輸入1000字以內的內文</p>
			  </div>
			  
			  <div class="checkbox">
			    <label>
			      <input type="checkbox" checked="checked" name="saveaslog" class="saveaslog"> 儲存寄件備份
			    </label>
			  </div>
	      </div>
	      <div class="modal-footer">
     
	        <button type="button" class="btn btn-default" data-dismiss="modal" id="savedraft">儲存為草稿</button>
	        <button type="button" class="btn btn-primary" data-dismiss="modal" id="submitmail">送出</button>
	      </div>
     </form> <!--  FORM撰寫EMAIL表單END -->
    </div>
  </div>
</div>
<!-- 編輯郵件畫面END -->
<script type="text/javascript">


$("#sendmail").click(function(){
	$("#editemail").modal();
})

//按下寄出郵件
$("#submitmail").click(function(){

			$.ajax({
				dataType: "json",
				type: "get",
				url: "${pageContext.request.contextPath}/mail/newmail",
				data: {
					senderId : ${user.id},
					receiverAccount : $("#receiver").val(),
					title : $("#title").val(),
					article : $("#article").val(),
					saveAsLog :$(".saveaslog").prop("checked"),
					logmailid : 0},
	
			});
			swal("郵件寄出!", "已經將您的郵件寄出!", "success");
})//按下寄出郵件END

//按下儲存草稿
$("#savedraft").click(function(){
			$.ajax({
				dataType: "json",
				type: "get",
				url: "${pageContext.request.contextPath}/mail/savedraft",
				data: {
					senderId : ${user.id},
					receiverAccount : $("#receiver").val(),
					title : $("#title").val(),
					article : $("#article").val()},
		})
		swal("儲存草稿!", "已經將您的郵件儲存為草稿!", "success");
	
})//按下儲存草稿END
$(function() {
	$.ajax({
		contentType : "application/json",
		url : "${pageContext.request.contextPath}/product/query",
		dataType : "json",
		type : "get",
		data : {"id" : "${currUser.id}"},
		success : function(data) {
			$("#itemContainer").html('');
			$.each(data,
				function(i) {
				var productdiv = $("<div></div>");
				var aclick = $("<a>").attr("href","${pageContext.request.contextPath}/product/" + data[i].id);
				var productimg = $("<img>").addClass("prodimg");
				var p = $("<span>").text(data[i].name);
				$(aclick).append($(productimg)).append($(p));
				$(productdiv).addClass("proddiv").append($(aclick));

				$("#itemContainer").append(productdiv);
				getpicture(data[i], productimg);})

				$("div.holder").jPages({
						containerID : "itemContainer",
						perPage : 4,
						fallback : 500,
						first : "第一頁",
						previous : "上一頁",
						next : "下一頁",
						last : "最後頁",
					});
			
				}
			});

		});
function getpicture(prod, prodimg) {
	var formData = {
		"id" : prod.id
	}
	$.ajax({
		contentType : "application/json",
		url : "${pageContext.request.contextPath}/queryproductimg",
		dataType : "json",
		type : "get",
		data : formData,
		success : function(data) {

			if (data != null) {
				console.log(data.primaryPicture);
				$(prodimg).attr("src", data.primaryPicture);
			}
		}
	});
}

function addFriend (e) {
    e.preventDefault();
    var formData = {
			"id" : "${currUser.id}"
    }
    if("${user.id}"==""){
    	window.location.href = "/head/login";
    } 
    if("${user.id}"!="${currUser.id}"){
	    $.ajax({
			contentType : "application/json",
			url : "${pageContext.request.contextPath}/E715Member/userFriendListAdd",
			dataType : "text",
			type : "get",
			data : formData,
			success : function(data) {
				if(data=="Sucess"){
// 					go(50);
// 					$('#ok').click(function(){go(50)});
// 					function go(nr) {
// 					  $('.message').toggleClass('comein');
// 					  $('.check').toggleClass('scaledown');
// 					  $('#go').fadeToggle(nr);
// 					}
					swal("成功!", "成功加入關注清單！", "success")
					$('.addFriend').remove();
					
					
				}
			}
		});
    }
}
</script>



<c:import url="/WEB-INF/pages/e715/layout/footer.jsp"></c:import>