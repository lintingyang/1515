<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WEB-INF/pages/e715/layout/header.jsp"></c:import>
<c:import url="/WEB-INF/pages/layout/meta.jsp" />
<style>
.namebox{
	width:136px;
}
.titlebox{
	width:834px;
}
tr.mailrow:hover td{
	background: #ccd9ff;
}
.maillist >li{
	width:16%;
	text-align: center;
}
.mailcheckbox{
	width:30px;
}
.importantbox{
	width:30px;
}
.deletebtn{

}
.deletebtn >span{
	line-height:40px;
	font-size:17px;
}

</style>

<div class="container">
	<div><!-- 	功能列表欄位 -->
		<br>
		<ul class="nav nav-pills maillist">
		  <li role="presentation" class="active"><button type="button" class="btn btn-danger btn-lg" data-toggle="modal" data-target="#editemail" style="width:100px;"><span >撰寫</span></button></li>
		  <li role="presentation" id="allmailbox"><a href="#">收件匣</a></li>
		  <li role="presentation"><a href="#">重要信件</a></li>
		  <li role="presentation" id="draftbox"><a href="#" >草稿</a></li>
		  <li role="presentation" id="backupbox"><a href="#">寄件備份</a></li>
		  <li role="presentation"><a href="#">垃圾桶</a></li>
		</ul>
		<hr>
	</div><!-- 	功能列表欄位END -->
	
	<div><!-- 全選與刪除欄位 -->
		<div class="checkbox col-md-1" >
    		<label><input type="checkbox" id="checkAll">&nbsp;全選</label>
		</div>
		<div class ="col-md-1 deletebtn"><span class="glyphicon glyphicon-trash"></span></div>
	</div><!-- 全選與刪除欄位END -->
	
	
	<div><!-- 	EMAIL列表 -->
	<table class="table table-hover" id="mailtable">
	</table>
	</div><!-- 	EMAIL列表END -->
</div>

<!-- 顯示郵件內文畫面 -->
<div class="modal fade" id="readmail" tabindex="-1" role="dialog" aria-labelledby="readmail" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true"></span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="mail-title"><!-- 信件title --></h4>
      </div>
      <div class="modal-body" id="mail-body">
        <!-- 寄件人，時間，內文 -->
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">關閉</button>
        <button type="button" class="btn btn-primary">回覆此信件</button>
      </div>
    </div>
  </div>
</div>
<!-- 險是郵件內文畫面END -->

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
			    <input type="text" class="form-control drop_down_btn" id="receiver" name="receiver" placeholder="收件人帳號">
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
			      <input type="checkbox" checked="checked" name="saveaslog" id="saveaslog"> 儲存寄件備份
			    </label>
			  </div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal" id="submitmail">送出</button>
	        <button type="button" class="btn btn-primary" data-dismiss="modal" id="savedraft">儲存為草稿</button>
	      </div>
     </form> <!--  FORM撰寫EMAIL表單END -->
    </div>
  </div>
</div>
<!-- 編輯郵件畫面END -->

<!-- 編輯草稿畫面 -->
<div class="modal fade" id="draftemail" tabindex="-1" role="dialog" aria-labelledby="editmail" aria-hidden="true">
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
			    <input type="email" class="form-control" id="drafttitle" name="title" placeholder="輸入主旨">
			  </div>
			  
			  <div class="form-group">
			    <label for="reciver">收件人</label>
			    <input type="text" class="form-control drop_down_btn" id="draftreceiver" name="receiver" placeholder="收件人帳號">
				<div class="input_select_block" style="z-index:3;position: fixed;width:100%;">  
				        <ul class="dropdownfriendlist" >  
						 </ul>  
				    </div>  
			  </div>
			  
			  <div class="form-group">
			    <label for="exampleInputFile">內文</label>
			    <textarea  class= "form-control" rows="10" cols="" name="article" id="draftarticle"></textarea>
			    <p class="help-block">請輸入1000字以內的內文</p>
			  </div>
			  
			  <div class="checkbox">
			    <label>
			      <input type="checkbox" checked="checked" name="saveaslog" id="saveaslog"> 儲存寄件備份
			    </label>
			  </div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal" id="submitbackup">送出</button>
	        <button type="button" class="btn btn-primary" data-dismiss="modal" id="savedraft">儲存為草稿</button>
	      </div>
     </form> <!--  FORM撰寫EMAIL表單END -->
    </div>
  </div>
