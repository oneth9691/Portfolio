package dto;

import dbms.DBManager;
import vo.UserVO;

public class JoinDTO extends DBManager
{
	public void insert_join(UserVO user)
	{
		this.DBOpen();
		
		String sql = "insert into userinfo"
				+ "(userid,userpw,email,name,birth,pn,yesno)"
				+ " values('" + user.getUserid() + "','" + user.getUserpw() + "','" + user.getEmail() + "','" + user.getUsername() 
				+ "','" + user.getBirth() + "','" + user.getPn() + "','no')";
		
		this.Execute(sql);
		
		this.DBClose();
	}
}
