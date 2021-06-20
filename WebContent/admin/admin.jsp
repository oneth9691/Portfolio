<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/include/header.jsp" %>

<%
	 AdminMainDTO admin = (AdminMainDTO)request.getAttribute("admin");
	 SubjectDTO	subject = (SubjectDTO)request.getAttribute("subject");
	 StudentInfoVO info = (StudentInfoVO)request.getAttribute("info");	 
	ArrayList<Student_InOut_VO> in_search = (ArrayList<Student_InOut_VO>)request.getAttribute("in_search");
	
	PagingDTO paging = new PagingDTO();
	
	String sub = request.getParameter("op");
	if(sub == "") {sub = null;}
	else if(sub != null && sub.equals(" 과목을 선택해주세요.")){sub = null;}
	String date = request.getParameter("list_date");
	if(date == "") {date = null;}
	String name = request.getParameter("list_name");
	if(name == "") {name = null;}
	
	
%>

<script>
	function CheckSubject()
	{
 		$.ajax({
 		    url:"/SubjectCheck.do", //request 보낼 서버의 경로
 		    type:'post', // 메소드(get, post, put 등)
 		    data:{'1': $("#sj_name").val()}, //보낼 데이터
 		    success: function(data) 
 		    {
 		    	if(data == "true")
 		    	{
 		    		alert("중복된 과목입니다.");
 		    		document.subadd.sj_name.value = "";
 		    		document.subadd.sj_start.value = "";
 		    		document.subadd.sj_end.value = "";
 		    		document.subadd.sj_name.focus();
 		    		return;
 		    	}
 		    	else if(data == "false")
 		    	{
 		    		alert("과목이 생성되었습니다.");
 		    		subadd.submit();
 		    	}
 		    }
 		});	
	}
	
	function sub_add(){if($('input:checkbox[id="new_check"]').is(":checked") == false){alert("수강생을 선택 하셔야합니다."); return;}}
	
	function ViewStudent(param)
	{
		//alert(param);
		$.ajax({
 		    url:"/AdminMain.do", //request 보낼 서버의 경로
 		    type:'post', // 메소드(get, post, put 등)
 		    data:param, //보낼 데이터
 		    success: function(data) 
 		    {
 		    	$("#dataStudent").html(data);
 		    }
 		});
		
	}
	
	function selectAll(selectAll)  
	{
	  const checkboxes 
	     = document.querySelectorAll('input[type="checkbox"]');
	  
	  checkboxes.forEach((checkbox) =>
	  {
	    checkbox.checked = selectAll.checked
	  })
	}
	
	$('.sub_direct_btn').click(function (e) {
	    e.preventDefault();
	})
	
	function check()
	{
		if($("#op").val() == "" || $("#op").val() == "과목을 선택해주세요."){alert("과목을 선택해주세요."); return false;}
		if($("input:checkbox[name=new_check]:checked").length ==0){alert("학생을 선택해 주세요."); return false;}
		
		return true;
	}

</script>

