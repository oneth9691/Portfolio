package dto;

import java.util.ArrayList;

import dbms.DBManager;
import vo.Student_SubjectVO;
import vo.subjectVO;

public class SubjectDTO extends DBManager
{
	//수강과목을 추가해주는 메소드---------------------------------------------------------------
	public boolean add(String sj_name,String sj_start,String sj_end)
	{
		this.DBOpen();
		
		String sql = "select * from class where subject = '" + sj_name + "'";
		this.OpenQuery(sql);
	
		sql="";
		sql = "insert into class (subject,start_day,end_day) values ('"+ sj_name+ "', '" + sj_start +"','" + sj_end +"')";
		System.out.println(sql);
		this.Execute(sql);
		this.DBClose();
		return true;	
		
	}
	
	//수강과목을 학생 한테 추가해주기 위한 select 박스 목록에 과목 채워주는 메소드-------------------------------
	public ArrayList<subjectVO> box_add()
	{
		ArrayList<subjectVO> list = new ArrayList<subjectVO>();
		this.DBOpen();
		
		String sql = "select subject from class";
		
		this.OpenQuery(sql);
		
		while(this.Next())
		{
			subjectVO item = new subjectVO();
			item.setSubject(this.GetValue("subject"));	
			list.add(item);
			
		}
		
		this.CloseQuery();
		this.DBClose();
		return list;
	}
	
	public void student_subject(Student_SubjectVO item)
	{
		this.DBOpen();
		
		
		
		for(int i = 0; i<item.getValue().length; i++)
		{
			String sql = "update userinfo set subject = '" + item.getSubject() + "' where info_no = '" + item.getValue()[i] + "'";
			this.Execute(sql);
			System.out.println(sql);
		}
		
		this.DBClose();
	}
	
	public void sub_delete(String sub)
	{
		this.DBOpen();
		
		String sql = "delete from class where subject = '" + sub +"'";
		this.Execute(sql);
		
		this.DBClose();
	}
	
}
