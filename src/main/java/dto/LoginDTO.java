package dto;

import dbms.DBManager;
import vo.UserVO;

public class LoginDTO extends DBManager
{
	public UserVO login(String id, String pw)
	{
		UserVO user = new UserVO();
		this.DBOpen();
		
		String sql = "select userid,name,email,pn,subject,info_no from userinfo where userid = '" + id + "' and userpw = '" + pw +"' and yesno = 'no'";
		System.out.println(sql);
		
		this.OpenQuery(sql);
		
		if(this.Next())
		{
			user.setUserid(this.GetValue("userid"));
			user.setUsername(this.GetValue("name"));
			user.setEmail(this.GetValue("email"));
			user.setPn(this.GetValue("pn"));
			user.setSubject(this.GetValue("subject"));
			user.setInfo_no(this.GetValue("info_no"));
			this.CloseQuery();
			this.DBClose();
			return user;
		}
		else
		{
			System.out.println("가입하지 않은 아이디이거나, 잘못된 비밀번호입니다. ");
			this.CloseQuery();
			this.DBClose();
			return null;
		}
			

	}
}
