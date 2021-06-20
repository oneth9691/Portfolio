package dto;

import dbms.DBManager;
import vo.UserVO;

public class MyinfoDTO extends DBManager
{
	public boolean ModifyPn(String userid,String text_pn)
	{
		this.DBOpen();
		
		String sql ="update userinfo set pn = '"+ text_pn  + "' where userid = '" + userid + "' ";
		System.out.println("전화번호 수정:"+sql);
		this.Execute(sql);
		this.DBClose();
		
		return true;	
	}
	
	public boolean ModifyEmail(String userid,String text_email)
	{
		this.DBOpen();
		
		String sql ="update userinfo set email = '"+ text_email  + "' where userid = '" + userid + "' ";
		System.out.println("이메일 수정:"+ sql);
		this.Execute(sql);
		this.DBClose();
		
		return true;	
	}
	
	
	public boolean ModifyPw(String userid,String text_pw)
	{
		this.DBOpen();
		
		String sql ="update userinfo set userpw = '"+ text_pw  + "' where userid = '" + userid + "' ";
		System.out.println("비밀번호 수정:"+ sql);
		this.Execute(sql);
		this.DBClose();
		
		return true;	
	}
	
	public boolean userDelete(String userid)
	{
		this.DBOpen();
		
		String sql ="update userinfo set yesno =  'yes'  where userid = '" + userid + "' ";
		System.out.println("회원탈퇴:"+sql);
		this.Execute(sql);
		this.DBClose();
		
		return true;	
	}

	public boolean Email_check(String email_text) 
	{
		this.DBOpen();
		String sql ="select * from userinfo where email = '"+ email_text +"' ";
		System.out.println("이메일 중복체크:"+ sql);
		this.OpenQuery(sql);
		if(this.Next())
		{
			this.CloseQuery();
			this.DBClose();
			return true;	
		
		}else
		{
			this.CloseQuery();
			this.DBClose();
			return false;	
		}		
	}
	public UserVO update(String userid)
	{
		UserVO user = new UserVO();
		this.DBOpen();
		String sql ="select * from userinfo where userid = '"+ userid +"' ";
		System.out.println("회원정보 수정후 최신화:"+sql);
		this.OpenQuery(sql);	
		this.Next();
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
}





