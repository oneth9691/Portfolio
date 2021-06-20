package dto;

import java.util.ArrayList;

import dbms.DBManager;
import vo.StudentInfoVO;
import vo.UserVO;

public class StudentInfoDTO extends DBManager
{
	public ArrayList<StudentInfoVO> student_info(UserVO user)
	{
		ArrayList<StudentInfoVO> list = new ArrayList<StudentInfoVO>();
		this.DBOpen();
		
		String sql = "select name,subject,email,pn from userinfo where userid = '" + user.getUserid() + "'";
		System.out.println(sql);
		
		this.OpenQuery(sql);
		
		this.Next();
		String name = this.GetValue("name");
		String subject = this.GetValue("subject");
		String email = this.GetValue("email");
		String pn = this.GetValue("pn");
		this.CloseQuery();	
		sql="";	
		sql = "select start_day,end_day from class where subject ='" + subject + "'";
		System.out.println(sql);
		this.OpenQuery(sql);
		this.Next();
		String start_day = this.GetValue("start_day");
		String end_day = this.GetValue("end_day");
		
		StudentInfoVO item = new StudentInfoVO();
		item.setUsername(name); item.setSubject(subject); item.setEmail(email); item.setPn(pn); item.setStart_day(start_day); item.setEnd_day(end_day);
		
		
		list.add(item);
		
		this.CloseQuery();
		
		this.DBClose();
		
		return list;
	}
	
	public StudentInfoVO student_data(UserVO user)
	{
		this.DBOpen();
		
		String sql = "select name,subject,email,pn from userinfo where userid = '" + user.getUserid() + "'";
		System.out.println(sql);
		
		this.OpenQuery(sql);
		
		this.Next();
		String name = this.GetValue("name");
		String subject = this.GetValue("subject");
		String email = this.GetValue("email");
		String pn = this.GetValue("pn");
		this.CloseQuery();	
		sql="";	
		sql = "select date(start_day),date(end_day) from class where subject ='" + subject + "'";
		System.out.println(sql);
		this.OpenQuery(sql);
		this.Next();
		String start_day = this.GetValue("date(start_day)");
		String end_day = this.GetValue("date(end_day)");
		
		StudentInfoVO item = new StudentInfoVO();
		item.setUsername(name); item.setSubject(subject); item.setEmail(email); item.setPn(pn); item.setStart_day(start_day); item.setEnd_day(end_day);
		
		
		
		this.CloseQuery();
		
		this.DBClose();
		
		return item;
	}
	
	public void withdrawal(UserVO user)
	{
		this.DBOpen();
		
		String sql = "update userinfo set yesno = 'yes' where userid ='" + user.getUserid() + "' and email ='" + user.getEmail() + "'";
		this.Execute(sql);
		System.out.println("탈퇴:" + sql);
		this.DBClose();
	}
	
}
