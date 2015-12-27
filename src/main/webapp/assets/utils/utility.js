
function isEmpty(value) {
    var regform = / /g;
    var flag = false;
    if (value.replace(regform, "").length == 0) {
        flag = true;
    }
    return flag;
}

function isNumerical(value) {
	var bValid = true;
	var regform = / /g;
	value = value.replace(regform, "");

	if (value.length > 0) {
		if (isNaN(value)) {
			bValid = false;
	   }
		if (bValid) {
			var numbers = "0123456789-.";
			for (var i=0; i<value.length; i++) {
				if (numbers.indexOf(value.charAt(i)) == -1) {
					bValid = false;
					break;
				}
			}
		}
	}
	return bValid;
}

function isAllNumber(value) {
	var bValid = true;
	if (!isEmpty(value)) {
		var keywords = "0123456789";
		for (var i=0; i<value.length; i++) {
			if (keywords.indexOf(value.charAt(i)) == -1) {
				bValid = false;
				break;
			}
		}
	} else {
		bValid = false;
	}
	return bValid;
}

function isAllEnglish(value) {
	var bValid = true;
	if (!isEmpty(value)) {
		value = value.toLowerCase();
		var keywords = "abcdefghijklmnopqrstuvwxyz";
		for (var i=0; i<value.length; i++) {
			if (keywords.indexOf(value.charAt(i)) == -1) {
				bValid = false;
				break;
			}
		}
	} else {
		bValid = false;
	}
	return bValid;
}

/**
 * 限制使用者只能輸入數字0-9 可輸入 . - 
 */
function InputOnlyNum(event) {
	if (event.keyCode!=46 && event.keyCode!=45 && (event.keyCode<48 || event.keyCode>57)) 
		event.returnValue=false;
}

/**
 * 限制使用者只能輸入數字0-9 + ,(44) + ~(126) 不可輸入 . -
 */
function InputOnlyNum2(event) {
	if (event.keyCode!=44 && event.keyCode!=126  && (event.keyCode<48 || event.keyCode>57)) 
		event.returnValue=false;
} 

/**
 * 限制使用者只能輸入數字0~9 不可輸入 . - (20140618修改增加delete及backspace)
 */
function InputOnlyNum3(event) {
	if ((event.keyCode<48 || event.keyCode>57) && event.keyCode != 8 && event.keyCode != 46) 
		event.returnValue=false;
}

/**
 * 限制使用者只能輸入0-9,A-Z,a-z
 */
function InputOnlyEngAndNum(event) {  
	if ( !((event.keyCode>=48 && event.keyCode<=57)  || (event.keyCode>=65 && event.keyCode<=90) ||  (event.keyCode>=97 && event.keyCode<=122) ) ) 
		event.returnValue=false;
} 

/**
 * 檢查身分證字號或統編是否正常
 */
