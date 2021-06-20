package dto;

import java.util.ArrayList;

import dbms.DBManager;
import vo.NoticeVO;


public class NoticeDTO  extends DBManager
{   
	private int total; // 검색결과 게시글 총 수
	private String no; //게시글 번호
	
	//게시물 전체 갯수 구하기
	public int getTotal(String search,String check1,String check2,int start,int percount)   
	{
		
		String sql = "select count(*) as total from notice";

		if(check1.equals("")&&check2.equals(""))
		{
			
		}
		else if(check1.equals("title")&&check2.equals("body"))
		{
			sql += " where title like '%"+ search +"%' or body like '%"+ search +"%' ";
			
		}else if(check1.equals("title"))
		{
			sql += " where title like '%"+ search + "%' ";
		}
		
		else
		{
			 sql += " where body like '%"+ search +"%' ";	
		}
		
		this.DBOpen();
		this.OpenQuery(sql);
		this.Next();
		total=this.GetInt("total");
		System.out.println("총 게시글 수"+sql);
		this.CloseQuery();
		this.DBClose();
		return total;
	}
	
	
	
	public ArrayList<NoticeVO> notice_list(String search,String check1,String check2,int start,int percount) 
	{
		
		//게시글 목록 조회
		ArrayList<NoticeVO> list = new ArrayList<NoticeVO>();
		String sql = null;
		this.DBOpen();	
		System.out.println("서치"+search);
		System.out.println("체크박스"+check1);
		System.out.println("체크박스"+check2);
		
		if(check1.equals("title")&&check2.equals("body"))
		{
			sql = "select no,title,wdate,hit from notice where title like '%"+ search +"%' or body like '%"+ search +"%' ";
			
		}else if(check1.equals("title"))
		{
			 sql = "select no,title,wdate,hit from notice where title like '%"+ search + "%' ";
		
		}else if(check2.equals("body"))
		{
			sql = "select no,title,wdate,hit from notice where body like '%"+ search +"%' ";
		
		}else
		{
			sql = "select no,title,wdate,hit from notice ";			
		
		}
			sql += " order by no desc limit " + start + "," + percount +" ";
		System.out.println(sql);
		this.OpenQuery(sql);		
		while(this.Next()==true)
		{
			NoticeVO item = new NoticeVO();
			item.setNo(this.GetValue("no"));
			item.setTitle(this.GetValue("title"));
			item.setWdate(this.GetValue("wdate"));
			item.setHit(this.GetValue("hit"));
			list.add(item);
		}		
		this.CloseQuery();
		this.DBClose();
		return list;
	}
	
	
	
	
	
	public boolean Write(NoticeVO item)
	{
		this.DBOpen();
		String insertSql = "insert into notice (userid,title,body,hit,wdate,file) value ('admin','"+_R(item.getTitle())+"','"+_R(item.getBody())+"','0',now(),'"+_R(item.getFile())+"')";
		this.Execute(insertSql);
		System.out.println(insertSql);		
	    
		
		String selectSql = "select last_insert_id() as no ";
		this.OpenQuery(selectSql);
		if(this.Next() == true)
		{
			this.no = this.GetValue("no");
			System.out.println(this.no);	
		}
		this.CloseQuery();
		
		this.DBClose();
		return true;
	}
	
	public String getNo() 
	{
		return no;
	}
	
	public NoticeVO View(String no)
	{
		NoticeVO item = new NoticeVO();
		
		this.DBOpen();
		 String selectSql ="";
		   		selectSql = "select * from notice where no = '"+ no +"' ";
		System.out.println(selectSql);
		this.OpenQuery(selectSql);
		if(this.Next())
		{
			item.setNo(this.GetValue("no"));
			item.setTitle(this.GetValue("title"));
			item.setBody(this.GetValue("body"));
			item.setWdate(this.GetValue("wdate"));
			item.setHit(this.GetValue("hit"));
			item.setFile(this.GetValue("file"));
		}
			this.CloseQuery();
			this.DBClose();
			return item;
	}
	public boolean Delete(String no)
	{
		this.DBOpen();
		String Deletesql ="delete from notice where no = '"+ no +"' ";
		System.out.println(Deletesql);
		this.Execute(Deletesql);
		this.DBClose();
		return true;
	}
	public boolean Modify(NoticeVO Mitem)
	{
		this.DBOpen();
		String Updatesql = "update notice set title= '"+ _R(Mitem.getTitle()) +"', body='"+ _R(Mitem.getBody()) +"', file='" + _R(Mitem.getFile()) +"' where no = "+ _R(Mitem.getNo()) +" "; 
		       System.out.println("게시글수정문:"+Updatesql);
		this.Execute(Updatesql);
		this.DBClose();
		return true;
	}

	public NoticeVO  Modify_view(String no) 
	{
		NoticeVO item = new NoticeVO();
		this.DBOpen();
		 String selectSql ="";
		   		selectSql = "select * from notice where no = '"+ no +"' ";
		System.out.println(selectSql);
		this.OpenQuery(selectSql);
		if(this.Next())
		{
			item.setNo(this.GetValue("no"));
			item.setTitle(this.GetValue("title"));
			item.setBody(this.GetValue("body"));
			item.setFile(this.GetValue("file"));
			
		}
			this.CloseQuery();
			this.DBClose();
			return item;
	}

	public int totalNum()
	{
		String sql = "select  count(*) from notice";
		this.DBOpen();
		this.OpenQuery(sql);
		this.Next();
		
		int total_num = this.GetInt("count(*)");
		this.CloseQuery();
		this.DBOpen();
		return total_num;
		
	}
	
	public void HitUp(String no)
	{
		this.DBOpen();
		String Updatesql = "update notice set hit= ifnull(hit,0)+1 where no ='" +no +"' ";
		       System.out.println("게시글수정문:"+Updatesql);
		this.Execute(Updatesql);
		System.out.println("공지사항조회수sql:"+Updatesql);
		this.DBClose();
	}
}