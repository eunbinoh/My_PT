<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
 
<!DOCTYPE html>
<html>
<head>
 
<meta charset="UTF-8">
   <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <title>JoinUs</title>
    
<style>
body {
    background-color: #c1dff0;
    font-family: 'Do Hyeon', sans-serif;
	overflow: scroll;
}

form {
    width: 280px;
    padding: 30px;
    background-color: snow;
    border-radius: 80px;
    font-weight: 800;
    color: #c1dff0;

}
#wrap{
	width: 330px;
	height: 100%;
	margin: 100px auto;
    text-align: center;
}

fieldset {
    font-size: 12px;
    border: 0;
    margin-bottom: 10px;
}

fieldset input:not([type="checkbox"]) {
    width: 10em; height: 1.5em;
    padding: 5px 15px 2px 2px;
    text-align: center;
    font-size: 12px;
    margin: 10px 10px 1px 5px;
    border:snow;
    border-radius: 10px;
}
fieldset label {
    text-align: left;
    font-size: 12px;
    margin: 5% 3% 1% 5% ;
    border:white;
}

#joinBtn{
    background-color: #c1dff0;
    color: white;
    text-align: center;
    font-weight: 700;
    width: 100px; 
    border: 2px solid #c1dff0;
    border-radius: 10px;
}
 #emailbtn {
    background-color: #c1dff0;
    color: white;
    height: 15px;
    width: 130px; 
    margin: 10px 0 0 50px;
    padding: 0 10% 0 10%;
    border-radius: 10px;
 }
 #eNum{
     margin: 10px 0 0 50px;
     padding: 0 10% 0 10%;
     width: 80px; 
     border-radius: 10px;
 }

select {
    -moz-appearance: none;
	-webkit-appearance: none;
	appearance: none;
	width: 140px; 
	height:20px;	
	font-size: 12px;
	margin: 10px 0 0 5px;
	padding: 1px 1px 1px 20%;
	color: #a4a4a5;
	border: 1px solid white;
	border-radius: 10px;
}
p{ 	size: 10px;
	margin: 1px 0px -15px 15px;}
a{ text-decoration:none;
	color: white;
	font-weight: bold;
	font-size:15px;}   
</style>
</head>
<body>

    <div id="wrap">
        <h1><span style="color:snow; font-size: 50px;"> JOIN</span></h1>
        <form action="<%= request.getContextPath()%>/insert.me" method="post" id="joinForm" name="joinForm" onsubmit="return validate();">
            <fieldset>
                <label >ID </label>
                	<input type="text" name="userId" id="userId" minlength="4" maxlength="12" placeholder="????????? ??????"><br>
                <p id="message1"></p><br>
                                
                <label >PW</label>
                <input type="password" name="userPwd" id="pw1" minlength="4" maxlength="15" placeholder="???????????? ??????"><br>
                
                <label > PW</label>
                <input type="password" name="userPwd2" id="pw2" minlength="4" maxlength="15" placeholder="???????????? ??????"><br>
                <p id="message2"></p><br>
                
                <label >NAME</label>
                <input type="text" name="userName" id="userName" minlength="2" maxlength="12" placeholder="?????? ??????"><br>
                
                <label >NICK</label>
                <input type="text" name="nickName" id="nickName" maxlength="12" placeholder="????????? ??????"><br>
                
                <label >AGE</label>
                <input type="text" name="age" id="age" size="10px;" placeholder="?????? ??????"><br>
                <p id="message3"></p><br>
                
                <label >GEN</label>
                <select id="gender" name="gender">
                    <option disabled selected>??????</option>
                    <option value="???" id="female">??????</option>
                    <option value="???" id="male">??????</option>
                </select><br>
                
                <label >PHONE</label>
                <input type="text" name="phone" id="phone" placeholder="(010-000-0000)"><br>
                <p id="message4"></p><br>
                
                <label >EMAIL</label>
                <input type="text" id="email" name="email" placeholder="__@__.__"><br>
                <input type="button" id="emailbtn" value="????????? ??????">
                <input type="text" id="eNum" name="emailNum" placeholder="???????????? ??????"><br>
                <p id="message5"></p><br>
                
                <label >ADDRESS</label>
                <input type="text" name="address" placeholder="?????? ?????? (????????????)"><br><br>

                <label>V ???????????? ?????? ??????</label><br>
	                <input type="checkbox" id="sal" name="ffood" value="?????????">
	                <label for="sal">?????????</label>              
	                <input type="checkbox" id="chiken" name="ffood" value="????????????">
	                <label for="chiken">????????????</label><br>      
	                <input type="checkbox" id="shake" name="ffood"  value="??????????????????">
	                <label for="shake">??????????????????</label>         
	                <input type="checkbox" id="dosirak" name="ffood" value="?????????" >
	                <label for="dosirak">?????????</label>
	               
                <br>
            </fieldset>
            <input type="submit"  value="JOIN" id="joinBtn">
        </form>
	        <a href="<%= request.getContextPath() %>">???????????????</a>
    </div>