function checkID(id){
	letter ="ABCDEFGHIJKLMNOPQRSTUVWXYZ"; 
	i=0;
	result=0;

	id=id.toUpperCase(); // 轉成大寫
	id=id.replace(" /g", ""); // 把空白換掉
	if(id.length != 10) // 是不是10個字?
	{
//		if ( id.length == 8 )	return chknumCompanyNo(id);
//		alert("身分證長度不正確。");
		return false;
	}
	if(letter.indexOf(id.substring(0,1)) == -1)
	{
//		alert("身分證第一個字母必須是英文:o。");
		return false;
	} 
	else {
		i = letter.indexOf(id.substring(0,1)) + 10;
	}
	
	result=0;

	if(isNaN(id.substring(1,10)))
	{
//		alert("身分證後面九碼必須是數字。");
		return false;
	}

	if(id.substring(1,2) != "1" && id.substring(1,2) != "2")
	{
//		alert("身分證性別錯誤。");
		return false;
	}

	idalpha = id.substring(0,1);
	idalpha_value= 0;

	if( idalpha == "A" )  idalpha_value = 1;
	else if( idalpha == "B" )  idalpha_value = 10;
	else if( idalpha == "C" )  idalpha_value = 19;
	else if( idalpha == "D" )  idalpha_value = 28;
	else if( idalpha == "E" )  idalpha_value = 37;
	else if( idalpha == "F" )  idalpha_value = 46;
	else if( idalpha == "G" )  idalpha_value = 55;
	else if( idalpha == "H" )  idalpha_value = 64;
	else if( idalpha == "I" )  idalpha_value = 39;
	else if( idalpha == "J" )  idalpha_value = 73;
	else if( idalpha == "K" )  idalpha_value = 82;
	else if( idalpha == "L" )  idalpha_value = 2;
	else if( idalpha == "M" )  idalpha_value = 11;
	else if( idalpha == "N" )  idalpha_value = 20;
	else if( idalpha == "O" )  idalpha_value = 48;
	else if( idalpha == "P" )  idalpha_value = 29;
	else if( idalpha == "Q" )  idalpha_value = 38;
	else if( idalpha == "R" )  idalpha_value = 47;
	else if( idalpha == "S" )  idalpha_value = 56;
	else if( idalpha == "T" )  idalpha_value = 65;
	else if( idalpha == "U" )  idalpha_value = 74;
	else if( idalpha == "V" )  idalpha_value = 83;
	else if( idalpha == "W" )  idalpha_value = 21;
	else if( idalpha == "X" )  idalpha_value = 3;
	else if( idalpha == "Y" )  idalpha_value = 12;
	else if( idalpha == "Z" )  idalpha_value = 30;


	for(i=1; i<9; i++)
	{
		result += (parseInt(id.substring(i, i+1)) * (9-i));
	}

	result = result+idalpha_value;

	if( ((10 - (result % 10))%10) != id.substring(9,10))
	{
//		alert("身分證錯誤！");
		return false;
	}

	return true;
}

/**
 * 限制使用者只能輸入0-9,A-Z,a-z
 */
function InputOnlyIdno(event) {  
	if ( !((event.keyCode>=48 && event.keyCode<=57)  || (event.keyCode>=65 && event.keyCode<=90) ||  (event.keyCode>=97 && event.keyCode<=122) ) ) 
		event.returnValue=false;
} 

/**
 * 限制使用者只能輸入0-9,A-Z,a-z,*
 * 並自動轉換大小寫
 */
function InputOnlyIdno2(event) {  
	if ( !((event.keyCode>=48 && event.keyCode<=57)  || (event.keyCode>=65 && event.keyCode<=90) ||  (event.keyCode>=97 && event.keyCode<=122) ||  (event.keyCode==42)) ) 
		event.returnValue=false;
	
	if (event.keyCode>=97 && event.keyCode<=122)
		event.keyCode -= 32;
}

/**
 * 檢查身分證字號是否正常
 */
