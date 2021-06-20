package dto;

import dbms.DBManager;

public class PagingDTO extends DBManager
{
	public int page_count(String name,String date,String sub)
	{
		this.DBOpen();
		
		String sql = "select count(*) as count from in_out ";
		
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
			
				System.out.println(sql);
		}
		
		this.OpenQuery(sql);
		
		this.Next();
		int count = this.GetInt("count");
		
		this.CloseQuery();
		
		this.DBClose();
		
		return count;
	}
}
