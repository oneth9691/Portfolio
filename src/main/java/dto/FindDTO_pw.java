package dto;

import dbms.DBManager;
import vo.UserVO;

public class FindDTO_pw extends DBManager
{
	public boolean find_pw(UserVO user)
	{
		this.DBOpen();
		
		String sql = "select * from userinfo where userid = '" + user.getUserid() + "' and email = '" + user.getEmail() + "'";
		this.OpenQuery(sql);
		
		if(this.Next())
		{
			this.CloseQuery();
			this.DBClose();
			return true;
		}
		else
		{
			this.CloseQuery();
			this.DBClose();
			return false;
		}
	}
}