function checkOnlyID(id){
	letter ="ABCDEFGHIJKLMNOPQRSTUVWXYZ"; 
	i=0;
	result=0;

	id=id.toUpperCase(); // 轉成大寫
	id=id.replace(" /g", ""); // 把空白換掉
	if(id.length != 10) // 是不是10個字?
	{
		//alert("身分證長度不正確。");
		return false;
	}
	if(letter.indexOf(id.substring(0,1)) == -1)
	{
		//alert("身分證第一個字母必須是英文:o。");
		return false;
	} 
	else {
		i = letter.indexOf(id.substring(0,1)) + 10;
	}
	
	result=0;

	if(isNaN(id.substring(1,10)))
	{
		//alert("身分證後面九碼必須是數字。");
		return false;
	}

	if(id.substring(1,2) != "1" && id.substring(1,2) != "2")
	{
		//alert("身分證性別錯誤。");
		return false;
	}

	idalpha = id.substring(0,1);
	idalpha_value= 0;

	if( idalpha == "A" )  idalpha_value = 1;
	else if( idalpha == "B" )  idalpha_value = 10;
	else if( idalpha == "C" )  idalpha_value = 19;
	else if( idalpha == "D" )  idalpha_value = 28;
	else if( idalpha == "E" )  idalpha_value = 37;
	else if( idalpha == "F" )  idalpha_value = 46;
	else if( idalpha == "G" )  idalpha_value = 55;
	else if( idalpha == "H" )  idalpha_value = 64;
	else if( idalpha == "I" )  idalpha_value = 39;
	else if( idalpha == "J" )  idalpha_value = 73;
	else if( idalpha == "K" )  idalpha_value = 82;
	else if( idalpha == "L" )  idalpha_value = 2;
	else if( idalpha == "M" )  idalpha_value = 11;
	else if( idalpha == "N" )  idalpha_value = 20;
	else if( idalpha == "O" )  idalpha_value = 48;
	else if( idalpha == "P" )  idalpha_value = 29;
	else if( idalpha == "Q" )  idalpha_value = 38;
	else if( idalpha == "R" )  idalpha_value = 47;
	else if( idalpha == "S" )  idalpha_value = 56;
	else if( idalpha == "T" )  idalpha_value = 65;
	else if( idalpha == "U" )  idalpha_value = 74;
	else if( idalpha == "V" )  idalpha_value = 83;
	else if( idalpha == "W" )  idalpha_value = 21;
	else if( idalpha == "X" )  idalpha_value = 3;
	else if( idalpha == "Y" )  idalpha_value = 12;
	else if( idalpha == "Z" )  idalpha_value = 30;


	for(i=1; i<9; i++)
	{
		result += (parseInt(id.substring(i, i+1)) * (9-i));
	}

	result = result+idalpha_value;

	if( ((10 - (result % 10))%10) != id.substring(9,10))
	{
		//alert("身分證號格式有誤!");
		return false;
	}

	return true;
}

/**
 * 檢查身分證字號(無alert，僅return true or false)
 */
function isID(id){
	letter ="ABCDEFGHIJKLMNOPQRSTUVWXYZ"; 
	i=0;
	result=0;

	id=id.toUpperCase(); // 轉成大寫
	id=id.replace(" /g", ""); // 把空白換掉
	if(id.length != 10) { // 是不是10個字?
		return false;
	} if(letter.indexOf(id.substring(0,1)) == -1) {
		return false;
	} else {
		i = letter.indexOf(id.substring(0,1)) + 10;
	}
	
	result=0;

	if(isNaN(id.substring(1,10))) {
		return false;
	} if(id.substring(1,2) != "1" && id.substring(1,2) != "2") {
		return false;
	}

	idalpha = id.substring(0,1);
	idalpha_value= 0;

	if( idalpha == "A" )  idalpha_value = 1;
	else if( idalpha == "B" )  idalpha_value = 10;
	else if( idalpha == "C" )  idalpha_value = 19;
	else if( idalpha == "D" )  idalpha_value = 28;
	else if( idalpha == "E" )  idalpha_value = 37;
	else if( idalpha == "F" )  idalpha_value = 46;
	else if( idalpha == "G" )  idalpha_value = 55;
	else if( idalpha == "H" )  idalpha_value = 64;
	else if( idalpha == "I" )  idalpha_value = 39;
	else if( idalpha == "J" )  idalpha_value = 73;
	else if( idalpha == "K" )  idalpha_value = 82;
	else if( idalpha == "L" )  idalpha_value = 2;
	else if( idalpha == "M" )  idalpha_value = 11;
	else if( idalpha == "N" )  idalpha_value = 20;
	else if( idalpha == "O" )  idalpha_value = 48;
	else if( idalpha == "P" )  idalpha_value = 29;
	else if( idalpha == "Q" )  idalpha_value = 38;
	else if( idalpha == "R" )  idalpha_value = 47;
	else if( idalpha == "S" )  idalpha_value = 56;
	else if( idalpha == "T" )  idalpha_value = 65;
	else if( idalpha == "U" )  idalpha_value = 74;
	else if( idalpha == "V" )  idalpha_value = 83;
	else if( idalpha == "W" )  idalpha_value = 21;
	else if( idalpha == "X" )  idalpha_value = 3;
	else if( idalpha == "Y" )  idalpha_value = 12;
	else if( idalpha == "Z" )  idalpha_value = 30;


	for (i=1; i<9; i++) {
		result += (parseInt(id.substring(i, i+1)) * (9-i));
	}

	result = result+idalpha_value;

	if ( ((10 - (result % 10))%10) != id.substring(9,10)) {
		return false;
	}

	return true;
}