</div>
<!-- 編輯草稿畫面 END -->
  
<script>
//onload
$(function(){
	mailboxlist();//顯示所有郵件
})//end of onload
$("#allmailbox").click(function(){
	mailboxlist();//顯示所有郵件
})
//好友的下拉選單 
$(".drop_down_btn").click(function(e){  
    e.stopPropagation();   
    $dropList=$(".input_select_block ul");   
    if($dropList.is(":visible")){   
        $dropList.hide();   
    }else{   
        $dropList.show();   
    };   
});   
 
$(".friendli").click(function(e){   
    e.stopPropagation();   
    $("#receiver").val($(this).text());   
    $(".input_select_block ul").hide();   
}); 
$(function(){
	$.ajax({
		contentType : "application/json",
		url : "/E715Member/userFriendList",
		dataType : "json",
		type : "post",
		data : "",
		success :function(data){
			$.each(data,function(i){
				console.log(data[i].userBId.account);
				var name = $("<small style='color:gray'>("+data[i].userBId.nickname+")</small>")
				var friend = $("<li></li>").text(data[i].userBId.account).addClass("friendli")
				.attr("name",data[i].userBId.account).append(name);
				$(".dropdownfriendlist").append(friend);
				$(".friendli[name="+data[i].userBId.account+"]").bind("click",function(e){   
				    e.stopPropagation();   
				    $("#receiver").val($(this).attr("name"));   
				    $(".input_select_block ul").hide();   
				}); 
			})
		}
	})
})
//好友的下拉選單 END



//按下寄出郵件
$("#submitmail").click(function(){
	swal({
			type : "success",
			title: "郵件寄出",  
			text: "成功幫您寄出郵件!",  
			timer: 1000,   
			showConfirmButton: false
		},function(){
			$.ajax({
				dataType: "json",
				type: "get",
				url: "/mail/newmail",
				data: {
					senderId : ${user.id},
					receiverAccount : $("#receiver").val(),
					title : $("#title").val(),
					article : $("#article").val(),
					saveAsLog :$("#saveaslog").prop("checked")},
					
			});
			location.href="/mail/list";
		})

})//按下寄出郵件END

//按下儲存草稿
$("#savedraft").click(function(){
	swal({
			type : "success",
			title: "儲存草稿",  
			text: "成功幫您儲存為草稿!",  
			timer: 1000,   
			showConfirmButton: false
		},function(){
			$.ajax({
				dataType: "json",
				type: "get",
				url: "/mail/savedraft",
				data: {
					senderId : ${user.id},
					receiverAccount : $("#receiver").val(),
					title : $("#title").val(),
					article : $("#article").val()},
			});
			location.href="/mail/list";
		})
	
})//按下儲存草稿END

