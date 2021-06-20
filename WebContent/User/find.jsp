<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@include file="/include/header2.jsp" %> 

<script>
function check()
{
	if($("#username").val() == ""){alert("이름을 입력하세요."); $("#username").focus(); return false;}
	if($("#useremail").val() == ""){alert("이메일을 입력하세요."); $("#useremail").focus(); return false;}
	 
	return true;
}

function go_find()
{
	if($("#userid").val() == ""){alert("아이디를 입력하세요."); $("#userid").focus(); return false;}
	if($("#useremail2").val() == ""){alert("이메일을 입력하세요."); $("#useremail2").focus(); return false;}
	//if($("#emailok").val() == ""){alert("인증번호를 입력하세요."); return false;}
	
	$.ajax({
	    url:"/FindPW.do", //request 보낼 서버의 경로
	    type:'post', // 메소드(get, post, put 등)
	    data:{'email': $("#useremail2").val(),'id':$("#userid").val()}, //보낼 데이터
	    success: function(data) 
	    {
	    	alert("인증번호 전송이 완료되었습니다.");
	        document.find_pw.response.value = data;
	    },
	    error: function(err) 
	    {
	    	alert("전송이 실패하였습니다.");
	        //서버로부터 응답이 정상적으로 처리되지 못햇을 때 실행
	    }
	}); 
}

function go_find2()
{
	if(document.find_pw.response.value != document.find_pw.emailok.value){alert("인증번호가 일치하지 않습니다."); document.find_pw.response.focus(); return false;}
	if(document.find_pw.emailok.value == ""){alert("인증번호를 입력해주세요."); document.find_pw.emailok.focus(); document.find_pw.emailok.focus(); return false;}
}
</script>

<table border="0" class="body3">
	<tr>
	    <td valign="top" class="find_table">
			<table border="0" class="findId_table" >
				<tr>
					<td class="contetns_title_td1">
					    <div class="div1"></div>
					    <div class="div2"></div>
					</td>
					<td class="contetns_title">
					    아이디 / 비밀번호 찾기
					</td>
         		</tr>
         		<tr>
         			<td colspan="2">
         				<div class="find_div1">	
          				<table border="0">
            				<tr>
 								<td colspan="2" class="findId_table_td0">
 								<center><h2>아이디 찾기</h2></center>
								</td>	
							</tr>
 							<tr>
 							<form id="find_id" name="find_id" action="/FindID.do" method="post" onsubmit="javascript: return check()">
								<td colspan="2" class="findId_table_td1">
									<input type="text" name="username" id="username" class="findtxt" placeholder="&nbsp;이름을 입력해주세요.">
								</td>
							</tr>
							<tr>
								<td class="findId_table_td2">
									<input type="text" name="useremail" id="useremail" class="findtxt" placeholder="&nbsp;이메일을 입력해주세요.">
								</td>
								<td>
									<input type="submit" value="찾기" class="find_Button">
								</td>
							</form>
							</tr>				            	
          				</table>
          				</div>
         			</td>
         		</tr>
			</table>
	    </td>
		<td valign="top"> 
			<table  border="0" class="findPw_table">
				<tr>
					<td></td>
				</tr>
				<tr>
					<td>
						<table border="0" class="find_div1">
							<tr class="find_div1_tr">
								<td colspan="2" class="findPw_table_td0" >
									<center><h2>비밀번호 찾기</h2></center>
								</td>	
							</tr>
							<tr>
							<form id="find_pw" name="find_pw" action="/FindPW2.do" method="post" onsubmit="javascript: return go_find2()">
								<td colspan="2" class="findPw_table_td1">
									<input type="text" name="userid" id="userid" class="findtxt" placeholder="&nbsp;아이디를 입력해주세요.">
								</td>
							</tr>
							<tr>
								<td class="findPw_table_td2">
									<input type="text" name="useremail2" id="useremail2" class="findtxt" placeholder="&nbsp;이메일을 입력해주세요.">
								</td>
								<td>
									<input type="button" value="인증번호 전송" class="find_Button" onclick="javascript: go_find()">
								</td>
							</tr>
							<tr>
								<td class="findPw_table_td3">
									<input type="text" name="response" id="response">
									<input type="text" name="emailok" id="emailok" class="findtxt" placeholder="&nbsp;인증번호를 입력해주세요.">
								</td>
								<td>
									<input type="submit" value="찾기" class="find_Button">
								</td>
								</form>
							</tr>
						</table>
					</td>
				</tr>
   			</table>
	    </td>
	</tr>
</table>
<%@include file="/include/tail.jsp" %>