//檢查居留證號碼
function checkResidencePermit(id) {

	if (id.length != 10) return false;

	if (isNaN(id.substr(2,8)) || (id.substr(0,1)<"A" ||id.substr(0,1)>"Z") || (id.substr(1,1)<"A" ||id.substr(1,1)>"Z")){
		alert("居留證號碼格式錯誤！");
		return false;				
	}
	
	var head="ABCDEFGHJKLMNPQRSTUVXYWZIO";
	id = (head.indexOf(id.substr(0,1))+10) +''+ ((head.indexOf(id.substr(1,1))+10)%10) +''+ id.substr(2,8);
	s =parseInt(id.substr(0,1)) + 
	parseInt(id.substr(1,1)) * 9 + 
	parseInt(id.substr(2,1)) * 8 + 
	parseInt(id.substr(3,1)) * 7 + 			
	parseInt(id.substr(4,1)) * 6 + 
	parseInt(id.substr(5,1)) * 5 + 
	parseInt(id.substr(6,1)) * 4 + 
	parseInt(id.substr(7,1)) * 3 + 
	parseInt(id.substr(8,1)) * 2 + 
	parseInt(id.substr(9,1)) + 
	parseInt(id.substr(10,1));
	
	//判斷是否可整除
	if ((s % 10) != 0) {
		alert("居留證號碼驗證錯誤！");
		return false;
	}
	//居留證號碼正確		
	return true;
}

	var cx = new Array;
	cx[0] = 1;
	cx[1] = 2;
	cx[2] = 1;
	cx[3] = 2;
	cx[4] = 1;
	cx[5] = 2;
	cx[6] = 4;
	cx[7] = 1;


/**
 * 檢查是否為正常之統編
 */
function chknumCompanyNo2(NO){ 
	var SUM = 0;
	if (NO.length == 1) {
		if(NO == '*'){
			return true;
		}
	}

	if (NO.length != 8) {
		alert("統編錯誤，要有 8 個數字");
		return;
	}
	var cnum = NO.split("");
	for (i=0; i<=7; i++) {
		if (NO.charCodeAt() < 48 || NO.charCodeAt() > 57) 
		{
			alert("統編錯誤，要有 8 個 0-9 數字組合");
			return;
		}
		SUM += cc(cnum[i] * cx[i]);
	}

	if (SUM % 10 == 0) return true;
	else if (cnum[6] == 7 && (SUM + 1) % 10 == 0) return true;
	else {
		alert("統 編 ： "+NO+" 錯 誤 !");
		return false;
	}
}

function cc(n){
	if (n > 9) {
		var s = n + "";
		n1 = s.substring(0,1) * 1;
		n2 = s.substring(1,2) * 1;
		n = n1 + n2;
	}
	return n;
}

/**
 * 檢核是否為統編(無alert，僅return true or false)
 */
function isBusinessNo(sid){
	var tbNum = new Array(1,2,1,2,1,2,4,1);
	var temp = 0;
	var total = 0;
	
	if (sid=="") {
		return false;
	} else if (!sid.match(/^\d{8}$/)) {
		return false;
	} else {
		for (var i = 0; i < tbNum.length ;i ++) {
			temp = sid.charAt(i) * tbNum[i];
			total += Math.floor(temp/10)+temp%10;
		}
		if (total%10==0 || (total%10==9 && sid.charAt(6)==7)) {
			return true;
		} else {
			return false;
		}
	}
}