//顯示收件匣
function mailboxlist(){
	
	var formData={"id":${user.id}};
    	$.ajax({
       		type: "GET",
       		url: "/mail/getmail",
      		data: formData,
       		success: function(data){
       		
    			showmail(data);	
    		},
    	dataType: "json",
   	 	contentType : "application/json"
    });
   
}
function showmail(data){
	var index = 0;
	$("#mailtable").html("");
	$.each(data, function(){
		var star = null;
		console.log(this.isImportant);
		if (this.isImportant == "TRUE"){
			star = "<span class='glyphicon glyphicon-star'></span>";
		} else {
			star = "<span class='glyphicon glyphicon-star-empty'></span>";
		}
		var sendTime = this.sendTime.year + "/" + this.sendTime.monthValue + "/" + this.sendTime.dayOfMonth;

		var mailRow = "<tr class='mailrow'>" +
						"<td class='mailcheckbox'><input type='checkbox'></td>" + 
						"<td class='importantbox'>" + star + "</td>" +
						"<td>" + this.sender.nickname + "(" + this.sender.account + ")</td>" + 
						"<td class='mailBody' id='mailno" + index + "' style='cursor:pointer'>" + this.title + "//" + this.article + "</td>" +
						"<td style='text-align: right;'>" + sendTime + "</td>" +
						"</tr>";
		$("#mailtable").append(mailRow);
		index ++;
	})//end of .each
	//改變星星樣式
	$(".importantbox").on("click", function(){
		$(this).html("<span class='glyphicon glyphicon-star'>");
	})
	$(".mailBody").on("click", function(){
		var mailIndex = $(this).attr("id").substring(6);
//   	console.log(mailIndex);
// 		console.log(data);
		var mailTitle = data[mailIndex].title;
		var mailSender = data[mailIndex].sender.nickname + "&nbsp;(" + data[mailIndex].sender.account + ")";
		var mailSendTime = data[mailIndex].sendTime.year + "年" + data[mailIndex].sendTime.monthValue + "月" + data[mailIndex].sendTime.dayOfMonth + "日" +
							"&nbsp" + data[mailIndex].sendTime.hour + ":" + data[mailIndex].sendTime.minute;
		var mailArticle = data[mailIndex].article;
		$("#readmail").modal();
		$("#mail-title").empty();
		$("#mail-body").empty();
		$("#mail-title").append("<h4>"+mailTitle+"<h4>" + 
								"<div style='font-size: 12px;display: inline-block;'>" + mailSender + "</div>" + 
								"<div style='font-size: 12px; float: right;'>" + mailSendTime + "</div>");
		$("#mail-body").append("<p>"+mailArticle+"</p>");
	});
	//全選
	$("#checkAll").change(function(){
	    $("input:checkbox").prop('checked', $(this).prop("checked"));
	});
}// end of showmail

$("#draftbox").click(
	function(){
		var formData={"id":${user.id}};
	    	$.ajax({
		    	dataType: "json",
		   	 	contentType : "application/json",
	       		type: "GET",
	       		url: "/mail/getdraft",
	      		data: formData,
	       		success: function(data){
	       			console.log(data);
 	       			showdraft(data);
	    		},

	    	});
	}
)
function showdraft(data){
	var index = 0;
	$("#mailtable").html("");
	$.each(data, function(){
		var sendTime = this.draftTime.year + "/" + this.draftTime.monthValue + "/" + this.draftTime.dayOfMonth;
		var draftRow = "<tr class='mailrow' id='draft" + index + "'>" +
			"<td class='mailcheckbox'><input type='checkbox'></td>" + 
			"<td class='importantbox'><span class='glyphicon glyphicon-star-empty'></span></td>" +
			"<td class='namebox'>" + this.sender.nickname + "(" + this.sender.account + ")</td>" + 
			"<td class='titlebox'>" + this.title + "//" + this.article + "</td>" +
			"<td style='text-align: right;'>" + sendTime + "</td>" +
			"</tr>";
		$("#mailtable").append(draftRow);
		index ++;
	})//end of .each


	$(".mailrow").on("click", function(){
		var mailIndex = $(this).attr("id").substring(5);
		$("#drafttitle").text(data[mailIndex].title);
		$("#draftreceiver").text(data[mailIndex].receiver.account);
		$("#draftarticle").text(data[mailIndex].article);

	});
}
//按下草稿列表END
</script>




<c:import url="/WEB-INF/pages/e715/layout/footer.jsp"></c:import>
