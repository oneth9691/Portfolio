package dto;

import dbms.DBManager;
import vo.UserVO;

public class FindDTO_pw2 extends DBManager
{
	public String pw_ok(UserVO user2)
	{
		this.DBOpen();
		
		String sql = "select userpw from userinfo where userid='" + user2.getUserid() + "' and email = '" + user2.getEmail() + "'";
		this.OpenQuery(sql);
		
		if(this.Next())
		{
			String userpw = this.GetValue("userpw");
			this.CloseQuery();
			this.DBClose();
			System.out.println("비번:" + userpw);
			return userpw;
		}
		else
		{
			this.CloseQuery();
			this.DBClose();	
			return null;
		}
		
		
	}
}
