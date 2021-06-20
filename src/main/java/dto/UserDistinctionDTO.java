package dto;

import dbms.DBManager;
import vo.UserVO;

public class UserDistinctionDTO extends DBManager
{
	public boolean userdistinction(UserVO user)
	{
		this.DBOpen();
		String sql = "select subject from userinfo where userid='" + user.getUserid() + "'";
		
		this.OpenQuery(sql);
		
		if(this.Next())
		{
			String subject = this.GetValue("subject");
			
			if(subject.equals("no"))
			{
				return false;
			}
		}
		
		this.CloseQuery();
		
		this.DBClose();
		
		return true;
	}
}
