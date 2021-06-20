<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
 <%@include file="/include/header2.jsp" %>
 
 <script>
 
 		
 	function info_check()
 	{	
 		var idCheck = $("#idtxt").val();
		var languageCheck = /[ㄱ-ㅎ|ㅏ-ㅓ|가-힣]/;
		if(languageCheck.test(idCheck)){$("#msg1").html("<font color = 'navy'><b>영문 및 숫자만 가능!<b><font>"); return false;}
		
		var nameCheck = $("#nametxt").val();
		var languageCheck2 = /[0-9]|[a-z]|[A-Z]/; //이름 유효성검사 정규식
		if(languageCheck2.test(nameCheck)){alert("이름은 한글만 가능합니다."); return false;}
		
		
 		
 		$.ajax({
 		    url:"/DuplicationCheck.do", //request 보낼 서버의 경로
 		    type:'post', // 메소드(get, post, put 등)
 		    data:{'idtxt': $("#idtxt").val()}, //보낼 데이터
 		    success: function(data) 
 		    {
 		    	if(data == "true")
 		    	{
 		    		$("#msg1").html("<font color = 'navy'><b>사용할 수 있는 아이디입니다.</b></font>");
 		    		$("#check").val("1")
 		    		return true;
 		    	}
 		    	else if(data == "false")
 		    	{
 		    		alert("중복된 아이디입니다.");
 		    		$("#idtxt").focus();
 		    		$("#check").val("0")
 		    		return false;
 		    	}
 		    }
 		});
 		
 		if($("#check").val()==0){return false;}
 		
 		
 		if($("#idtxt").val() == ""){$("#msg1").html("<font color = 'navy'><b>아이디를 입력해주세요!!!<b><font>"); return false;}
 		if($("#pw").val() == ""){$("#msg2").html("<font color = 'navy'><b>비밀번호를 입력해주세요!!!<b><font>"); return false;}
 		if($("#pw2").val() == ""){$("#msg3").html("<font color = 'navy'><b>확인란을 입력해주세요!!!<b><font>"); return false;}
 		if($("#nametxt").val() == ""){$("#msg4").html("<font color = 'navy'><b>이름을 입력해주세요!!!<b><font>"); return false;}
 		if($("#birth").val() == ""){$("#msg5").html("<font color = 'navy'><b>생년월일을 입력해주세요!!!<b><font>"); return false;}
 		if($("#pn").val() == ""){$("#msg6").html("<font color = 'navy'><b>휴대폰 번호를 입력해주세요!!!<b><font>"); return false;}
 		if($("#email").val() == ""){$("#msg7").html("<font color = 'navy'><b>이메일을 입력해주세요!!!<b><font>"); return false;}
 		if($("#cn").val() == ""){$("#msg8").html("<font color = 'navy'><b>인증번호를 입력해주세요!!!<b><font>"); return false;}
 		
 		if($("#idtxt").val().length < 6 || $("#idtxt").val().length > 20){$("#msg1").html("<font color = 'navy'><b>아이디는 6글자 이상 20글자 이하.<b><font>"); return false;}
 		if($("#pw").val().length < 8 || $("#idtxt").val().length > 20){$("#msg2").html("<font color = 'navy'><b>비밀번호는 8글자 이상 20글자 이하.<b><font>"); return false;}
 		if($("#pw2").val().length < 8 || $("#idtxt").val().length > 20){$("#msg3").html("<font color = 'navy'><b>비밀번호 확인은 8글자 이상 20글자 이하.<b><font>"); return false;}
 		if($("#nametxt").val().length > 5){$("#msg4").html("<font color = 'navy'><b>이름은 5글자 이하만 가능.<b><font>"); return false;}
 		if($("#birth").val().length != 8){$("#msg5").html("<font color = 'navy'><b>생년월일은 8글자로 작성.<b><font>"); return false;}

	
		if($("#pw").val() != $("#pw2").val()){alert("비밀번호가 일치하지 않습니다."); return false;}
		
		if(document.joinfrm.cn.value != document.joinfrm.request_cn.value){$("#msg8").html("인증번호가 일치하지 않습니다."); return false;}
		
		alert("회원가입 완료!");
 	}
 	
 	function delete_msg(obj)
 	{
 		if(obj == document.joinfrm.idtxt){$("#msg1").html("");}
 		if(obj == document.joinfrm.pw){$("#msg2").html("");}
 		if(obj == document.joinfrm.pw2){$("#msg3").html("");}
 		if(obj == document.joinfrm.nametxt){$("#msg4").html("");}
 		if(obj == document.joinfrm.birth){$("#msg5").html("");}
 		if(obj == document.joinfrm.pn){$("#msg6").html("");}
 		if(obj == document.joinfrm.email){$("#msg7").html("");}
 		if(obj == document.joinfrm.cn){$("#msg").html("");}
 	}
 	
 	function pw_check()
 	{
 		if($("#pw").val() != $("#pw2").val()){$("#msg3").html("<font color = 'navy'><b>비밀번호가 일치하지 않습니다.<b></font>"); return false;}
 		else if($("#pw").val() == $("#pw2").val()){$("#msg3").html("<font color='navy'><b>비밀번호가 일치합니다.</b></font>");}
 	}
 	
 	function go_duple()
 	{
 		if($("#idtxt").val() == ""){$("#msg1").html("<font color = 'navy'><b>아이디를 입력해주세요!!!<b><font>"); return false;}
 		
 		var idCheck = $("#idtxt").val();
		var languageCheck = /[ㄱ-ㅎ|ㅏ-ㅓ|가-힣]/;
 		
 		if(languageCheck.test(idCheck))
 		{
 			$("#msg1").html("<font color = 'navy'><b>영문 및 숫자만 가능!<b><font>"); return false;
 		}
 		
 		$.ajax({
 		    url:"/DuplicationCheck.do", //request 보낼 서버의 경로
 		    type:'post', // 메소드(get, post, put 등)
 		    data:{'idtxt': $("#idtxt").val()}, //보낼 데이터
 		    success: function(data) 
 		    {
 		    	if(data == "true")
 		    	{
 		    		$("#msg1").html("<font color = 'navy'><b>사용할 수 있는 아이디입니다.</b></font>");
 		    		$("#check").val("1")
 		    	}
 		    	else if(data == "false")
 		    	{
 		    		$("#msg1").html("<font color = 'navy'><b>중복된 아이디입니다.</b></font>");
 		    		$("#idtxt").focus();
 		    		$("#check").val("0")
 		    		return false;
 		    	}
 		    }
 		});
 		
 		
 	}
 	
 	function go_certification()
 	{
 		if($("#email").val() == ""){$("#msg7").html("<font color = 'navy'><b>이메일을 입력해주세요!!!<b><font>"); return false;}
 		
 		var languageCheck3 = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;
		var emailCheck = $("#email").val();
		
		if(!languageCheck3.test(emailCheck)){$("#msg7").html("<font color = 'navy'><b>이메일 형식을 확인해주세요.<b><font>"); return false;}
		

		
	 		 $.ajax({
			    url:"/Certification.do", //request 보낼 서버의 경로
			    type:'post', // 메소드(get, post, put 등)
			    data:{'email': $("#email").val()}, //보낼 데이터
			    success: function(data) 
			    {
			    	if(data != "b")
			    	{
				    	alert("인증번호 전송이 완료되었습니다.");
				    	document.joinfrm.request_cn.value = data;
				    	$("#msg7").html("");
				    	//서버로부터 정상적으로 응답이 왔을 때 실행
			   		}
			    	else if(data == "b")
			    	{
			    		alert("중복된 이메일입니다.");
			    		return false;
			    	}
			        
			    },
			    error: function(err) 
			    {
			    	alert("전송이 실패하였습니다.");
			        //서버로부터 응답이 정상적으로 처리되지 못햇을 때 실행
			    }
			});
	 		 
	 		$("#msg7").html("<font color = 'navy'><b>인증번호 전송중......</b></font>");
 		
 	}
 	
 	function go_duple2()
 	{
 		var nameCheck = $("#nametxt").val();
		var languageCheck2 = /[0-9]|[a-z]|[A-Z]/; 
		
		if(languageCheck2.test(nameCheck)){$("#msg4").html("<font color = 'navy'><b>이름은 한글만 가능!<b><font>"); return false;}
 	}
 	
 	
 </script>
 <!-- onclick="javascript: go_duple()"  -->
