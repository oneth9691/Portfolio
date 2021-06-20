<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/include/header.jsp" %> 
<%@page import="dto.*" %>
<%@page import="vo.*" %>
<% response.setContentType("text/html; charset=UTF-8");%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<table border="0" class="body3">
	<tr>
    	<td>
        	<table border="0" class="write_table">
				<tr>
	            	<td class="contetns_title_td1">
	                    <div class="div1"></div>
	                    <div class="div2"></div>
	                </td>
	                <td class="contetns_title">
	                    공지사항
	                </td>
	            </tr>
                <tr class="write_title_tr">
                	<td colspan="2">
                		<form id="viewfrm" name="viewfrm" method="post">
                		<table border="0" style="width:800px; border-collapse:collapse">
                			<tr class="write_tr1">
                				<td class="write_td1">
                					제목:
                				</td>
                				<td colspan="3">
                					<input type="text" class=write_textbox value="${title}" id="title"name="title" readonly/>
                				</td>
                			</tr>
                			<tr class="write_tr1">
                				<td class="write_td1">
                					날짜:
                				</td>
                				<td>
                					<text class="write_text">${wdate}<text>
                				</td>
                				<td class="write_td1">
                					조회수:
                				</td>
                				<td>
                					<text class="write_text">${hit}<text>
                				</td>
                			</tr>
                			<tr>
                				<td class="write_td2" colspan="4">
                					<textarea class="write_textarea" name="body" readonly/>${body}</textarea>
                				</td>
                			</tr>
                			<tr class="write_tr1">
                				<td class="write_td1">
                					첨부파일:
                				</td>
                				<td colspan="3"> 
                					<c:if test="${empty file}">
                					 첨부된 파일이 없습니다.
                					</c:if>
                					<c:if test="${file ne null}">
                						&nbsp;&nbsp;&nbsp;&nbsp;
                						<a href="Down?file_name=${file}" style="color: navy;">${file}</a>
                					</c:if>
                				</td>
                			</tr>
                			<tr>
                				<td colspan="4" class="write_td3">
                					<div>
                						<c:if test="${admin_id eq 'admin'}">
                							<input type="submit" value="수정하기" class="system_btn" id="modify_ok_btn" formaction="/Modify_view.do">
                							<input type="submit" value="삭제" 	class="system_btn" id="modify_delete_btn" formaction="/Delete.do">
                						</c:if>
                						<input type="button" value="목록으로" class="system_btn" id="modify_list_btn">
                						<input type="hidden" name="no" value="${no}">
                					</div>
                				</td>
                			</tr>
                		</table>  
               			</form>    
					</td>
                </tr>
        	</table>           
        </td>
    </tr>
</table>
<script>
	document.getElementById('modify_list_btn').onclick=function()
	{
		document.location.href = "/board/notice.jsp";
	}
	document.getElementById('modify_delete_btn').onclick=function()
	{
		alert("게시글이 삭제되었습니다.");
	}

</script>

<%@include file="/include/tail.jsp" %> 