package dbms;
import java.sql.*;

public class DBManager 
{
	public Connection mConnection;
	public ResultSet  mResult;
	
	public void DBOpen()
	{
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
	
			String mHost     = "jdbc:mysql://localhost:3306/bteam3?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC";
			String mUserId   = "root";
			String mPassword = "qqqq";
			mConnection = DriverManager.getConnection(mHost,mUserId,mPassword);
		}catch(Exception e)
		{
			e.printStackTrace();
		}	
	}
	
	public void DBOpen(String host,String id,String pw)
	{
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			mConnection = 
					DriverManager.getConnection(host,id,pw);
		}catch(Exception e)
		{
			e.printStackTrace();
		}	
	}	
	
	
	public void DBClose() 
	{
		try
		{
			mConnection.close();	
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}

	public void Execute(String sql)
	{
		try
		{
			Statement stmt = null;
			stmt = mConnection.createStatement();
			stmt.executeUpdate(sql);
			stmt.close();
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public boolean OpenQuery(String sql)
	{
		try
		{
			Statement stmt = mConnection.createStatement();
			mResult = stmt.executeQuery(sql);
			return true;
		}catch(Exception e)
		{
			return false;
		}
	}	
	
	public boolean Next()
	{
		try
		{
			return mResult.next();
		}catch(Exception e)
		{
			return false;
		}
	}
	
	public String GetValue(String name)
	{
		try
		{		
			return mResult.getString(name);
		}catch(Exception e)
		{
			return null;
		}
	}
	
	public int GetInt(String name)
	{
		try
		{		
			return mResult.getInt(name);
		}catch(Exception e)
		{
			return 0;
		}
	}	
	
	public void CloseQuery() 
	{
		try
		{		
			mResult.close();
		}catch(Exception e)
		{		
		}			
	}
	
	//���� ����ǥ�� '' �� ó��
	public String _R(String value)
	{
		if(value == null)
		{
			return null;
		}
		return value.replace("'","''");
	}	
	
	public static void main(String[] args) 
	{
	}
}
