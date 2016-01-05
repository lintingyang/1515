<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WebContent/layout/header.jsp"></c:import>

<div class="container" style="margin: 50px auto;">
	<form>
		<div class="col-md-1"></div>
		<div class="col-md-5">
			<div class="row">
				<div>
					<img src="/resources/imgs/phone.jpg"
						style="width: 400px;">
				</div>
			</div>
			<div class="row">
				<ul class="nav navbar-nav"> 
					<li><a class="thumbnail" href="#"><img class="smaimg"
							src="/resources/imgs/phone.jpg"></a></li>
					<li><a class="thumbnail" href="#"><img class="smaimg"
							src="/resources/imgs/phone.jpg"></a></li>
					<li><a class="thumbnail" href="#"><img class="smaimg"
							src="/resources/imgs/phone.jpg"></a></li>
					<li><a class="thumbnail" href="#"><img class="smaimg"
							src="/resources/imgs/phone.jpg"></a></li>
				</ul>
			</div>

			<div class="row">

				<div class="form-group row">
					<label for="inputEmail3" class="col-sm-3 form-control-label">商品標題</label>
					<div class="col-sm-10">
						<input type="email" class="form-control" id="inputEmail3"
							placeholder="Title" style="width: 50%;">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-3">商品狀態</label>
					<div class="col-sm-10">
						<div class="radio">
							<label> <input type="radio" name="gridRadios"
								id="gridRadios1" value="option1" checked> 全新
							</label>
						</div>
						<div class="radio">
							<label> <input type="radio" name="gridRadios"
								id="gridRadios2" value="option2"> 九成新
							</label>
						</div>
						<div class="radio">
							<label> <input type="radio" name="gridRadios"
								id="gridRadios2" value="option2"> 使用過
							</label>
						</div>
						<div class="radio">
							<label> <input type="radio" name="gridRadios"
								id="gridRadios2" value="option2"> 破損： <input
								type="email" class="form" id="inputEmail3"
								placeholder="請詳細敘述商品狀況..">
							</label>
						</div>

					</div>
				</div>
				<div>
					<label>商品描述</label>
					<textarea style="width: 80%;" class="form-control" rows="8"
						placeholder="商品描述..."></textarea>
				</div>



			</div>
		</div>


		<div class="col-md-5">
			<div class="form-group row">
				<div class="col-sm-10">
					<div class="checkbox">
						<label> <input type="checkbox"> 刊登
						</label>
					</div>
				</div>
			</div>

			<div class="form-group row">
				<label for="inputEmail3" class="col-sm-3 form-control-label">交易期限</label>
				<div class="col-sm-10">
					<input type="email" class="form-control" id="inputEmail3"
						placeholder="Title" style="width: 50%;">
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-3">交易時段</label>
				<div class="col-sm-10">
				<div class="radio">
					<label ><input type="radio" name="gridRadios" value="option2">上午</label>
					<label><input type="radio" name="gridRadios" value="option2">下午</label>
					<label><input type="radio" name="gridRadios" value="option2">18:00過後</label>
				</div>
				</div>
			</div>

			<div class="form-group row">
				<label for="inputPassword3" >交易地點</label>
				<div >
					<input type="password" class="form-control" id="inputPassword3"
						placeholder="Place" style="width: 50%;">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-3">交易方式</label>
				<div class="col-sm-10">

					<div class="radio">
						<label> <input type="radio" name="gridRadios" value="option2"> 面交
						</label>
					</div>
					<div class="radio">
						<label> <input type="radio" name="gridRadios" value="option2"> 宅急便
						</label>
					</div>
					<div class="radio">
						<label> <input type="radio" name="gridRadios"  value="option2"> 超商

						</label>
					</div>

				</div>
				
			</div>

			<div class="form-group row">
					<div class="col-sm-10">
						<div class="checkbox">
							<label> <input type="checkbox"> 運費自付
							</label>
						</div>
					</div>
				</div>

			<div>
				<label>希望換到商品</label>
				<div class="radio">
					<label> <input type="radio" name="gridRadios"
						id="gridRadios1" value="option1" checked> 隨機
					</label>
				</div>
				<div class="radio">
					<label> <input type="radio" name="gridRadios"
						id="gridRadios2" value="option2"> 贈送
					</label>
				</div>
				<div class="radio">
					<label> <input type="radio" name="gridRadios"
						id="gridRadios2" value="option2"> 希望商品：
					</label>
				</div>
				<textarea style="width: 80%;" class="form-control" rows="8"
					placeholder="詳細敘述想要換到的商品"></textarea>

			</div>	
		</div>
		
			</form>
	<div class="col-md-1"></div>

</div>
	<div style="text-align: center;margin-bottom: 50px;">
			<input type="button" value="送出" class="btn btn-primary btn-lg">
	</div>



<c:import url="/WebContent/layout/footer.jsp"></c:import>