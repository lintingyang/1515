<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
  <script src="<c:url value='/assets/css3/css3-mediaqueries.js' />"></script>
  <script src="<c:url value='/assets/html5shiv/dist/html5shiv.min.js' />"></script>
  <script src="<c:url value='/assets/respond/dest/respond.min.js' />"></script>
<![endif]-->

<head>
	<meta name="_csrf" content="${_csrf.token}"/>
	<meta name="_csrf_header" content="${_csrf.headerName}"/>
</head>

<script type="text/javascript" src="<c:url value='/assets/jquery/jquery-1.11.1.js' />"></script>
<script type="text/javascript" src='<c:url value="/assets/jquery/jquery-ui.js" />'></script>
<script type="text/javascript" src='<c:url value="/assets/json/form2js.js" />'></script>
<script type="text/javascript" src='<c:url value="/assets/bootstrap-3.0.0/dist/js/bootstrap.min.js" />'></script>
<script type="text/javascript" src='<c:url value="/assets/jquery/bootstrap-paginator.min.js" />'></script>
<script type="text/javascript" src='<c:url value="/assets/bootstrap-filestyle/bootstrap-filestyle.min.js" />'></script>

<script type="text/javascript" src='<c:url value="/assets/jquery/jquery.cookie.js" />'></script>
<script type="text/javascript" src='<c:url value="/assets/softleader/jquery.softleader.js" />'></script>
<script type="text/javascript" src='<c:url value="/assets/softleader/jquery.softleader.grid.js" />'></script>
<script type="text/javascript" src='<c:url value="/assets/softleader/jquery.softleader.cookie.js" />'></script>
<script type="text/javascript" src='<c:url value="/assets/chardinjs/chardinjs.min.js" />'></script>
<script type="text/javascript" src='<c:url value="/assets/jquery-dateFormat-master/dist/jquery-dateFormat.js" />'></script>
<script type="text/javascript" src='<c:url value="/assets/jquery/jquery.number.js" />'></script>
<script type="text/javascript" src='<c:url value="/assets/jquery/jquery.form.js" />'></script>
<script type="text/javascript" src='<c:url value="/assets/blockui-master/jquery.blockUI.js" />'></script>

<script type="text/javascript" src='<c:url value="/assets/log/log4javascript.js" />'></script>
<script type="text/javascript" src='<c:url value="/assets/jquery/localization/jquery.ui.datepicker-zh-TW.js" />'></script>
<script type="text/javascript" src='<c:url value="/assets/utils/utility.js" />'></script>

<script type="text/javascript" src='<c:url value="/assets/jquery/jquery.fileDownload.js" />'></script>

<script type="text/javascript" src='<c:url value="/assets/jasny-bootstrap/js/jasny-bootstrap.min.js" />'></script>
<script type="text/javascript" src='<c:url value="/assets/lodash/lodash.min.js" />'></script>
<script type="text/javascript" src='<c:url value="/assets/sweetalert/lib/sweet-alert.min.js" />'></script>



<div class="modal fade" id="alertModel" tabindex="-1" role="dialog" aria-hidden="true" >
  <div class="modal-dialog" style="width: 50%; margin-top: 10%">
	<div class="alert alert-danger">
	  <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times; </button>
	  <div class="alert-body"></div>
	</div>
  </div>
</div>

