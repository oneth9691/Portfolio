package dto;

import dbms.DBManager;
import vo.UserVO;

public class FindDTO_id extends DBManager
{
	public String Find_id(UserVO user)
	{	
		this.DBOpen();
		
		String sql = "select userid from userinfo where name = '" + user.getUsername() + "' and email = '" + user.getEmail() + "'";
		System.out.println(sql);
		this.OpenQuery(sql);
		
		if(this.Next())
		{
			String userid = this.GetValue("userid");
			this.CloseQuery();
			this.DBClose();
			return userid;
		}
		else
		{
			this.CloseQuery();
			this.DBClose();
			return null;
		}

		
	}
}
