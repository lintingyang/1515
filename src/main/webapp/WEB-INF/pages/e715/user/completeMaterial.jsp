<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WEB-INF/pages/e715/layout/header.jsp" />
<c:import url="/WEB-INF/pages/layout/meta.jsp" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/user.css" />
<style>
#inputDep {
	width: 40%;
}

#inputAddr {
	width: 40%;
}

#inputName {
	width: 40%;
}

#inputNickName {
	width: 40%;
}

.fileImg {
	margin-top: 8px;
	margin-bottom: 0px;
}
</style>





<div class="container">
	<div class="row">
		<div class="col-xs-6 col-md-2"></div>

		<div class="col-xs-6 col-md-8" id="divCenter">
			<form class="form-horizontal">
				<div class="form-group" id="divBorder">
					<label for="inputEmail3" class="col-sm-2 control-label">系所:</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="subject" name="subject"
							placeholder="輸入系所">
					</div>
				</div>
				<div class="form-group" id="divBorder">
					<label for="inputPassword3" class="col-sm-2 control-label">地址:</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="inputAddr" name="addr"
							placeholder="輸入地址">
					</div>
				</div>
				<div class="form-group" id="divBorder">
					<label class="col-sm-2 control-label">頭像:</label>
					<div class="col-sm-10 fileImg">
						<input type="file" id="userOwnerFile" name="file">
					</div>
					<div class="col-md-2" id="showUserPhoto">
					<img class="img-circle" id="dropZone" name="headPortrait"
				style="width: 100px">
					
					</div>
				</div>

				<div class="form-group" id="divBorder">
					<label for="inputPassword3" class="col-sm-2 control-label">關於我</label>
					<div class="col-sm-10">
						<textarea rows="10" cols="70" name="aboutMe"
							onKeyDown='if (this.value.length>=300){event.returnValue=false}'></textarea>
					</div>
				</div>
				<br> <br> <br> <br> <br> <br> <br>

				<div class="form-group" id="divBorder">
					<div class="col-sm-offset-2 col-sm-10 btnLeft">
						<button type="button" class="btn btn-default" id="missionComplete">完成</button>
					</div>
				</div>

			</form>

		</div>

		<div class="col-xs-6 col-md-2"></div>
	</div>
</div>


<script>
	$(function() {
		$('#userOwnerFile').on('change',function(){
			
			var getTheFiles = $('#userOwnerFile').files;
            for (var i = 0; i < getTheFiles.length ; i++) {

                var reader = new FileReader();
                reader.readAsDataURL(getTheFiles[i]);
                reader.onload = function (e) {
                var temp = e.target.result;
                $('#headPortrait').attr("src", temp);
                }
            }
			
		})
		
		
		
		
		$("#missionComplete").on('click', function() {
			swal({
			title : "確定要送出資料嗎?",
			text : "",
			type : "info",
			showCancelButton : true,
			//confirmButtonColor : "#DD6B55",
			confirmButtonText : "YES",
			closeOnConfirm : false,
			showLoaderOnConfirm: true,
			},function() {
				swal({
					type : "success",
					title: "修改成功",  
					text: "",  
					timer: 3000,   
					showConfirmButton: false
				});

				setTimeout(function(){$('#missionComplete').submit();}, 1000);
					
					//function下括弧
					}
				)
					//on下括弧
			});
		//onload下括弧
		});

</script>
<c:import url="/WEB-INF/pages/e715/layout/footer.jsp"></c:import>