function isDate(year, month, day) {
	// month argument must be in the range 1 - 12
	month = month - 1; // javascript month range : 0- 11
	var tempDate = new Date(year,month,day);
	
	if ( (tempDate.getFullYear()==year) &&	(month == tempDate.getMonth()) &&	(day == tempDate.getDate()) ) 
		return true;
	else
		return false;
}

/**
 * 民國年日期格式
 */
//default ROC-format: YYY-MM-DD
function isROCDate(value) {
	var dayArray = value.split('-');	
	var len = dayArray.length;
	if (len != 3) {
		return false;
	}

	var rocYear = dayArray[0];
	var rocMonth = dayArray[1];
	var rocDay = dayArray[2];
	
	if (!isNumerical(rocYear) || 
		!isNumerical(rocMonth) ||
		!isNumerical(rocDay)) {
		return false;
	}

	var westYear = parseInt(rocYear, 10) + 1911;
	var westMonth = parseInt(rocMonth, 10);
	var westDate = parseInt(rocDay, 10);
	return isDate(westYear, westMonth, westDate);
}

/**
 * 日期格式檢核 (正確性檢核)
 * 將畫面上的年月日轉成日期再轉回字串，若與原字串一致代表該日期是正確的 (正確日期其轉換會是可逆的)
 */
function isLegalDate(year, month, day){
	var dateStr;
	if (!month || !day) {
		if (month == '') {
			dateStr = year + "/1/1";
		}else if (day == '') {
			dateStr = year + '/' + month + '/1';
		}else {
			dateStr = year.replace(/[.-]/g, '/');
		}
	}else{
		dateStr = year + '/' + month + '/' + day;
	}
	dateStr = dateStr.replace(/\/0+/g, '/');

	var accDate = new Date(dateStr);
	var tempDate = accDate.getFullYear() + "/";
	tempDate += (accDate.getMonth() + 1) + "/";
	tempDate += accDate.getDate();
	if (dateStr == tempDate) {
		return true;
	}else{
		return false;
	}
}

/**
 * 民國年日期檢核 (分隔符只支援 / or -)
 */
