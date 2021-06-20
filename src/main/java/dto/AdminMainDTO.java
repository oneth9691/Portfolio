package dto;

import java.util.ArrayList;

import dbms.DBManager;
import vo.Student_InOut_VO;
import vo.UserVO;

public class AdminMainDTO extends DBManager
{
	
	int start = 0; int percount = 0;
	
	public int getStart() {
		return start;
	}



	public void setStart(int start) {
		this.start = start;
	}



	public int getPercount() {
		return percount;
	}



	public void setPercount(int percount) {
		this.percount = percount;
	}



	public ArrayList<UserVO> new_student_list()
	{
		ArrayList<UserVO> list = new ArrayList<UserVO>();
		
		this.DBOpen();
		
		String sql = "select info_no,name,birth,pn,email from userinfo where subject = 'no' and yesno = 'no'";
		System.out.println(sql);
		this.OpenQuery(sql);
		
		while(this.Next())
		{
			UserVO user = new UserVO();
			user.setInfo_no(this.GetValue("info_no"));
			user.setUsername(this.GetValue("name"));
			user.setBirth(this.GetValue("birth"));
			user.setPn(this.GetValue("pn"));
			user.setEmail(this.GetValue("email"));
			
			
			list.add(user);
		}
		
		this.CloseQuery();
		this.DBClose();
		return list;		
	}
	
	
	
	public ArrayList<Student_InOut_VO> admin_student_list(String name,String date,String sub)
	{
		
		
		ArrayList<Student_InOut_VO> list = new ArrayList<Student_InOut_VO>();
		
		this.DBOpen();
		
		String sql = "select userid,username,in_check,out_check,in_time,out_time,info_no,subject from in_out ";
		if(name != null || date != null || sub != null)
		{
			sql+="where ";
			if(name != null && date != null && sub != null)
			{
				sql+="username like '%" + name +"%' and date(in_time) = '" + date + "' and subject = '" + sub +"'";
			}
			else if(name != null && date != null && sub == null)
			{
				sql+="username like '%" + name + "%' and date(in_time) = '" + date + "'";
			}
			else if(name != null && date == null && sub == null)
			{
				sql+="username like '%" + name +"%'";
			}
			else if(name == null && date != null && sub == null)
			{
				sql+="date(in_time) = '" + date + "'";
			}
			else if(name == null && date != null && sub != null)
			{
				sql+="date(in_time) = '" + date + "' and subject = '" + sub +"'";
			}
			else if(name == null && date == null && sub != null)
			{
				sql+="subject = '" + sub +"'";
			}
			else if(name != null && date == null && sub != null)
			{
				sql+="username = '" + name + "' and subject = '" + sub +"'";
			}
			
				
		}
		
		sql+=" order by in_time desc limit " + start + "," + percount +"";
		this.OpenQuery(sql);
		System.out.println(sql);
		while(this.Next())
		{
			Student_InOut_VO item = new Student_InOut_VO();
			item.setUsername(this.GetValue("username"));
			item.setSubject(this.GetValue("subject"));
			item.setIn_time(this.GetValue("in_time"));
			item.setOut_time(this.GetValue("out_time"));
			item.setOut_check(this.GetValue("out_check"));
			item.setUserid(this.GetValue("userid"));
			item.setIn_check(this.GetValue("in_check"));
			list.add(item);
		}
		
		this.CloseQuery();
		this.DBClose();
		return list;		
	}
	
	
	public static void main(String[] args)
	{
		AdminMainDTO dto = new AdminMainDTO();
		for(int i = 0; i < dto.new_student_list().size(); i++)
		{	
			System.out.println(dto.new_student_list().get(i).getEmail());
		}
		
		
		
	}
	
}
