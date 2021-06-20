<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/include/header2.jsp" %>
<table border="0" class="body3">
	<tr>
		<td>
	    	<table border="0" style="width:35%; height:50%; margin:auto">
	       		<tr>
	       			<td>
	       				<center><h2>로그인</h2></center>
	       			</td>
	       		</tr>
	       		<tr>
	       			<form id="loginfrm" name="loginfrm" action="/Login.do" method="post">
	       			<td>
	       				<div class="button_div">
	       				<input type="text" id="login_id" name="login_id" class="login" placeholder="아이디를 입력하세요.">
	       				</div>
	       			</td>
	       		</tr>
	       		<tr>
	       			<td>
	       				<div class="button_div">
	       				<input type="password" id="login_pw" name="login_pw" class="login" placeholder="비밀번호를 입력하세요.">
	       				</div>
	       			</td>
	       		</tr>
	       		<tr>
	       			<td>
	       				<div class="button_div">
	       				<input type="submit" value="로그인" class="loginButton" >
	       				</div>
	       			</td>
	       			</form>
	       		</tr>
	            <tr>
					<td class="join_move">
						<div class="button_div">
						<a href="/User/join.jsp" class="join_find">회원가입 </a>&nbsp;&nbsp;|&nbsp;&nbsp;
						<a href="/User/find.jsp" class="join_find">아이디 및 비밀번호 찾기</a>
						</div>
					</td>
                </tr>
        	</table>
        </td>
    </tr>
</table>
<%@include file="/include/tail.jsp" %>