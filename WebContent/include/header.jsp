<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="dto.*" %>
<%@page import="vo.*" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/css/mainStyle.css">
<script src="/js/jquery-3.6.0.min.js"></script>
</head>

 <%
	String islogin = (String)session.getAttribute("islogin");
 	String admin_id = null; String type = null; UserVO user = null;
	
	if(islogin != null && islogin.equals("true"))
	{	
		admin_id = (String)session.getAttribute("admin_id");
		user = (UserVO)session.getAttribute("user");			
%>
<%
	}
	else
	{
%>	
		<script>alert("로그인이 필요한 서비스 입니다.");
		document.location.href="/User/login.jsp";</script>
<%	
	}
	
	if(admin_id != null && admin_id.equals("admin")){type = "hidden";} else{type = "submit";}
	String toggle = (String)request.getAttribute("toggle");
	String toggle3 = (String)request.getAttribute("toggle3");
	if(toggle3 != null && toggle3.equals("3"))
	{
		type = "hidden";
		
	%>
		<script>
		window.onload = function()
		{
			$("#msg").html("오늘은 더 이상 출석 체크를 할 수 없습니다.");
		}
		</script>
	<%
	}
	
	System.out.println("변동toggle값:" + toggle);
	
	boolean ud = false;
	
	try
	{
		ud = (boolean)request.getAttribute("ud");
	}
	catch(Exception e)
	{
		
	}

%> 

<body>
    <table border="0" class="wrap0">
        <tr>
            <td  class="wrap0_td1">
                <table border="0" class="body1">
                    <tr>
                        <td class="body1_td1">출석관리프로그램</td>
                        <td class="body1_td2">*** <%if(admin_id != null){out.print(admin_id);}else if(user != null){out.print(user.getUsername());} %>님 환영합니다. ***</td>
                        <td class="body1_td3"><a href="/Myinfo.do">내정보관리</a></td>
                        <td class="body1_td3"><a href="/Logout.do">로그아웃</a></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="wrap0_td2">
                <table  border="0" class="body2">
                    <tr>
                        <td class="body2_td1"><a href="<%if(user != null){out.print("/UserMain.do");}else if(admin_id != null){out.print("/AdminMain.do");}else{out.print("/User/login.jsp");} %>">출첵을 합시다</a></td>
                        <td class="body2_td2"><a href="/board/notice.jsp">공지사항</a></td>
                        <%if(user != null){%><td class="body2_td3"><a href="/UserMain.do">출석페이지</a></td> <%} %>
                        <%if(admin_id != null){%><td class="body2_td3"><a href="/AdminMain.do">관리자페이지</a></td><%}%> 
                        <form id="checkfrm" name="checkfrm" action="/InOutCheck.do" method="post">
                        	<td class="body2_td4">
                        		<%
                        			if(ud == true)
                        			{
                        		%>
                        		<input type="<%=type %>" value="<%if(toggle != null && toggle.equals("0"))
                        		{out.print("입실하기");}else if(toggle != null && toggle.equals("1")){out.print("퇴실하기");} %>" class="check_button" style="cursor:pointer;">
                        		<%
                        			}
                        		%>
                        		<span id="msg" ></span>
                        		<input type="hidden" id="toggle" name="toggle" value="<%=toggle %>">
                        		
                        	</td>
                        </form>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="wrap0_td3">