<form name="subadd" id="subadd" method="post" action="/SubjectAdd.do" onsubmit="javascript:return check();">
<table border="0" class="body3">
    <tr>
        <td valign="top">
        
            <table border="0" class="newlist_table">
                <tr>
                    <td class="contetns_title_td1">
                        <div class="div1"></div>
                        <div class="div2"></div>
                    </td>
                    <td class="contetns_title">
                        신규 학생 리스트
                    </td>
                </tr>
                <tr>
                    <td class="newlist_table_td2" colspan="2">
                        <div style="overflow:scroll; width:950px; height:400px;">
                        
                        <table border="0" class="newlist">
                            <tr class="list_tr0">
                                <td class="newlist_title_td1"><input type="checkbox" id="new_all_check" onclick='selectAll(this)'></td>
                                <td class="newlist_title_td2">학생명</td>
                                <td class="newlist_title_td3">생년월일</td>
                                <td class="newlist_title_td4">전화번호</td>
                                <td class="newlist_title_td5">이메일</td>
                                <td class="newlist_title_td6">탈퇴선택</td>
                            </tr>
                            
                           <% 
                           		int flag = 2;
                           		int hihi = 0;
                      			
                           		if(admin != null)
                           		{
	                       		 	for(int i = 0; i < admin.new_student_list().size(); i++)
	                       		 	{		
	                       		 		if((flag % 2) == 0)
	                       		 		{
	                       		 			hihi = 2;
	                       		 		}
	                       		 		else if((flag % 2) == 1)
	                       		 		{
	                       		 			hihi = 1;
	                       		 		}
                       		 		
                       		 %>
	                            <tr class="list_tr<%=hihi%>">
	                                <td class="newlist_td1"><input type="checkbox" id="new_check" name="new_check" value="<%=admin.new_student_list().get(i).getInfo_no() %>"></td>
	                                <td class="newlist_td1"><%=admin.new_student_list().get(i).getUsername() %></td>	
	                                <td class="newlist_td1"><%=admin.new_student_list().get(i).getBirth() %></td>
	                                <td class="newlist_td1"><%=admin.new_student_list().get(i).getPn() %></td>
	                                <td class="newlist_td1"><%=admin.new_student_list().get(i).getEmail() %></td>
	                                <td class="newlist_td1"><input type="button" value="탈퇴" class="system_btn" onclick="javascript:go_del('no=<%=admin.new_student_list().get(i).getInfo_no() %>')"></td>
	                            </tr>
	                          <%
	                          			flag = flag + 1;
	                       		 	}
                           		}
	                          %>  
	                     
                        </table>
                        </div>
                    </td>
                </tr>
            </table>
        </td>
        <td valign="top">
            <table border="0" class="subject_add_table">
                <tr>
                    <td class="contetns_title_td1">
                        <div class="div1"> </div>
                        <div class="div2"> </div> 
                        <td  class="contetns_title">
                            수강과목 추가
                        </td>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <table border="0" class="subject_add">
                            <tr>
                            	
                                <td class="subject_add_td1">
                                    수강과목:
                                </td>
                                <td class="subject_add_td2">
                                    <input type="text" placeholder="&nbsp;과목명을 입력하세요." class="text_box" id="sj_name" name="sj_name">
                                </td>
                            </tr>
                            <tr>
                                <td class="subject_add_td1">
                                    수강시작일:
                                </td>
                                <td class="subject_add_td2">
                                    <input type="text" placeholder="&nbsp; ex)2021-05-22" class="text_box" id="sj_start" name="sj_start">
                                </td>
                            </tr>
                            <tr>
                                <td class="subject_add_td1">
                                    수강종료일:
                                </td>
                                <td class="subject_add_td2">
                                    <input type="text"placeholder="&nbsp; ex)2021-05-24" class="text_box" id="sj_end" name="sj_end">
                                </td>
                                
                            </tr>
                            <tr>
                                <td colspan="2" class="subject_add_btn_td1">
                                    <input type="button" value="과목생성" class="system_btn" onclick="javascript:CheckSubject();">
                                </td>
                            </tr>
                            <tr>
                                <td class="subject_add_td1">
                                    수강과목:
                                </td>
                                <td class="subject_add_td2">
                                    <select class="subject_add_select" id="op" name="op">
                                    	<option>과목을 선택해주세요.</option>
                                    	<%
                                    		if(subject != null)
                                    		{
	                                    		for(int i = 0; i<subject.box_add().size(); i++ )
	                                    		{	
                                    	%>
                                        		<option value="<%=subject.box_add().get(i).getSubject() %>">&nbsp;<%=subject.box_add().get(i).getSubject() %></option>
                                    	<%		}
                                    		}
                                        %>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" class="subject_add_btn_td2">
                                    <input type="submit" value="과목추가"  class="system_btn" formaction="/StudentSubjectAdd.do">
                                    <input type="submit" value="과목삭제"  class="system_btn" formaction="/StudentSubjectDelete.do" onclick="return confirm('정말 삭제 하시겠습니까?');">
                                </td> 
                            </tr>
                            
                        </table>
                    </td>
                </tr>
            </table>
            </form>
        </td>
    </tr>
    <tr>
        <td valign="top" style="height:1100px">
            <table border="0" class="userlist_table">
                <tr>
                    <td class="contetns_title_td1">
                        <div class="div1"> </div>
                        <div class="div2"> </div> 
                        <td  class="contetns_title">
                            학생 출결 현황
                        </td>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                    	<form id="search" name="search" method="post" action="AdminMain.do">
	                        <table border="0" class="userlist_search">
	                            <tr>
	                                <td>과목명:</td>
	                                <td>
	                                    <select class="subject_add_select" id="op" name="op">
                                    	<option>&nbsp;과목을 선택해주세요.</option>
                                    	<%
                                    		if(subject != null)
                                    		{
	                                    		for(int i = 0; i<subject.box_add().size(); i++ )
	                                    		{	
                                    	%>
                                        		<option value="<%=subject.box_add().get(i).getSubject() %>">&nbsp;<%=subject.box_add().get(i).getSubject() %></option>
                                    	<%		}
                                    		}
                                        %>
                                    </select>    
	                                </td>
	                                <td>날짜:</td>
	                                <td>
	                                    <input type="text"placeholder="&nbsp;Ex)20110524" class="text_box" id="list_date" name="list_date"> 
	                                </td>
	                                <td>학생명:</td>
	                                <td>
	                                    <input type="text"placeholder="&nbsp;학생명을 입력하세요." class="text_box" id="list_name" name="list_name"> 
	                                </td>
	                                <td>
	                                    <input type="submit" value="&nbsp;검색" class="system_btn" > 
	                                </td>
	                            </tr>
	                        </table>
                        </form>
                    </td>
                </tr>
                <tr valign="top">
                    <td colspan="2">
                        <table border="0" class="userlist" >
                            <tr class="list_tr0">
                                <td class="list_title_td1">학생명</td>
                                <td class="list_title_td2">수강과목</td>
                                <td class="list_title_td3">입실시간</td>
                                <td class="list_title_td3">퇴실시간</td>
                                <td class="list_title_td4">출석여부</td>
                            </tr>
                            
                            <%
	                            int flag2 = 2;
	                       		int hihi2 = 0;
                       		
                            	for(int i=0; i<in_search.size(); i++)
                            	{	
                            		if((flag2 % 2) == 0)
                       		 		{
                       		 			hihi2 = 2;
                       		 		}
                       		 		else if((flag2 % 2) == 1)
                       		 		{
                       		 			hihi2 = 1;
                       		 		}
                            %>
	                            <tr class="list_tr<%=hihi2%>">
	                            
	                            	<%-- <!-- 
	                                <td class="list_td1"><a href="/AdminMain.do?userid=<%=admin.admin_student_list().get(i).getUserid() %>
	                                &subject=<%=admin.admin_student_list().get(i).getSubject() %>" onclick="javascript:document.frm.submit();"><%=admin.admin_student_list().get(i).getUsername() %></a></td>
	                                --> --%>
	                                <td class="list_td1"><a href="javascript:ViewStudent('type=viewstudent&userid=<%=in_search.get(i).getUserid() %>&subject=
	                                <%=in_search.get(i).getSubject() %>');"><%=in_search.get(i).getUsername() %></a></td>
	                                <td class="list_td1"><%=in_search.get(i).getSubject() %></td>
	                                <td class="list_td1"><%if(in_search.get(i).getIn_time()==null){out.print("");}else{out.print(in_search.get(i).getIn_time());} %>
	                                </td>
	                                <td class="list_td1"><%if(in_search.get(i).getOut_time()==null){out.print("");}else{out.print(in_search.get(i).getOut_time());} %>
	                                </td>
	                                <td class="list_td1"><%if(in_search.get(i).getIn_check()==null){out.print("");}
	                                else if(in_search.get(i).getIn_check()!=null && in_search.get(i).getOut_check()==null){out.print(in_search.get(i).getIn_check());}
	                                else{out.print(in_search.get(i).getOut_check());}
	                                %>
	                            </tr>
                           <%		flag2 = flag2 + 1;
                            	}
                           %>
                        </table>
                    </td>
                </tr>
                <%
                	int curpage = 1;
                	try
                	{
                		String cur = request.getParameter("curpage");
                		curpage = Integer.parseInt(cur);
                	}catch(Exception e)
                	{
                		
                	}
                	
                	int maxpage = paging.page_count(name, date, sub)/20;
                	
                	int startpageno = (curpage / 6) * 5 + 1;
                	int endpageno = startpageno + 4;
                %>
                <tr>
               	
                    <td colspan="2" class="list_td1" >
                    <div class="admin_page">	
                         <a href="/AdminMain.do?curpage=1">◀◀</a>
                         <a href="/AdminMain.do?curpage=<%
                         if(curpage<2){out.print(1);}
                         else{out.print(curpage-1);}%>&op=<%
                        		 if(sub == null){out.print("");}
                        		 else{out.print(sub);}%>&list_date=<%
                        				 if(date==null){out.print("");}
                        				 else{out.print(date);}%>&list_name=<%
                        						 if(name==null){out.print("");}
                        						 else{out.print(name);}%>">◀</a>
                        <%
                        	
                        	if(paging.page_count(name, date, sub)%20 != 0)
                        	{
                        		maxpage+=1;
                        	}
                        	
                        	if(endpageno >= maxpage)
                        	{
                        		endpageno = maxpage;
                        	}
                        
                        	for(int i = startpageno; i<=endpageno; i++)
                        	{
                        %>
                        		<a href="/AdminMain.do?curpage=<%=i%>&op=<%
                        		if(sub==null){out.print("");}
                        		else{out.print(sub);}%>&list_date=<%
                        				if(date==null){out.print("");}
                        				else{out.print(date);}%>&list_name=<%
                        						if(name==null){out.print("");}
                        						else{out.print(name);}%>"><% if(curpage == i){out.print("<b>");}%><%=i%><% if(curpage == i){out.print("</b> ");}%></a>
                        <%	}
                        %>
                        <a href="/AdminMain.do?curpage=<%
                        if(curpage>=maxpage){out.print(maxpage);}
                        else{out.print(curpage+1);}%>&op=<%
                        		if(sub==null){out.print("");}
                        		else{out.print(sub);}%>&list_date=<%
                        				if(date==null){out.print("");}
                        				else{out.print(date);}%>&list_name=<%
                        						if(name==null){out.print("");}
                        						else{out.print(name);}%>">▶</a>
                        <a href="/AdminMain.do?curpage=<%=maxpage%>">▶▶</a>
                    </div>
                    </td>
                </tr>
            </table>
        </td>
        <td valign="top">
            <table border="0" class="userinfo_table">
                <tr>
                    <td class="contetns_title_td1">
                        <div class="div1"> </div>
                        <div class="div2"> </div> 
                        <td  class="contetns_title">
                            학생 정보
                        </td>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" id="dataStudent" name="dataStudent">
                    	<table border="0" class="userinfo">
                    		<tr>
                    			<td height="400px"  class="userinfo_td">학생을 선택하세요.</td>
                    		</tr>
                    	</table>
                    		
                    	
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<script>
function go_del(obj)
{
	if(confirm("탈퇴 시키겠습니까?"))
	{
		$.ajax({
			    url:"/NewStudentDel.do", //request 보낼 서버의 경로
			    type:'post', // 메소드(get, post, put 등)
			    data:obj, //보낼 데이터
			    success: function(data) 
			    {
			    	window.location.reload();
			    }
			});
	}
}
</script>
<%@ include file="/include/tail.jsp" %>