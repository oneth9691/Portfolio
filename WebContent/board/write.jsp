<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/include/header.jsp" %>
<%request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8");

%> 
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
                		<form id="wrtie_frm" name="wrtie_frm" action="/write.do" method="post" enctype="multipart/form-data">
                		<table border="0" style="width:800px; border-collapse:collapse">
                			<tr class="write_tr1">
                				<td class="write_td1">
                					제목:
                				</td>
                				<td>
                					<input type="text" class=write_textbox placeholder="&nbsp;제목을 입력하세요." id="title"name="title">
                				</td>
                			</tr>
                			<tr>
                				<td colspan="2"  class="write_td2">
                					<textarea  class="write_textarea" placeholder="&nbsp;내용을 입력하세요." id="body"name="body"></textarea>
                				</td>
                			</tr>
                			<tr class="write_tr1">
                				<td class="write_td1">
                					첨부파일:
                				</td>
                				<td>
                					<input type="file" class="write_file" id="file_name" name="file_name">
                				</td>
                			</tr>
                			<tr>
                				<td colspan="2" class="write_td3">
                					<div>
                						<input type="submit" value="작성하기" class="system_btn" id="write_ok_btn">
                						<input type="button" value="취소" class="system_btn" id="write_no_btn">
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
	document.getElementById('write_ok_btn').onclick=function()
	{
		if(document.getElementById("title").value == "" || document.getElementById("body").value == "")
		{
			alert("제목이나 내용을 입력해주세요");
			return false;
		}
		else
		{
			alert("게시글이 작성되었습니다.");
		}
	}
	document.getElementById('write_no_btn').onclick=function()
	{
		document.location.href = "/board/notice.jsp";
	}
	
</script>
<%@include file="/include/tail.jsp" %> 