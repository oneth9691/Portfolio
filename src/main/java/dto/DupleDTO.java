package dto;

import dbms.DBManager;

public class DupleDTO extends DBManager
{
	public boolean duple_check_id(String idtxt)
	{
		this.DBOpen();
		
		String sql = "select userid from userinfo where userid = '" + idtxt + "'";
		this.OpenQuery(sql);
		
		if(this.Next())
		{
			System.out.println("중복된 아이디가 존재합니다.");
			return false;
		}
		
		this.CloseQuery();
		
		this.DBClose();
		
		return true;
	}
	
	public boolean duple_check_email(String email)
	{
		this.DBOpen();
		
		String sql = "select email from userinfo where email = '" + email + "'";
		this.OpenQuery(sql);
		
		if(this.Next())
		{
			System.out.println("중복된 이메일이 존재합니다.");
			return false;
		}
		
		this.CloseQuery();
		
		this.DBClose();
		
		return true;
	}
	
	public boolean subject_check(String subject)
	{
		this.DBOpen();
		
		String sql = "select * from class where subject = '" + subject + "'";
		
		this.OpenQuery(sql);
		
		if(this.Next())
		{
			System.out.println("중복된 과목 존재");
			this.CloseQuery();
			this.DBClose();
			return true;
		}
		
		this.CloseQuery();
		this.DBClose();
		
		return false;
	}
	
	
	
}