</body>

<script>

var emailCheck = false;

function validate(){
	var Id = $('#userId');
	var pwd1 = $('#pw1');
	var pwd2 = $('#pw2');
	var name = $('#userName');
	var nick = $('#nickName');
	var gen = $('#gender');
	var ages = $('#age');
	var phones = $('#phone');
	var email = $('#email');
	var en = $('#eNum');

	
	var Acheck = RegExp(/[0-9]{2,3}$/);
	var Pcheck = RegExp(/01[0126789]-[0-9]{3,4}-[0-9]{3,4}$/);
	var Echeck = RegExp(/[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/);
	if(!Acheck.test(ages.val())){
		$('#message3').text("?????? ????????? ?????? ???????????? ??????????????????");
		$('#message3').css('color','orangered');
		ages.focus();
		return false;
	}else{
		$('#message3').hide();
	}
	
	if(!Pcheck.test(phones.val())){
		$('#message4').text("010-000-0000 ???????????? ??????????????????");
		$('#message4').css('color', 'orangered');
		phones.focus();
		return false;
	}else{
		$('#message4').hide();
	}
	
	if(!Echeck.test(email.val())){
		$('#message5').text("__@__.__ ???????????? ??????????????????");
		$('#message5').css('color', 'orangered');
		email.focus();
		return false;
	}else{
		$('#message5').hide();
	}
	
	if(Id.val().trim().length == 0){
		alert("???????????? ???????????????");
		id.focus();
		return false;
	}

	if(pwd1.val().trim().length == 0){
		alert("??????????????? ???????????????");
		pwd1.focus();
		return false;
	}

	if(pwd1.val() != pwd2.val()){
		alert("??????????????? ???????????????");
		pwd2.focus();
		return false;
	}
	if(name.val().trim().length == 0){
		alert("????????? ???????????????");
		name.focus();
		return false;
	}

	if(nick.val().trim().length == 0){
		alert("???????????? ???????????????");
		nick.focus();
		return false;
	}
	if(ages.val().trim().length == 0){
		alert("????????? ???????????????");
		ages.focus();
		return false;
	}

	if(gen.val() == null){
		alert("????????? ???????????????");
		gen.focus();
		return false;
	}
	if(phones.val().trim().length == 0){
		alert("??????????????? ???????????????");
		phones.focus();
		return false;
	}

	if(email.val().trim().length == 0){
		alert("???????????? ???????????????");
		email.focus();
		return false;
	}
	if(en.val().trim().length == 0 || emailCheck == false){
		alert("???????????? ????????? ??????????????????");
		en.focus();
		return false;
	}

	alert("??????????????????! ?????????????????????.");
	return true;
}

	$('#userId').blur(function(){
		var Id = $('#userId').val();	

		$.ajax({
			type: 'post',
			async:false,
			url: '<%= request.getContextPath()%>/checkId.me',
			dataType:'text',
			data:{"Id": Id},
			success: function(result, textStatus){
					console.log(" success result:"+result)
				if(result == 'usable'){
					$('#message1').text('Very Nice!');
					$('#message1').css('color','skyblue');
					
				}else{
					$('#message1').text('?????? ??????????????????.');
					$('#message1').css('color','orangered');
				}
			},
			error:function(result, textStatus){
				console.log('error');
			}
		}); //ajax
	});
	
	$("#pw2").keyup(function(){
		console.log($(this).val());
		if($("#pw1").val() == $("#pw2").val()){
			$("#message2").text("??????????????? ???????????????");
			$('#message2').css('color','skyblue');
		}else{
			$('#message2').text("??????????????? ????????????????????????");
			$('#message2').css('color','orangered');
		}
	});
	
	
	$("#emailbtn").on('click',function(){
		var receiver = $('#email').val();	
		if($('#email').val().trim()!= 0){
			alert("????????? ?????????????????????. ??????????????? ??????????????????!");		
		}else{
			$('#email').focus();
		}
		$.ajax({
			url: '<%= request.getContextPath()%>/send.do',
			data:{'receiver': receiver},
			success: function(data){
					console.log(" receiver:"+receiver);
					console.log(" data:"+data);
					
					$("#eNum").blur(function(){
						console.log("eNum"+$('#eNum').val());
						console.log("data"+data);
						var eNum = $('#eNum').val();
						if(eNum.trim()==data.trim()){
							$('#message5').text('?????? ??????????????????');
							$('#message5').css('color','skyblue');
							emailCheck = true;
						}else{
							$('#message5').text('?????? ??????????????????. ???????????? ???????????????');
							$('#message5').css('color','orangered');
							emailCheck = false;
							$('#email').focus();
							
						}
					});
			},
			error:function(data){
				
				console.log(' email error');
				console.log(" receiver:"+receiver);
				console.log(" data:"+data);
			}
		}); //ajax
	});
	

	
</script>
</html>
