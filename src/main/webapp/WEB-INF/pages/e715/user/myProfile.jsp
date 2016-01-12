<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WEB-INF/pages/e715/layout/header.jsp"></c:import>
<c:import url="/WEB-INF/pages/layout/meta.jsp"/>
<link rel="stylesheet" href="/resources/css/user.css" />
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
					<li><a href="#"><span class="glyphicon glyphicon-envelope iconpme" ></span></a> 
						<a href="#" onclick="addFriend(event);"><span class="glyphicon glyphicon-plus iconpme"  style="margin-left: 20px;"></span></a></li>
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

<div class='bb'></div>
<div class='message'>
  <div class='check'>
    &#10004;
  </div>
  <p>
    	成功
  </p>
  <p>
    	你已成功加入關注清單！
  </p>
  <button id='ok'>
    OK
  </button>
</div>

</div>

<script type="text/javascript">

$(function() {
	$.ajax({
		contentType : "application/json",
		url : "/product/query",
		dataType : "json",
		type : "get",
		data : {"id" : "${currUser.id}"},
		success : function(data) {
			$("#itemContainer").html('');
			$.each(data,
				function(i) {
				var productdiv = $("<div></div>");
				var aclick = $("<a>").attr("href","/product/" + data[i].id);
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
		url : "/queryimg",
		dataType : "json",
		type : "get",
		data : formData,
		success : function(data) {

			if (data[0] != null) {
				console.log(data[0].picture);
				$(prodimg).attr("src", data[0].picture);
			}
		}
	});
}

function addFriend (e) {
    e.preventDefault();
    var formData = {
			"id" : "${currUser.id}"
    }
    
//     swal({
// 		title: "Are you sure?",
// 		text: "是否確定刪除此筆資料？",
// 		type: "warning",
// 		showCancelButton: true,
// 		confirmButtonColor: "#F5A056",
// 		closeOnConfirm: true
// 	}, function() {
// 		$delBtn.button('loading');
// 		$.delete_(url+ "/" + row.id, function() {
// 			$delBtn.button('reset');
// 			$("#slGrid").trigger('reloadGrid');
// 		});
// 	});
    
    $.ajax({
		contentType : "application/json",
		url : "/E715Member/userFriendListAdd",
		dataType : "text",
		type : "get",
		data : formData,
		success : function(data) {
			if(data=="Sucess"){
				go(50);
				$('#ok').click(function(){go(50)});
				function go(nr) {
				  $('.message').toggleClass('comein');
				  $('.check').toggleClass('scaledown');
				  $('#go').fadeToggle(nr);
				}
			}
		}
	});
}


</script>
<c:import url="/WEB-INF/pages/e715/layout/footer.jsp"></c:import>