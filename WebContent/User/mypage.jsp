<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/include/header.jsp" %> 
<table border="0" class="body3">
    <tr>
        <td>
        	<form id="myinfoFrm1" name="myinfoFrm1" method="post" action="/Myinfo_modify.do">
        	<table border="0" class="con1"> <!-- 이메일 변경 테이블 -->
                <tr>
                    <td class="contetns_title_td1">
                        <div class="div1"></div>
                        <div class="div2"></div>
                    </td>
                    <td class="contetns_title">
                        이메일 변경
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="2">
                   		<div class="mypage_div"> 
                        	<div class="mypage_email_div">
                        		이메일 : &nbsp; <input type="text" class="mypage_textbox2"  value="<%try{out.print(user.getEmail());}catch(Exception e){}%>" id="email_text" name="email_text">
                        		 &nbsp; &nbsp;<input type="button" value="변경하기" class ="system_btn"
													id="email_btn" name="email_btn"	>
                        		 <input type="hidden" name="type" value="email">
                        	     <span id="msg1" ani_type="shake"></span>
                        	</div>
                    	</div>
                    </td>
                </tr>
            </table>
            </form>
            <form id="myinfoFrm2" name="myinfoFrm2" method="post" action="/Myinfo_modify.do">
            <table border="0" class="con2"> <!-- 전화번호 변경 테이블 -->
            	<tr>
                    <td class="contetns_title_td1">
                        <div class="div1"></div>
                        <div class="div2"></div>
                    </td>
                    <td class="contetns_title">
                        전화번호 변경
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="2">
                    	<div class="mypage_div">
                    		<div class="mypage_ph_div">
                        		전화번호 : &nbsp;<input type="text"class="mypage_textbox2" value="<%try{out.print(user.getPn());}catch(Exception e){}%>" id="pn_text" name="pn_text"> 
                        		&nbsp; <input type="button" value="변경하기" class ="system_btn" id="pn_btn" name="pn_btn" >
                        		<input type="hidden" name="type" value="pn">	
                        		<span id="msg1" ></span>
                        	</div>
                        </div>
                    </td>
                </tr>
            </table>
            </form>
            <form id="myinfoFrm3" name="myinfoFrm3" method="post" action="/Myinfo_modify.do">
             <table border="0" class="con3"> <!-- 비밀번호 변경 테이블 -->
            	<tr>
                    <td class="contetns_title_td1">
                        <div class="div1"></div>
                        <div class="div2"></div>
                    </td>
                    <td class="contetns_title">
                        비밀번호 변경
                    </td>
                </tr>
                <tr>
                    <td align="center" style="border-top: none;" colspan="2">
                    	<div class="mypage_div"> 
                    		<div class="mypage_pw_div1">
                    			새 비밀번호 : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    			<input type="password" class="mypage_textbox1" id="pw_text1" name="pw_text1">
                    			<span id="msg1" ></span>
                    		</div>
                    		<div class="mypage_pw_div2">
	                    		새 비밀번호 확인 : &nbsp;<input type="password" class="mypage_textbox1"  id="pw_text2" name="pw_text2" >
	                    		<span id="msg1" ></span> 
	                    		&nbsp; <input type="button" value="변경하기" class ="system_btn" id="pw_btn" name="pw_btn">
	                    		<input type="hidden" name="type" value="pw">
                    		</div> 
                        </div>
                    </td>
                </tr>
            </table>
            </form>
            <form id="myinfoFrm4" name="myinfoFrm4" method="post" action="/Myinfo_modify.do" >
            <table border="0" class="con4"> <!-- 회원탈퇴 테이블 -->
                <tr>
                    <td class="contetns_title_td1">
                        <div class="div1"></div>
                        <div class="div2"></div>
                    </td>
                    <td class="contetns_title">
                        회원탈퇴
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="2">
                    	<div class="mypage_div">
                    		 <div class="mypage_delete_div" ><input type="submit" value="탈퇴하기"  class ="system_btn" onclick="javascript:delete_check();"></div>
                        	 <input type="hidden" name="type" value="delete" id="delete_btn" name="delete_btn">
                        </div>
                    </td>
                </tr>
            </table> 
			</form>           
        </td>
    </tr>
</table>
<%@include file="/include/tail.jsp" %>

<script>	
	$(function()
	{  
		$("#email_btn").on("click",function()
     	{ 
			var email = $("#email_text").val();
			var emailregex = /[a-z]+(\.[a-z]+){1,2}$/;
			
			var emailregex = emailregex.exec(email);
			if(emailregex == null)
			{
		   		alert("이메일양식을 다시 확인해주세요");
	     		retrun;
     	 	}
       	   	$("#myinfoFrm1").submit();
	       	$.ajax
	       	({
	       	    url:"/MyinfoCheck.do", 
	       	    type:'post',
	       	    data:{'email_text': $("#email_text").val()}, 
	       	    success: function(data) 
	       	    {
	       	    	if(data == "true")
	       	    	{
	       	    		alert("중복된 이메일입니다.");
	       	    		$("#email_text").val("");
	       	    		$("#email_text").focus();
	       	    		return false;
	       	    	}
	       	    	else if(data == "false")
	       	    	{
	       	    		alert("이메일이 변경되었습니다."); 
	       	    		document.myinfoFrm.submit();
	       	    	}
	       	    }
	       	});
		})

		$("#pn_btn").on("click",function()
		{
		
			var pn = $("#pn_text").val();
			var pnregex = /^01\d\d{3,4}\d{4}$/;
			
			var pnregex = pnregex.exec(pn);
			if(pnregex == null)
			{
			  alert("핸드폰번호양식을 다시 확인해주세요");
			  retrun;
			}
		  	$("#myinfoFrm2").submit();
		  	alert("핸드폰번호가 변경되었습니다.");
		})
		
		$("#pw_btn").on("click",function()
		{
		
			var pw = $("#pw_text1").val();
			var pwregex = /^[A-Za-z\d]{8,20}$/;
		
			
			var pwregex = pwregex.exec(pw);
		    if(pwregex == null)
		    {
			    alert("비밀번호는 영어 대소문자와 숫자를 포함한 8~20자로 변경해주세요");
			    retrun;
		    }else if($("#pw_text1").val()!==$("#pw_text2").val())
		    {
		       alert("변경할 비밀번호가 일치하지 않습니다.");
		       retrun;
		    }
	     		$("#myinfoFrm3").submit();
				alert("비밀번호가 변경되었습니다.");
		})
		
		$("#delete_btn").on("click",function()
		{
			$("#myinfoFrm4").submit();
			alert("회원탈퇴가 완료되었습니다.");
		})
	})    
</script>