function checkDateObjROC(str) {
	if(str == ""){
		return true;
	}else{
		str = str.replace(/\//g,"-");
	}
	
	var dateStrAry = str.split("-");
	if(dateStrAry.length == 3){		
		if(! isLegalDate(1911 + parseInt(dateStrAry[0], 10), dateStrAry[1], dateStrAry[2]) ) {
			return false;
		}
	}else{
		return false;
	}
	return true;
}


function isValidDate(year, month, day) {
	
	if(isNaN(day) || isNaN(month) || isNaN(year)){
		return false;
	}

	var regform = / /g;
	if (month < 1 || month > 12) {
			return false;
	}
	if (day < 1 || day > 31) {
		return false;
	}
	if ((month == 4 || month == 6 || month == 9 || month == 11) &&
		(day == 31)) {
		return false;
	}
	if (month == 2) {
		var leap = (year % 4 == 0 &&
				   (year % 100 != 0 || year % 400 == 0));
		if (day>29 || (day == 29 && !leap)) {
			return false;
		}
	}
	return true;
} 

function checkDateObj(str){
	if(str == ""){
		return true;
	}
	if(str.length != 10){
		//alert( name + "格式錯誤" );
		//obj.select();
		return false;
	}
	
	if( str.indexOf("-") != 4){
		//alert( name + "格式錯誤" );
		//obj.select();
		return false;
	}
	if( str.lastIndexOf("-") != 7){
		//alert( name + "格式錯誤" );
		//obj.select();
		return false;
	}

	var dateStrAry = str.split("-");

	if(dateStrAry.length == 3){		
		if(! isValidDate(dateStrAry[0], 
					dateStrAry[1], 
					dateStrAry[2]) )
		{
			//alert( name + "格式錯誤" );
			//obj.select();
			return false;
		}
	}else{
		return false;
	}
	return true;
}

//yyyy-MM-dd hh:MM
function checkDateTimeObj(str){
	
	if(str == ""){
		return true;
	}
	if(str.length != 16){
		return false;
	}
	
	if( str.indexOf("-") != 4){
		return false;
	}
	if( str.lastIndexOf("-") != 7){
		return false;
	}
	if( str.lastIndexOf(":") != 13){
		return false;
	}

	str = str.split(" ")[0];
	var dateStrAry = str.split("-");

	if(dateStrAry.length == 3){		
		if(! isValidDate(dateStrAry[0], 
					dateStrAry[1], 
					dateStrAry[2]) )
		{
			return false;
		}
	}else{
		return false;
	}
	return true;
}

/**驗證電子郵件位置 */
function validateEmail(email) {
	var regform = / /g;
	var errormsg = "";
	var bValid = true;
	var value = email;
	value = value.replace(regform, "");
	if (isEmpty(value))
		return false;
	return checkEmail(value);	
}

function checkEmail(emailStr) {
   var regform = / /g;
   if (emailStr.length == 0) {
	   return false;
   }
   var emailPat=/^(.+)@(.+)$/;
   var specialChars="\\(\\)<>@,;:\\\\\\\"\\.\\[\\]";
   var validChars="\[^\\s" + specialChars + "\]";
   var quotedUser="(\"[^\"]*\")";
   var ipDomainPat=/^(\d{1,3})[.](\d{1,3})[.](\d{1,3})[.](\d{1,3})$/;
   var atom=validChars + '+';
   var word="(" + atom + "|" + quotedUser + ")";
   var userPat=new RegExp("^" + word + "(\\." + word + ")*$");
   var domainPat=new RegExp("^" + atom + "(\\." + atom + ")*$");
   var matchArray=emailStr.match(emailPat);
   if (matchArray == null) {
	   return false;
   }
   var user=matchArray[1];
   var domain=matchArray[2];
   if (user.match(userPat) == null) {
	   return false;
   }
   var IPArray = domain.match(ipDomainPat);
   if (IPArray != null) {
	   for (var i = 1; i <= 4; i++) {
		  if (IPArray[i] > 255) {
			 return false;
		  }
	   }
	   return true;
   }
   var domainArray=domain.match(domainPat);
   if (domainArray == null) {
	   return false;
   }
   var atomPat=new RegExp(atom,"g");
   var domArr=domain.match(atomPat);
   var len=domArr.length;
   if ((domArr[domArr.length-1].length < 2) ||
	   (domArr[domArr.length-1].length > 3)) {
	   return false;
   }
   if (len < 2) {
	   return false;
   }
   return true;
}

/** 清空選項只保留第一個選項 */
$.fn.extend({
	resetOptions : function () {
		$(this).find("option:gt(0)").remove();
	}
});

/** 檢查textarea字串 有無超出長度限制 */
function checkLienLength(obj,maxLength) {	
	var words = new String( obj.value);	
	if(words.length > maxLength) {
		words = words.substring(0, maxLength);
		obj.value = words;
	}
};

/** 數值轉16進位值 **/
function decimalToHexString(number)
{
    if (number < 0)
    {
    	number = 0xFFFFFFFF + number + 1;
    }

    return number.toString(16).toUpperCase();
};

/** from azalea **/
function createOption(text, value) {
	return "<option value='" + value + "'>" + text + "</option>";
}

/** 判斷結束日是否大於起始日(不含時分秒) **/
function isSequDate(startDate, endDate) {
	startDate = startDate.substring(0, 10);
	endDate = endDate.substring(0, 10);
	// first date;
	var startYear = new Number(startDate.substr(0,4));
	var startMonth = new Number(startDate.substr(5,7).substr(0,2))-1;
	var startDay = new Number(startDate.substr(8,10));
	var start = new Date(startYear, startMonth, startDay, 0, 0);
	// second date;
	var endYear = new Number(endDate.substr(0,4));
	var endMonth = new Number(endDate.substr(5,7).substr(0,2))-1;
	var endDay = new Number(endDate.substr(8,10));
	var end = new Date(endYear, endMonth, endDay, 0, 0);
	if (end.valueOf() < start.valueOf()){
		return false;
	}
	return true;
}

/**
 * 求日期區間之天數(含起日)
 * 起日:effectiveDate(yyyy-MM-dd)
 * 訖日:expirateDate(yyyy-MM-dd)
 */
function computeDateDiff(effectiveDate, expirateDate){
	
	var effectiveYear = new Number(effectiveDate.substr(0,4));
	var effectiveMonth = new Number(effectiveDate.substr(5,7).substr(0,2))-1;
	var effectiveDay = new Number(effectiveDate.substr(8,10));
	var effective = new Date(effectiveYear, effectiveMonth, effectiveDay, 0, 0);

	var expirateYear = new Number(expirateDate.substr(0,4));
	var expirateMonth = new Number(expirateDate.substr(5,7).substr(0,2))-1;
	var expirateDay = new Number(expirateDate.substr(8,10));
	var expirate = new Date(expirateYear, expirateMonth, expirateDay, 0, 0);
	
	var day = expirate - effective;
	day =Math.ceil(day/1000/60/60/24)+1;
	return day;
}

/** 保單號類型的輸入檢核(英文轉大寫 左右不留空白)  */
function inputIsPolyNo(obj){
	try {//預防沒有jquery可用
		obj.value=$.trim(obj.value.toUpperCase());
	}catch(error){
		//do nothing
	}
}
/**  如果輸入值只有一位則前面補零(月份)  */
function appendZero(obj){
	var num = obj.value;
	if($.trim(num) !=""){
		if(!isNaN(num) && num.length == 1){
			if(parseInt(num,10) < 10 && parseInt(num,10) > 0) {
				obj.value = "0"+num;
			}
		}
	}
}

//jqGrid 用
// 險別欄位format客製
function  typeInStockFormatter(cellvalue, options, rowObject) {
    if (cellvalue == 'TAS')
        return "旅責";
    else
    	return "遊責";
};

// 抽查狀態format A:未檢視 Y:合格 N:不合格
function statusInStockFormatter(cellvalue, options, rowObject) {
	if (cellvalue == 'A') {
		return '未抽查';
	} else if (cellvalue == 'Y') {
		return '合格';
	} else if (cellvalue == 'N') {
		return '不合格';
	} else {
		return cellvalue;
	}
}

//審核狀態
function statusInApprovalFormatter(cellvalue, options, rowObject) {
	if (cellvalue == 'N') {
		return '未核';
	} else if (cellvalue == 'P') {
		return '審核完成';
	} else if (cellvalue == 'D') {
		return '註銷中';
	} else if (cellvalue == 'A') {
		return '專案核可';
	} else if (cellvalue == 'M') {
		return '一般核可';
	} else if (cellvalue == 'R') {
		return '不核可';
	} else {
		return cellvalue;
	}	
}

//保單狀態format 
function statusInProcessFormatter(cellvalue, options, rowObject) {
	if (cellvalue == 'Q') {
		return '報價';
	} else if (cellvalue == 'D') {
		return '註銷';
	} else if (cellvalue == 'P') {
		return '保單';
	}  else {
		return cellvalue;
	}	
}

//系統狀態format 
function statusInSystemFormatter(cellvalue, options, rowObject) {
	if (cellvalue == 'Y') {
		return '有效資料';
	} else if (cellvalue == 'N') {
		return '無效資料';
	} else  {
		return cellvalue;
	}
}

//千分位
function appendComma(cellvalue, options, rowObject) {
	if (!/^((-*\d+)|(0))$/.test(cellvalue)) {
		var newValue = /^((-*\d+)|(0))$/.exec(cellvalue);
		if (newValue != null) {
			if (parseInt(newValue, 10)) {
				cellvalue = newValue;
			} else {
				cellvalue = '0';
			}
		} else {
			cellvalue = '0';
		}
	}
	if (parseInt(cellvalue, 10) == 0) {
		cellvalue = '0';
	} else {
		cellvalue = parseInt(cellvalue, 10).toString();
	}

	cellvalue += '';
	var arr = cellvalue.split('.');
	var re = /(\d{1,3})(?=(\d{3})+$)/g;
	return arr[0].replace(re, '$1,') + (arr.length == 2 ? '.' + arr[1] : '');
}


function istepFormatter(cellvalue, options, rowObject) {
	if (!cellvalue) {
		return cellvalue;
	}
	if (cellvalue == 'DONE') {
		return '<div class="text-error">已結束</div>';
	} else if (cellvalue == 'NONE') {
		return '無';
	} else {
		return cellvalue.replace('S', '');
	}
}

function ruleStatusFormatter(cellvalue, options, rowObject) {
	if (!cellvalue) {
		return cellvalue;
	}
	if (cellvalue == 'W') {
		return '警告';
	} else if (cellvalue == 'B') {
		return '禁止';
	} else if (cellvalue == 'S') {
		return '送審';
	} else {
		return cellvalue;
	}
}

function flowTypeFormatter(cellvalue, options, rowObject) {
	if (!cellvalue) {
		return cellvalue;
	}
	if (cellvalue == 'S') {
		return '逐步通關';
	} else if (cellvalue == 'M') {
		return '最大關卡';
	} else {
		return cellvalue;
	}
}

function bpmStatusFormatter(cellvalue, options, rowObject) {
	if (!cellvalue) {
		return cellvalue;
	}
	if (cellvalue == 'A') {
		return '<div class="text-info">已核可</div>';
	} else if (cellvalue == 'R') {
		return '<div class="text-error">已駁回</div>';
	} else if (cellvalue == 'P') {
		return '待審';
	} else {
		return cellvalue;
	}
}

function tranDateSlanteStr(cellvalue, options, rowObject){
	//console.log(cellvalue);
	if(typeof cellvalue =='undefined'){
		return "";
	}
	if (!cellvalue) {
		return cellvalue;
	}
	//2013-07-03 00:00	
		//return cellvalue.replace(/\-/g,"/");
	return cellvalue.substring(0,10);
}

function expandFormatter(cellvalue, options, rowObject) {
	var expand = JSON.parse(cellvalue);
	var html = '<table class="table table-bordered table-condensed" style="margin-bottom: 0px">';
	html += '<tr>';
	$.each(expand, function(key) {
		html += '<th style="width:100px">' + key + '</th>';
	});
	html += '</tr>';
	html += '<tr>';
	$.each(expand, function() {
		var value = checkDateTimeObj(this) ? $.format.date(this,'yyyy-MM-dd') : this;
		html += '<td>' + value + '</td>';
	});
	html += '</tr>';
	html += '</table>';
	return html;
}

function doCheckEndstNameData(url){
	if($("#endst").val() != '') {
		var iWidth = 250; //視窗的寬度;
		var iHeight = 220; //視窗的高度;
		var iTop = (window.screen.availHeight - 30 - iHeight) / 2; //視窗的垂直位置;
		var iLeft = (window.screen.availWidth - 10 - iWidth) / 2; //視窗的水平位置;
		window.open(url+"&entity.endst="+$('#endst').val(), '_black', 'top=' + iTop + ',left=' + iLeft
				+ ',width=920,height=300,toolbar=yes,status=yes,resizable=yes,location=1');
	} else {
		showMsg("請先選擇版本");
	}
}

function chageTitle(obj){
	$(obj).attr("title",$(obj).find(":selected").text());
}

//FOR 記憶查詢CHANNEL SELECT 
function setChannelSelectList(type){
	var channelSelectList = '';
	var channelQryType = $('input[name=channelQryType]:checked').val().toLowerCase();
	if(!"cs" == channelQryType) {
		channelSelectList = '';
		$("#channelSelectList").val(channelSelectList);
	} else if("cs" == channelQryType){
		var chSelector = "#chSelectorCS";
		var i = 1;
		while($(chSelector+i).length > 0) {
			channelSelectList = channelSelectList ==''?'':channelSelectList+",";
			channelSelectList += i + ":" +$(chSelector+i).val();
			i++;
		}
		$("#SelectListCS").val(channelSelectList);
	}
}
