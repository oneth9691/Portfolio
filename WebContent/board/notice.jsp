<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@include file="/include/header.jsp" %>
<%@page import="dto.NoticeDTO"%>
<%@ page import="vo.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>

a:hover{text-decoration: underline;}
</style>
<%

	int start = 0; int percount = 15; int curpage = 1;
   	String check1 = request.getParameter("check1");
   	if(check1==null)
   	{
   		check1="";
   	}
	String check2 = request.getParameter("check2");
   	if(check2==null)
   	{
   		check2="";
   	}
    String search = request.getParameter("search");
   	if(search==null)
   	{
   		search="";
   	}

    try
    {
    	curpage = Integer.parseInt(request.getParameter("curpage"));
    }catch(Exception e)
    {
      	 
    }
    start = ((curpage - 1) * percount);

    NoticeDTO dto = new NoticeDTO(); 
    ArrayList<NoticeVO> list = dto.notice_list(search,check1,check2,start,percount);
%>

<table border="0" class="body3">
    <tr>      
        <td valign="top">
            <table border="0" class="notice_list_table">
                <tr>
                    <td class="notice_contetns_title_td1">
                        <div class="div1"></div>
                        <div class="div2"></div>
                    </td>
                    <td class="notice_contetns_title">
                        공지사항
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <table border="0" class="notice_search_table">
                            <tr>
                                <td class="notice_search_td1">
                                    <div class="notice_div1"></div>
                                    <div class="notice_div2"></div>
                                    <div class="notice_div3"></div>
                                    <div class="notice_div4"></div>
                                    <div class="notice_div5">상세 검색</div>
                                </td>
                            </tr>
                            <tr>
                            	<form name="list_frm" id="list_frm" method ="post" action="/board/notice.jsp">
                                <td class="notice_search_td2">
                                    <input type="checkbox" id="check" name="check1" value="title" <%if(check1 != ""){out.print("checked");}  %> >&nbsp;&nbsp;&nbsp;&nbsp;제목
                                    <br><br>&nbsp;
                                </td>                                              
                                <td class="notice_search_td3">
                                    <input type="checkbox" id="check" name="check2" value="body" <%if(check2 != ""){out.print("checked");}  %>>&nbsp;&nbsp;&nbsp;&nbsp;내용
                                    <input type="text" class="notice_search_text" value="<%if(search != null){out.print(search);} %>" placeholder="&nbsp;&nbsp;검색어를 입력하세요." id="search"name="search">
                                    <input type="submit" value="search" class="notice_search_btn" id="notice_search_btn">
                                    <br>
                                    <text class="notice_text1"> * 총 <text class="notice_text2">				
									<%=dto.getTotal(search,check1,check2,start,percount)%>
									</text> 건 검색되었습니다.</text>
                                </td>
                                </form>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">                                                   
                        <table border="0" class="notice_list" >
                            <tr class="notice_list_tr1">
                                <td class="notice_tilte_td1">번호</td>
                                <td class="notice_tilte_td2">제목</td>
                                <td class="notice_tilte_td3">작성자</td>
                                <td class="notice_tilte_td4">작성일</td>
                                <td class="notice_tilte_td5">조회수</td>
                            </tr> 
                            	<% 
                            	if(list.size()==0)
	                         	{
	                         	%> 
	                         		<tr class="notice_list_tr2">
	                         		<td colspan="5" style="padding:15px; height:200px;">일치하는 게시글이 없습니다.</td>
	                         		</tr> 
	                         	<%
	                         	}
	                           %>  
	                         	<%
								for(int i = 0; i<list.size(); i++ )
		                        {
	                            %>
	                             <tr class="notice_list_tr2">
	                                <td class="notice_list_td1"><%=list.get(i).getNo() %></td>
	                                <td class="notice_list_td2">
	                                	<a href="/View.do?no=<%=list.get(i).getNo()%>" title="<%=list.get(i).getTitle()%>">
	                                		<%=list.get(i).getTitle()%>
	                                	</a>
	                                </td>
	                                <td class="notice_list_td1">관리자</td>
	                                <td class="notice_list_td1"><%=list.get(i).getWdate()%></td>
	                                <td class="notice_list_td1"><%=list.get(i).getHit()%></td>
	                            </tr>  
	                             <%
		                        }
	                         	 %>                                                 
                        </table>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <table>
                            <td class="notice_page_table1">
                            <%
                            
                            	 int maxpage = dto.getTotal(search,check1,check2,start,percount)/15;
                            	 if(dto.totalNum()%15 != 0 )
                            	 {
                            		 maxpage+=1;
                            	 }
                            	 
                            	 int startno = (curpage / 6) * 5 + 1;
                            	 int endpage = startno + 4;
                            	 
                            	 if(endpage >= maxpage)
                            	 {
                            		 endpage = maxpage;
                            	 }
                            %>
                            	<div class="page_div">
                            			<%
                            			if(curpage < 2)
                                     	{
                                     	%>
                                     		<a href="javascript:alert('첫번째 페이지입니다.');">◀</a>
                                    	<%
                                     	}else
                                     	{
                                     	%>
                                     		<a href="/board/notice.jsp?curpage=<%=curpage-1%>&check1=<%=check1%>&check2=<%=check2%>&search=<%=search%>">◀</a> 
                                     	<%
                                     	}
                                     	for(int i = startno; i<=endpage; i++)
                                     	{	
	                                   	 	if(curpage == i)
	                                   	 	{
	                                   	 	%>	
	                                   	 		<b><a href="/board/notice.jsp?curpage=<%=i%>&check1=<%=check1%>&check2=<%=check2%>&search=<%=search%>"><%=i %></a></b>
	                                   	 	<%
	                                   	 	}else
	                                   	 	{
	                                   	   	%>
	                                     		<a href="/board/notice.jsp?curpage=<%=i%>&check1=<%=check1%>&check2=<%=check2%>&search=<%=search%>"><%=i %></a>
	                                     	<%	
	                                     	}
                                     	}
                                     	if(curpage < maxpage)
    	                                 {
    	                                 %>
                                     		<a  href="/board/notice.jsp?curpage=<%=curpage+1%>&check1=<%=check1%>&check2=<%=check2%>&search=<%=search%>">▶</a>
                                     	<%
                                    	 }else
                                     	{
                                     	%>
                                    	 	<a href="javascript:alert('마지막 페이지입니다.');">▶</a>
                                     	<%
                                    	 }    
                            			%>                         
                                </div>
                            </td>
                            <td class="notice_page_table2">
                            	 <c:if test="${admin_id eq 'admin'}">
                            		<input type="button" value="글쓰기" id="notice_write_btn"class="notice_write_btn">
                            	</c:if>
                            </td>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr> 
</table>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>
<script>

	document.getElementById('notice_search_btn').onclick=function()
	{	
		
			if($("input:checkbox[id=check]:checked").length==0)
			{
				alert("체크박스를 선택해주세요!!!"); 
				return false; 
			}
			if($("#search").val() == "")
			{ 
				alert("검색어를 입력해주세요!!!"); 
				$("#search").focus(); 
				return false; 
			}
	}
	document.getElementById('notice_write_btn').onclick=function()
 	{
		document.location.href = "/board/write.jsp";
 	}
</script>
<%@include file="/include/tail.jsp" %>