<script type="text/javascript">

	$(function() {
		
		var header = $("meta[name='_csrf_header']").attr("content");
		var token = $("meta[name='_csrf']").attr("content");
		if (header && token) {
			$(document).ajaxSend(function(e, xhr, options) {
				xhr.setRequestHeader(header, token);
			});
		}
		
		$.ajaxSetup({
			error: function (xhr) {
				if(xhr.status == '901') {
					ajaxSessionTimeout();
				}
            }
		});
		
		// 當在document的任何位置按下backspace時
		$(document).keydown(function(e) {
		// 找出在哪個element上按下，並檢查該element是否為readonly
		    var elid = $(document.activeElement).attr('readonly');
		var backspaceKeyCode = 8;
		    if (e.keyCode === backspaceKeyCode && elid) {
		        return false;
		    };
		});
		
		
		$(":text[id*='Time']").addClass("form-control").css("width","100px");
		$(":text[id*='Date']").addClass("form-control").css("width","100px");
		
		
// 		var dateTimeOption = {
// 			dateFormat : 'yy-mm-dd',
// 			duration : "fast",
// 			changeMonth : true,
// 			changeYear : true,
// 			showOtherMonths : true,
// 			showStatus : true,
// 			showAnim : 'blind',
// 			highlightWeek : true,
// 			showButtonPanel : true,
// 			yearRange : "-100:+30",
// 			inline: true,
// 			beforeShow : function() {
// 				$('#ui-datepicker-div').css('z-index', 99999999);
// 			}
// 		};
		
// 		var defaultDatePicker = "[type='text'][name='birthday'],[type='text'][name='date']";
// 		defaultDatePicker += ",[type='text'][name*='Date'],[type='text'][name*='DateStart'],[type='text'][name*='DateEnd']";
// 		defaultDatePicker += ",[type='text'][name*='Time'],[type='text'][name*='TimeStart'],[type='text'][name*='TimeEnd']";
		
// 		$(defaultDatePicker).each(function() {
// 			// format joda datetime
// 			if (!!$(this).val()) {
// 				var dateTimePattern = 'yyyy-MM-dd';
// 				try {
// 					$(this).val($.format.date($(this).val(), dateTimePattern));
// 				} catch (e) {
// 					alertMessage($(this).val() + ' format faild: ' + e);
// 				}
// 			}
			
// 			//綁日曆
// 			$(this).datepicker(dateTimeOption).datepicker("option", "autoSize", true);//.attr("readonly", true);
// 			if ($(this).attr("readonly")) {
// 				$(this).datepicker("disable");
// 				$(this).attr("disabled", false);
// 			}
// 		});
	});

	function alertMessage(messages, type) {
		jQuery('#alertModel .alert-body').empty();
		var content = "";
		if (jQuery.isArray(messages)) {
			jQuery.each(messages, function() {
				// assume is tw.com.softleader.harvard.common.Message object
				if (!!this.msg) {
					content += (this.msg || "") + "<br/>";
				} else if (!!this.value){
					content += (this.value || "") + "<br/>";
				} else {
					content += (this || "") + "<br/>";
				}
			});
		} else {
			content = messages;
		}
		jQuery('#alertModel .alert-body').append(content);
		jQuery('#alertModel').modal('show');
	}
	
	function conformMessage(messages, ok, cancel) {
		
	}
	
	function convertROCDateToDateString(rocDate) {
		log.debug(rocDate);
		/*
		if (!!!rocDate) {
			return null;
		}
		if(!rocDate || rocDate.length != 9) {
			alertMessage("請輸入 yyy-MM-dd 格式, 例如 101-01-01 ");
			return;
		}
		
		rocYear = rocDate.substring(0,3);
		year = parseInt(rocYear, 10) + 1911;
		
		if(isNaN(year)) {
			alertMessage("請輸入 yyy-MM-dd 格式, 例如 101-01-01 ");
			return;
		}
		
		date = year + rocDate.substring(3);

		return date;
		*/
		return rocDate;
	}
	
	
	function isDate(d) {
		
		year = parseInt(d.split("-")[0], 10);
		month = parseInt(d.split("-")[1] - 1, 10);
		day = parseInt(d.split("-")[2], 10);
			
		date = new Date(year, month, day);
		
		yyyy = date.getFullYear();
		mm = "00"+ (date.getMonth()+1); 
		mm = mm.substring(mm.length -2 );
		dd = "00"+ (date.getDate());
		dd = dd.substring(dd.length -2);
		
		var convertDate = yyyy+"-"+mm+"-"+dd;
		//console.log(convertDate);
		//console.log(d);
		return date instanceof Date && !isNaN(date.valueOf()) && (d == convertDate) ;
	}
	
	function dateFormatter(dateStr) {
		//log.debug(dateStr);
		var date;
		if(dateStr.length == 19) {
			var a=dateStr.split(" ");
			var d=a[0].split("-");
			var t=a[1].split(":");
			date = new Date(d[0],(d[1]-1),d[2],t[0],t[1],t[2]);
		} else if (dateStr.length == 10) {
			var d=dateStr.split("-");
			date = new Date(d[0],(d[1]-1),d[2],0,0,0);
		}
		return $.format.date(date, 'yyyy-MM-dd');
	}
	
	function numberP0Formatter(str) {
		return $.number(str, 0);
	}
	
	function numberP2Formatter(str) {
		return $.number(str, 2);
	}
	
	
	function ajaxSessionTimeout() {
		alert("ajax session timeout");
		document.location.href = '${pageContext.request.contextPath}/auth/login';
	}
	
	var log = log4javascript.getLogger("<c:out value='${pageContext.request.servletPath}' />");
	var appender = new log4javascript.BrowserConsoleAppender();
	log.addAppender(appender);
	log.debug("Current page is <c:out value='${pageContext.request.servletPath}' />");
	
	window.$log = log;
</script>