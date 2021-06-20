package dto;

import java.util.ArrayList;

import dbms.DBManager;
import vo.UserVO;

public class CalendarDTO extends DBManager
{
	public String calendar(String userid,int year,int month,int day)
	{
		this.DBOpen();
		
		String sql = "select out_check from in_out where year(out_time) = '" + year +"' "
				+ "and month(out_time) = '" + (month + 1) + "' and day(out_time) ='" + day + "' and userid = '" + userid + "'";
		this.OpenQuery(sql);
		System.out.println(sql);
		String out_check = null;
		while(this.Next())
		{
			out_check = this.GetValue("out_check");
			
		}
		this.CloseQuery();
		this.DBClose();
		return out_check;
	}
	
	
}
