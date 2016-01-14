<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WEB-INF/pages/e715/layout/header.jsp"></c:import>
<c:import url="/WEB-INF/pages/layout/meta.jsp"/>
<script>
$(function(){    
	$("#btn").click(function(){
		event.preventDefault();
		var userId="${user.id}";
		var formData={"id":userId,"messages":$("#messages").val()};
        $.ajax({
           type: "GET",
           url: "http://localhost:8080/chatroom/insertM",
           data: formData,
           success: function(data){
        	   $.each(data,function(i) {
        		   if (!($("#"+data[i].id).length)){  
        			   var $tr1 = $("<tr></tr>");
	        		   var $td1 = $("<td hidden></td>");
	        		   var $td2 = $("<td width='5%'></td>");
	        		   var $td3 = $("<td width='95%'></td>");
	        		   if(data[i].picture!=null && count<3){
	        			   count++;
	        			   var $pic = $("<img width='300'></img>");
	        			   var $txt = $("<p></p>");
	        			   $txt.text(data[i].user.name+"的圖片");
	        			   $pic.attr('src', data[i].picture);
	        			   $("#pic1").append($txt).append($pic);
	        		   }
	        		   $tr1.attr('id', data[i].id);
	        		   $td1.text(data[i].id);
	        		   $a1= $("<a>"+data[i].user.name+"</a>")
	        		   $td2.append($a1);
	        		   $a1.click(function(){
	        			   $("#messages").val("@"+data[i].user.name+"　");						
	        			});
	        		   var $time=getTime(data[i].sendTime);
	        		   $td3.html(data[i].messages + "<font color='grey'> "+$time + "</font>");
	        		   $tr1.append($td1).append($td2).append($td3);
	        		   $("#tb1").append($tr1);
        		   }
        	   });
           },
           dataType: "json",
           contentType : "application/json"
         });
    });

	function getMessages(){
		$.ajax({
	           type: "GET",
	           url: "http://localhost:8080/chatroom/list",
	           data: "",
	           success: function(data){
	        	   var count = 0;
	        	   $.each(data,function(i) {
	        		   if (!($("#"+data[i].id).length)){  
		        		   var $tr1 = $("<tr></tr>");
		        		   var $td1 = $("<td hidden></td>");
		        		   var $td2 = $("<td width='5%'></td>");
		        		   var $td3 = $("<td width='95%'></td>");
		        		   if(data[i].picture!=null && count<3){
		        			   count++;
		        			   var $pic = $("<img width='300'></img>");
		        			   var $txt = $("<p></p>");
		        			   $txt.text(data[i].user.name+"的圖片");
		        			   $pic.attr('src', data[i].picture);
		        			   $("#pic1").append($txt).append($pic);
		        		   }
		        		   $tr1.attr('id', data[i].id);
		        		   $td1.text(data[i].id);
		        		   $a1= $("<a>"+data[i].user.name+"</a>")
		        		   $td2.append($a1);
		        		   $a1.click(function(){
		        			   $("#messages").val("@"+data[i].user.name)						
		        			});
		        		   var $time=getTime(data[i].sendTime);
		        		   $td3.html(data[i].messages + "<font color='grey'> "+$time + "</font>");
		        		   $tr1.append($td1).append($td2).append($td3);
		        		   $("#tb1").append($tr1);
	        		   }
	        	   });
	           },
	           dataType: "json",
	           contentType : "application/json"
	         });
		
	}
	function getTime(data){
		var ans = "@"+data.hour+":" +data.minute;
		return ans
	}
	

	
	
	$("#clear").click(function(){
		$("#messages").val("");	
	});
	$("#upImgBtn").click(function(){
		$("#upImg1").toggle();	
	});
	$("#showImgBtn").click(function(){
		$("#pic1").toggle();	
	});
	getMessages();
 	//setInterval(getMessages, 1000);
});
</script>

<div class="container" style="margin: 50px auto;">
	<div class="col-md-7">
		<div class="row">

		<br>
		<form id="myForm" method="get">
			<input type="text" id="messages" name="messages" value=" " maxlength="199" class="form-control">
			<input type="button" id="clear" value="清除" class="btn btn-warning" style="float:right">
			<input type="submit" id="btn" value="輸入" class="btn btn-success" style="float:right">
		</form>
			<button type="button" id="upImgBtn" class="btn btn-info" >
				<span class="glyphicon glyphicon-picture" aria-hidden="true"> 上傳圖片</span>
			</button>
		</div>
		
			
		<div class="row">	
			<div id="upImg1" hidden>
				<form  action="/chatroom/insert" method="post" enctype="multipart/form-data">
				    <input type="text" name="id" size="5" placeholder="使用者ID" value="${user.id}" hidden>
					<input type="file" name="file"  required/>
					<input type="submit" value="上傳">
				</form>
			</div>
		</div>
		<div class="row">
		<table class="table table-striped">
			<thead>
				<tr>
					<th hidden>id</th>
					<th width="10%">user</th>
					<th width="90%">messages</th>
				</tr>
			</thead>
			<tbody id="tb1">
			
			
			
			</tbody>
		</table>
		</div>
	</div>
	<div class="col-md-1">
	</div>
	<div class="col-md-4">
		<div class="row">

			<button type="button" id="showImgBtn" class="btn btn-info" >
				<span class="glyphicon glyphicon-chevron-down" aria-hidden="true"> 展開圖片</span>
			</button>
			<div id="pic1" hidden>
			
			</div>
		</div>
	</div>
</div>


<c:import url="/WEB-INF/pages/e715/layout/footer.jsp"></c:import>