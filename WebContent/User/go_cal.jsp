<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="dto.*" %>
<%@page import="vo.*" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.*" %> 

<style>
.calcal a{ color: black; }
.calcal a:link { color: black; }
.calcal a:visited { color: black; }
.body2_td1 a{color: white; font-size: 25px;}
</style>

<% 
	UserVO user = (UserVO)session.getAttribute("user");
  java.util.Calendar cal=java.util.Calendar.getInstance(); //Calendar객체 cal생성
  int currentYear=cal.get(java.util.Calendar.YEAR); //현재 날짜 기억
  int currentMonth=cal.get(java.util.Calendar.MONTH);
  int currentDate=cal.get(java.util.Calendar.DATE);
  String Year=request.getParameter("year"); //나타내고자 하는 날짜
  String Month=request.getParameter("month");
  int year, month;
  if(Year == null && Month == null){ //처음 호출했을 때
  year=currentYear;
  month=currentMonth;
  }
  else { //나타내고자 하는 날짜를 숫자로 변환
   year=Integer.parseInt(Year);
   month=Integer.parseInt(Month);
   if(month<0) { month=11; year=year-1; } //1월부터 12월까지 범위 지정.
   if(month>11) { month=0; year=year+1; }
  }
  
  /* String years = request.getParameter("year");
  String months = request.getParameter("month");
  
  year = Integer.parseInt(years);
  month = Integer.parseInt(months); 
  
  System.out.print("꺄아아아아ㅏ앙 :" + year + month); */
  
  CalendarDTO cal2 = new CalendarDTO();
  %>
  
<center>
  <table border=0> <!-- 달력 상단 부분, 더 좋은 방법이 없을까? -->
   <tr>
    <td align=left width=200 class="calcal"> <!-- 년 도-->
    <a href="javascript:go_cal('year=<%=(year-1)%>&month=<%=(month)%>&type=on');" >◀</a>
    <% out.print(year); %>년
    <a href="javascript:go_cal('year=<%=(year+1)%>&month=<%=(month)%>&type=on');">▶</a>
    </td>
    <td align=center width=300 class="calcal"> <!-- 월 -->
    <a href="javascript:go_cal('year=<%=year%>&month=<%=(month-1)%>&type=on');">◀</a>
    <% out.print(month+1); %>월
    <a href="javascript:go_cal('year=<%=year%>&month=<%=(month+1)%>&type=on');">▶</a>
    </td>
    <td align=right width=200><% out.print(currentYear + "-" + (currentMonth+1) + "-" + currentDate); %></td>
   </tr>
  </table>
  <table border=1 cellspacing=0> <!-- 달력 부분 -->
   <tr>
    <td width=100>일</td> <!-- 일=1 -->
    <td width=100>월</td> <!-- 월=2 -->
    <td width=100>화</td> <!-- 화=3 -->
    <td width=100>수</td> <!-- 수=4 -->
    <td width=100>목</td> <!-- 목=5 -->
    <td width=100>금</td> <!-- 금=6 -->
    <td width=100>토</td> <!-- 토=7 -->
   </tr>
   <tr height=30>
   
   <%
   try
   {
	   cal.set(year, month, 1); //현재 날짜를 현재 월의 1일로 설정
	   int startDay=cal.get(java.util.Calendar.DAY_OF_WEEK); //현재날짜(1일)의 요일
	   int end=cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH); //이 달의 끝나는 날
	   int br=0; //7일마다 줄 바꾸기
	   for(int i=0; i<(startDay-1); i++) { //빈칸출력
	    out.println("<td>&nbsp;</td>");
	    br++;
	    if((br%7)==0) {
	     out.println("<br>");
	    }
	   }
	   for(int i=1; i<=end; i++)
	   { //날짜출력
			
		   	if(cal2.calendar(user.getUserid(), year, month, i) != null && cal2.calendar(user.getUserid(), year, month, i).equals("결석"))
		   	{
		    	out.println("<td>" + i + "<h4><font color='red'>" + cal2.calendar(user.getUserid(), year, month, i) + "</font></h4></td>");
		    	br++;
		   	}
		   	else if(cal2.calendar(user.getUserid(), year, month, i) != null && cal2.calendar(user.getUserid(), year, month, i).equals("지각"))
		   	{
		   		out.println("<td>" + i + "<h4><font color='blue'>" + cal2.calendar(user.getUserid(), year, month, i) + "</font></h4></td>");
		    	br++;
		   	}
	   		
		   	else if(cal2.calendar(user.getUserid(), year, month, i) != null && cal2.calendar(user.getUserid(), year, month, i).equals("조퇴"))
		   	{
		   		out.println("<td>" + i + "<h4><font color='purple'>" + cal2.calendar(user.getUserid(), year, month, i) + "</font></h4></td>");
		    	br++;
		   	}
	   
		   	else if(cal2.calendar(user.getUserid(), year, month, i) != null && cal2.calendar(user.getUserid(), year, month, i).equals("지각+조퇴"))
		   	{
		   		out.println("<td>" + i + "<h4><font color='brown'>"+ cal2.calendar(user.getUserid(), year, month, i) + "</font></h4></td>");
		    	br++;
		   	}
	   		
		   	else if(cal2.calendar(user.getUserid(), year, month, i) != null && cal2.calendar(user.getUserid(), year, month, i).equals("출석"))
		   	{
		   		out.println("<td>" + i + "<h4><font color='black'>" + cal2.calendar(user.getUserid(), year, month, i) + "</font></h4></td>");
		    	br++;
		   	}
	   		
		   	else
		   	{
		   		out.print("<td>" + i + "" + "</td>");
		   		br++;
		   	}
		    
	    
	    if((br%7)==0 && i!=end) 
	    {
	     	out.println("</tr><tr height=30>");
	    }
	   }
	   while((br++)%7!=0) //말일 이후 빈칸출력
	    out.println("<td>&nbsp;</td>");
   }catch(Exception e)
   {
	   
   }
   %>
   </tr>
   </table>
            	
            	</div>
            </td>
        </tr>
    </table>