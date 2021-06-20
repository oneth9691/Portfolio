package dto;

import java.util.Calendar;

import dbms.DBManager;
import vo.UserVO;

public class InOutCheckDTO extends DBManager
{
	Calendar calendar = Calendar.getInstance();
	
	int hour = calendar.get(Calendar.HOUR_OF_DAY);
	int minute = calendar.get(Calendar.MINUTE);
	
	public String in_check(UserVO user)
	{
		this.DBOpen();
		
		String search_sql = "select * from in_out where date(in_time) = date(now()) and userid='" + user.getUserid() + "'";
		
		this.OpenQuery(search_sql);
		
		if(this.Next() == false)
		{
			this.CloseQuery();
			this.DBClose();
			return "0";
		}
		else
		{
			this.CloseQuery();
			this.DBClose();
			return "1";
		}
		
	}
	
	public String out_check(UserVO user)
	{
		this.DBOpen();
		
		String search_sql = "select out_check from in_out where date(out_time) = date(now()) and userid='" + user.getUserid() + "'";
		
		this.OpenQuery(search_sql);
		
		if(this.Next() == false)
		{
			this.CloseQuery();
			this.DBClose();
			return "2";
		}
		else if(this.Next())
		{
			this.CloseQuery();
			this.DBClose();
			System.out.println("3이발동됨");
			
		}
			return "3";
	}
	
	public void input(UserVO user)
	{
		this.DBOpen();
		if((hour == 9 && minute <= 10) || hour == 8 && minute >= 30)
		{
			String sql = "insert into in_out(userid,username,in_time,in_check,info_no,subject) "
					+ "values('" + user.getUserid() + "','" + user.getUsername() + "',now(),'출석','" + user.getInfo_no() +"','" + user.getSubject() + "')";
			System.out.println(sql);
			this.Execute(sql);	
			
			
		}
		
		else if((hour == 9 && minute >10) || hour < 12 && minute <= 59)
		{
			String sql = "insert into in_out(userid,username,in_time,in_check,info_no,subject) "
					+ "values('" + user.getUserid() + "','" + user.getUsername() + "',now(),'지각','" + user.getInfo_no() +"','" + user.getSubject() + "')";
			System.out.println(sql);
			this.Execute(sql);	
			
			
		}
		else if(hour >= 12 )
		{
			String sql = "insert into in_out(userid,username,in_time,in_check,info_no,subject) "
					+ "values('" + user.getUserid() + "','" + user.getUsername() + "',now(),'결석','" + user.getInfo_no() +"','" + user.getSubject() + "')";
			System.out.println(sql);
			this.Execute(sql);	
			
		}
	
		this.DBClose();
		
	}
	
	public void output(UserVO user)
	{
		this.DBOpen();
		
		String sql = "select in_check from in_out where userid = '" + user.getUserid() + "'";
		this.OpenQuery(sql);
		String in_check = null;
		
		if(this.Next())
		{
			in_check = this.GetValue("in_check");
		}
		sql="";
		
		if((in_check.equals("출석"))&&(hour == 17 && minute >=50)&&(hour <= 19))
		{
			sql = "update in_out set out_time = now(),out_check = '출석' where userid = '" + user.getUserid() +"' and date(in_time) = date(now())";
			System.out.println("퇴실여부:" + sql);
			this.Execute(sql);
		}
		else if(in_check.equals("출석")&&hour<=17 && minute < 50)
		{
			sql = "update in_out set out_time = now(),out_check = '조퇴' where userid = '" + user.getUserid() +"'and date(in_time) = date(now())";
			System.out.println("퇴실여부:" + sql);
			this.Execute(sql);
		}
		
		else if((in_check.equals("지각"))&&(hour == 17 && minute >=50)&&(hour <= 19))
		{
			sql = "update in_out set out_time = now(),out_check = '지각' where userid = '" + user.getUserid() +"'and date(in_time) = date(now())";
			System.out.println("퇴실여부:" + sql);
			this.Execute(sql);
		}
		
		else if((in_check.equals("지각")&&hour<=17 && minute < 50))
		{
			sql = "update in_out set out_time = now(),out_check = '지각+조퇴' where userid = '" + user.getUserid() +"'and date(in_time) = date(now())";
			System.out.println("퇴실여부:" + sql);
			this.Execute(sql);
		}
		else
		{
			sql = "update in_out set out_time = now(),out_check = '결석' where userid = '" + user.getUserid() +"'and date(in_time) = date(now())";
			System.out.println("퇴실여부:" + sql);
			this.Execute(sql);
		}
		
		this.CloseQuery();
		
		this.DBClose();
	}
	
}
