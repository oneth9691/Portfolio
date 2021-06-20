<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="dto.*" %>
<%@page import="vo.*" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.*" %>
<script src="/js/jquery-3.6.0.min.js"></script>    
<%
AdminMainDTO admin = (AdminMainDTO)request.getAttribute("admin");
SubjectDTO	subject = (SubjectDTO)request.getAttribute("subject");
StudentInfoVO info = (StudentInfoVO)request.getAttribute("info");
%>    
<form id="info_frm" name="info_frm" action="Withdrawal.do" method="post" onsubmit="return confirm('정말 탈퇴 시키겠습니까?');">
 <table border="0" class="userinfo">
     <tr>
         <td class="userinfo_td">
             이름:
         </td>
         <td class="userinfo_td">
             <input type="text" id="username" name="username" value="<%if(info.getUsername()!=null){out.print(info.getUsername());}else{out.print("");} %>" class="userinfo_text"readonly/> 
         </td>
     </tr>
     <tr>
         <td class="userinfo_td">
             수강과목:
         </td>
         <td class="userinfo_td">
             <input type="text"  class="userinfo_text" value="<%if(info.getSubject() != null){out.print(info.getSubject());}else{out.print("");} %>" readonly/>
         </td>
     </tr>
     <tr>
         <td class="userinfo_td">
             수강시작일:
         </td>
         <td class="userinfo_td">
             <input type="text" class="userinfo_text" readonly value="<%if(info.getStart_day()!=null){out.print(info.getStart_day());}else{out.print("");} %>" >
         </td>
     </tr>
     <tr>
         <td class="userinfo_td">
             수강종료일:
         </td>
         <td class="userinfo_td">
             <input type="text" class="userinfo_text" readonly value="<%if(info.getEnd_day()!=null){out.print(info.getEnd_day());}else{out.print("");} %>" >
         </td>
     </tr>
     <tr>
         <td class="userinfo_td">
             이메일:
         </td>
         <td class="userinfo_td">
             <input type="text" id="email" name="email"  class="userinfo_text" readonly value="<%if(info.getEmail()!=null){out.print(info.getEmail());}else{out.print("");} %>" >
         </td>
     </tr>
     <tr>
         <td class="userinfo_td">
             전화번호:
         </td>
         <td class="userinfo_td">
             <input type="text" class="userinfo_text" readonly value="<%if(info.getPn()!=null){out.print(info.getPn());}else{out.print("");} %>" >
         </td>
     </tr>
     <tr>
         <td colspan="2" class="userinfo_td2">
             <input type="submit" value="탈퇴" class="system_btn">
         </td> 
         
     </tr>                           
 </table>
 </form>