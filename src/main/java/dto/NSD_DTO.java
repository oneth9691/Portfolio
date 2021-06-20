package dto;

import dbms.DBManager;

public class NSD_DTO extends DBManager
{
	public void Nsd(String no)
	{
		this.DBOpen();
		
		String sql = "delete from userinfo where info_no = '" + no + "'";
		this.Execute(sql);
		
		this.DBClose();
	}
}