<table border="0" class="body3">
	<form id="joinfrm" name="joinfrm" method="post" action="/join.do" onsubmit="javascript: return info_check();">
    <tr class="tr_class">
    	<td>
        	<h2><center>회원가입</center></h2>
        	<br>
            <table border="0" style="width:85%; height:85%; margin:auto;" >
            	<tr class="tr_class">
            		<td class="td_class">
            			아이디
            		</td>
            		<td class="td_class2">
            			<input type="text" name="idtxt" id="idtxt" class="txt_class" onkeydown="javascript:delete_msg(this);" onkeyup="javascript:go_duple();">
            			<input type="hidden" name="check" id="check" value="0">
            			<span id="msg1" ani_type="shake"></span>
            		</td>
            	</tr>
            	<tr class="tr_class">
            		<td class="td_class">
            			비밀번호
            		</td>
            		<td class="td_class2">
            			<input type="password" name="pw" id="pw" class="txt_class" onkeydown="javascript:delete_msg(this)">
            			<span id="msg2"></span>
            		</td>
            	</tr>
            	<tr class="tr_class">
            		<td class="td_class">
            			비밀번호 확인
            		</td>
            		<td class="td_class2">
            			<input type="password" name="pw2" id="pw2" class="txt_class" onkeydown="javascript:delete_msg(this)" onkeyup="javascript:pw_check()">
            			<span id="msg3"></span>
            		</td>
            	</tr>
            	<tr class="tr_class">
            		<td class="td_class">
            			이름
            		</td>
            		<td class="td_class2">
            			<input type="text" name="nametxt" id="nametxt" class="txt_class" onkeydown="javascript:delete_msg(this)" onkeyup="javascript:go_duple2()">
            			<span id="msg4"></span>
            		</td>
            	</tr>
            	<tr class="tr_class">
            		<td class="td_class">
            			생년월일
            		</td>
            		<td class="td_class2">
            			<input type="text" name="birth" id="birth" class="txt_class" onkeydown="javascript:delete_msg(this)">
            			<span id="msg5"></span>
            		</td>
            	</tr>
            	<tr class="tr_class">
            		<td class="td_class">
            			휴대폰번호
            		</td>
            		<td class="td_class2">
            			<input type="text" name="pn" id="pn" class="txt_class" onkeydown="javascript:delete_msg(this)">
            			<span id="msg6"></span>
            		</td>
            	</tr>
            	<tr class="tr_class">
            		<td class="td_class">
            			이메일
            		</td>
            		<td class="td_class2">
            			<input type="text" name="email" id="email" class="txt_class" onkeydown="javascript:delete_msg(this)">
            			<input type="button" value="인증번호 발송" class="join_button1" onclick="javascript: go_certification()">
            			<span id="msg7"></span>
            		</td>
            	</tr>
            	<tr class="tr_class">
            		<td class="td_class">
            			인증번호
            		</td>
            		<td class="td_class2">
            			<input type="text" name="cn" id="cn" class="txt_class" onkeydown="javascript:delete_msg(this)">
            			<input type=text name="request_cn" id="reqeust_cn">
            			<span id="msg8"></span>
            		</td>
            	</tr>                           	
            	<tr class="tr_class">
            		<td colspan="2">
            			<div class="button_div">
            			<input type="submit" value="가입" class="join_button1">
            			<input type="button" value="취소" class="join_button1">
            			</div>
            		</td>
            	</tr>
            </table>
        </td>
    </tr>
    </form>
</table>
<%@include file="/include/tail.jsp" %>