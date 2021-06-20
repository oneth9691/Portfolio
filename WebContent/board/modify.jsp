<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/include/header.jsp" %> 
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
                		<form id="modify_frm" name="modify_frm" method="post">
                		<table border="0" style="width:800px; border-collapse:collapse">
                			<tr class="write_tr1">
                				<td class="write_td1">
                					제목:
                				</td>
                				<td>
                					<input type="text" class=write_textbox value="${title}"name="title">
                				</td>
                			</tr>
                			<tr>
                				<td colspan="2"  class="write_td2">
                					<textarea class="write_textarea" name="body">${body}</textarea>
                				</td>
                			</tr>
                			<tr class="write_tr1" id="attachOrgn">
                				<td class="write_td1">
                					첨부파일:
                				</td>
                				<td>
	                				<c:choose>
		                				<c:when test="${empty file}">
		                					<input type="file" class="write_file" id="file" name="file">
		                				</c:when>
		                				<c:otherwise>
		                					${file} [ <a href="javascript:ToggleFile();" style="color: #555; font-weight:600">x</a> ] 
		                				</c:otherwise>
	                				</c:choose>             				
                				</td>
                			</tr>
                			<tr id="attachFile" style="display:none;">
                				<td class="write_td1">				
                					첨부파일:
                				</td>                			
                				<td id="modify_file_td">
                					<input type="file" class="write_file" id="file" name="file">
                				</td>
                			</tr>
                			<tr>
                				<td colspan="2" class="write_td3">
                					<div>
                						<input type="submit" value="확인" class="system_btn" id="modify_ok_btn" formaction="/Modify.do">
                						<input type="submit" value="삭제" class="system_btn" id="modify_delete_btn" formaction="/Delete.do">
                						<input type="button" value="취소" class="system_btn" id="modify_no_btn">
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
	function ToggleFile()
	{
		$("#attachOrgn").toggle();
		$("#attachFile").toggle();
	}

	document.getElementById('modify_ok_btn').onclick=function()
	{
		alert("게시글이 저장되었습니다.");
	}
	document.getElementById('modify_delete_btn').onclick=function()
	{
		alert("게시글이 삭제되었습니다.");
	}
	document.getElementById('modify_no_btn').onclick=function()
	{
		document.location.href = "/board/notice.jsp";
	}
</script>
<%@include file="/include/tail.jsp" %> 