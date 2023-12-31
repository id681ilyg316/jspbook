package com.service;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

import org.directwebremoting.WebContext;
import org.directwebremoting.WebContextFactory;


import com.dao.DB;
import com.entity.TAdmin;
import com.entity.TBook;
import com.entity.Tcatelog;

public class loginService
{
	public String login(String userName,String userPw,int userType)
	{
		System.out.println("userType"+userType);
		try
		{
			Thread.sleep(700);
		} catch (InterruptedException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String result="no";
		
		if(userType==0)//ϵͳ����Ա��½
		{
			String sql="select * from t_admin_pqy where userName=? and userPw=?";
			Object[] params={userName,userPw};
			DB mydb=new DB();
			mydb.doPstm(sql, params);
			try 
			{
				ResultSet rs=mydb.getRs();
				boolean mark=(rs==null||!rs.next()?false:true);
				if(mark==false)
				{
					 result="no";
				}
				else
				{
					 result="yes";
					 TAdmin admin=new TAdmin();
					 admin.setUserId(rs.getInt("userId"));
					 admin.setUserName(rs.getString("userName"));
					 admin.setUserPw(rs.getString("userPw"));
					 admin.setUserRole(rs.getString("userRole"));
					 WebContext ctx = WebContextFactory.get(); 
					 HttpSession session=ctx.getSession(); 
					 session.setAttribute("userType", rs.getString("userRole"));
		             session.setAttribute("admin", admin);
				}
				rs.close();
			} 
			catch (SQLException e)
			{
				System.out.println("登录失败！");
				e.printStackTrace();
			}
			finally
			{
				mydb.closed();
			}
			
		}
		
		
		
		return result;
	}

    public String adminPwEdit(String userPwNew)
    {
		System.out.println("DDDD");
    	try 
		{
			Thread.sleep(700);
		} 
		catch (InterruptedException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		WebContext ctx = WebContextFactory.get(); 
		HttpSession session=ctx.getSession(); 
		TAdmin admin=(TAdmin)session.getAttribute("admin");
		
		String sql="update t_admin_pqy set userPw=? where userId=?";
		Object[] params={userPwNew,admin.getUserId()};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		
		return "yes";
    }
    
    
    public List catelogAll()
    {
    	try
		{
			Thread.sleep(700);
		} catch (InterruptedException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	List catelogList=new ArrayList();
		String sql="select * from t_catelog_pqy where del='no'";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Tcatelog catelog=new Tcatelog();
				catelog.setId(rs.getInt("id"));
				catelog.setName(rs.getString("name"));
				catelog.setJieshao(rs.getString("jieshao"));
				catelogList.add(catelog);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		return catelogList;
    }
    
    public String getBookByCatelog(int catelog_id) throws ServletException, IOException
	{
		for(int i=0;i<20000;i++)
		{
			System.out.println(i);
		}
		
		
		WebContext wctx = WebContextFactory.get();
		wctx.getHttpServletRequest().setCharacterEncoding("UTF-8");
	    wctx.getHttpServletResponse().setCharacterEncoding("UTF-8");
	    wctx.getHttpServletResponse().setContentType("text/html;charset=UTF-8");
	    
	   
	    List bookList=new ArrayList();
		String sql="select * from t_book_pqy where del='no' and catelog_id=?";
		Object[] params={catelog_id};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				TBook book=new TBook();
				
				book.setId(rs.getInt("id"));
				book.setName(rs.getString("name"));
				book.setZuozhe(rs.getString("zuozhe"));
				book.setChubanshe(rs.getString("chubanshe"));
				
				book.setChubanriqi(rs.getString("chubanriqi"));
				book.setIsbm(rs.getString("isbm"));
				book.setPrice(rs.getString("price"));
				book.setYeshu(rs.getString("yeshu"));
				
				book.setKucun(rs.getString("kucun"));
				book.setCatelog_id(rs.getInt("catelog_id"));
				book.setDel(rs.getString("del"));
				
				bookList.add(book);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
	    
		
		wctx.getHttpServletRequest().setAttribute("bookList", bookList);
	    return wctx.forwardToString("/admin/book/bookByCatelog.jsp");
	}
	
}
