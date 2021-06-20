<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/include/header.jsp" %>

<table border="0" class="body3">
<%
	StudentInfoVO student = (StudentInfoVO)session.getAttribute("student"); 
	Date time = new Date();
	String today = null;
	
	
	String strFormat = "yyyy-MM-dd";    //strStartDate 와 strEndDate 의 format
	
	//SimpleDateFormat 을 이용하여 startDate와 endDate의 Date 객체를 생성한다.
	SimpleDateFormat sdf = new SimpleDateFormat(strFormat);
	long diffDay = 0; long diffDay2 = 0; long a = 0;
	try
	{
		String strStartDate = student.getStart_day();
		String strEndDate = student.getEnd_day();
		
	    Date startDate = sdf.parse(strStartDate);
	    Date endDate = sdf.parse(strEndDate);
	    today = sdf.format(time);
	    Date Dtoday = sdf.parse(today);
	    
	    
	    System.out.print(today);
	
	    //두날짜 사이의 시간 차이(ms)를 하루 동안의 ms(24시*60분*60초*1000밀리초) 로 나눈다.
	    diffDay =  Math.abs((startDate.getTime() - endDate.getTime())) / (24*60*60*1000);
	    diffDay2 = Math.abs((Dtoday.getTime() - endDate.getTime())) / (24*60*60*1000);
	    a =  Math.round((((((double)diffDay - (double)diffDay2)/(double)diffDay) * 100)));
	}
	catch(Exception e)
	{
	    e.printStackTrace();
	}
	
	

%>

	<tr>
	    <td valign="top">
	        <table border="0" class="userpage_info_table">
	            <tr>
	                <td class="contetns_title_td1">
	                    <div class="div1"></div>
	                    <div class="div2"></div>
	                </td>
	                <td class="contetns_title">
	                    수강 진행률
	                </td>
	            </tr>
	            <tr>
	                <td colspan="2">
	                    <table border="0" class="userpage_info">
	                        <tr>              
	                            <td class="userpage_info_td">
	                            <h4>
	                            	<%
	                            		if(ud == true)
	                            		{
	                            	%>
	                                <text class="infotext1"><center>수강과목: <%try{out.print(student.getSubject());}catch(Exception e){} %></center></text>
	                                <br>
	                                <text class="infotext2"><center>수강기간: 
	                                <%try{out.print(student.getStart_day() +  "&nbsp&nbsp~&nbsp&nbsp" + student.getEnd_day() );}
	                                catch(Exception e){}%></center></text>
	                                <br>
	                                <text class="infotext3"><center>총 일수: <%if(diffDay != 0){out.print(diffDay);} %>일</center></text>
	                                <br>
	                                <text class="infotext3"><center>남은 일수: <%if(diffDay2 !=0){out.print(diffDay2);} %>일</center></text>
	                            </h4> 
	                            	<%
	                            		}
	                            	%>
	                            </td>
	                        </tr>
	                        <tr>
	                            <td>
                          			<div class="zt-span6 last">
									<h3><strong>진행율</strong></h3>
									<div class="zt-skill-bar"><div data-width="<%=a %>" style="">
									<%try{out.print(student.getSubject());}catch(Exception e){} %><span><%=a%>%</span></div></div>
	                            </td>
	                        </tr>
	                    </table>    
	                </td>
	            </tr>
			</table>
		</td>
        <td valign="top">
            <table border="0" class="userpage_list_table">
                <tr>
                    <td class="contetns_title_td1">
                        <div class="div1"></div>
                        <div class="div2"></div>
                    </td>
                    <td class="contetns_title">
                        출석관리
                    </td>
                    <td class="userpage_list_table_btn">
                        <button id="on_modal" onclick='javascript:go_cal("type=on");' style="cursor:pointer;">&nbsp;달력보기</button>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <div style="overflow:scroll; width:790px; height:470px;">
                        
		                <table border="0" class="userpage_list" >
		                    <tr class="list_tr0">
		                        <td class="userpage_tilte_td1">이름</td>
		                        <td class="userpage_tilte_td2">수강과목</td>
		                        <td class="userpage_tilte_td3">입실시간</td>
		                        <td class="userpage_tilte_td4">퇴실시간</td>
		                        <td class="userpage_tilte_td5">출석여부</td>
		                    </tr>
		                    <%
			                    int flag = 2;
	                       		int hihi = 0;
                       		
                        		ArrayList<Student_InOut_VO> main = (ArrayList<Student_InOut_VO>)request.getAttribute("main");
                        		if(main != null)
                        		{
                        		for(int i = 0; i<main.size(); i++)
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
		                        <td class="userpage_list_td1"><%=main.get(i).getUsername() %></td>
		                        <td class="userpage_list_td1"><%=main.get(i).getSubject() %></td>
		                        <td class="userpage_list_td1"><%=main.get(i).getIn_time() %>
		                        </td>
		                        <td class="userpage_list_td1"><%if(main.get(i).getOut_time()==null){out.print("");}else{out.print(main.get(i).getOut_time());} %>
		                        </td>
		                        <td class="userpage_list_td1"><%if(main.get(i).getIn_check()==null){out.print("");}
	                                else if(main.get(i).getIn_check()!=null && main.get(i).getOut_check()==null){out.print(main.get(i).getIn_check());}
	                                else{out.print(main.get(i).getOut_check());}
	                                %></td>
		                        
		                    </tr>
		                    <%
		                    		flag = flag + 1;
                        			}	
                        		}
		                    %>
		                </table>
            			<div>
        			</td>
        		</tr>
    		</table>
		</td>
	</tr> 
</table>
<div id="modal_table" >
	<table border="contetns_title_table" style="width: 100%">
        <tr>
            <td class="contetns_title_td1">
                <div class="div1"></div>
                <div class="div2"></div>
            </td>
            <td class="contetns_title">
                달력보기
            </td>
            <td>
            
            </td>
            <td class="userpage_list_table_btn">
                <button id="off_modal" style="cursor:pointer;">&nbsp;X</button>
            </td>
        </tr>
        <tr>
            <td colspan="3" id="dddhhh">
            
            </td>
        </tr>
    </table>
</div>

<script>
(function( $ ) {
    "use strict";
    $(function() {
        function animated_contents() {
            $(".zt-skill-bar > div ").each(function (i) {
                var $this  = $(this),
                    skills = $this.data('width');

                $this.css({'width' : skills + '%'});

            });
        }
        
        if(jQuery().appear) {
            $('.zt-skill-bar').appear().on('appear', function() {
                animated_contents();
            });
        } else {
            animated_contents();
        }
    });
}(jQuery));
</script>
<input type="hidden" name="cal" id="cal">
<script>
   
    document.getElementById('off_modal').onclick = function()
    {
        document.getElementById('modal_table').style.display="none";
    }
    
    function go_cal(obj)
    {
    	document.getElementById('modal_table').style.display="block";
    	$.ajax({
 		    url:"/Calander.do", //request 보낼 서버의 경로
 		    type:'post', // 메소드(get, post, put 등)
 		    data:obj, //보낼 데이터
 		    success: function(data) 
 		    {
 		    	$("#dddhhh").html(data);
 		    }
 		});
    }
</script>

<%@include file="/include/tail.jsp" %>                              