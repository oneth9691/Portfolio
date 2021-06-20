package dto;

import java.util.ArrayList;

import dbms.DBManager;
import vo.Student_InOut_VO;
import vo.UserVO;

public class UserMainDTO extends DBManager
{
	public ArrayList<Student_InOut_VO> student_student_list(UserVO user)
	{
		ArrayList<Student_InOut_VO> list = new ArrayList<Student_InOut_VO>();
		
		this.DBOpen();
		
		String sql = "select userid,username,in_check,out_check,in_time,"
				+ "out_time,info_no,subject from in_out where userid='" + user.getUserid() +"' order by in_time desc";
		this.OpenQuery(sql);
		
		while(this.Next())
		{
			Student_InOut_VO item = new Student_InOut_VO();
			item.setUsername(this.GetValue("username"));
			item.setSubject(this.GetValue("subject"));
			item.setIn_time(this.GetValue("in_time"));
			item.setOut_time(this.GetValue("out_time"));
			item.setOut_check(this.GetValue("out_check"));
			item.setIn_check(this.GetValue("in_check"));
			list.add(item);
		}
		
		
		this.CloseQuery();
		this.DBClose();
		return list;		
	}
}
