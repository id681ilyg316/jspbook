package com.action;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.DB;
import com.entity.TAdmin;
import com.entity.TJieyue;
import com.entity.Tcatelog;
import com.service.liuService;

public class jieyue_servlet extends HttpServlet
{
	public void service(HttpServletRequest req,HttpServletResponse res)throws ServletException, IOException 
	{
        String type=req.getParameter("type");
		
		if(type.endsWith("jieyueMana"))
		{
			jieyueMana(req, res);
		}
		if(type.endsWith("jieyueAdd"))
		{
			jieyueAdd(req, res);
		}
		if(type.endsWith("jieyueDel"))
		{
			jieyueDel(req, res);
		}
		if(type.endsWith("jieyue_huanshu_pre"))
		{
			jieyue_huanshu_pre(req, res);
		}
		if(type.endsWith("jieyue_huanshu"))
		{
			jieyue_huanshu(req, res);
		}
	}
	
	
	public void jieyueAdd(HttpServletRequest req,HttpServletResponse res)
	{
		String user_id=req.getParameter("user_id");
		String book_id=req.getParameter("book_id");
		String jieyueshuliang=req.getParameter("jieyueshuliang");
		String jieyueShijian=req.getParameter("jieyueShijian");
		
		String shifouguihuan="否";
		String guihuanshijian="";
		String del="no";
		
		
		String sql="insert into t_jieyue_pqy(user_id,book_id,jieyueshuliang,jieyueShijian,shifouguihuan,guihuanshijian,del) values(?,?,?,?,?,?,?)";
		Object[] params={Integer.parseInt(user_id),
						 Integer.parseInt(book_id),
						 Integer.parseInt(jieyueshuliang),
						 jieyueShijian,
						 shifouguihuan,
						 guihuanshijian,
                         del};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "借阅成功！");
		req.setAttribute("path", "jieyue?type=jieyueMana");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}
	
	public void jieyueDel(HttpServletRequest req,HttpServletResponse res)
	{
		String sql="update t_jieyue_pqy set del='yes' where id="+Integer.parseInt(req.getParameter("id"));
		Object[] params={};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "借阅删除成功！");
		req.setAttribute("path", "jieyue?type=jieyueMana");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}

	public void jieyueMana(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
	
		String page1=req.getParameter("page");
		if(page1==null){
			page1="1";
		}
		//��ҳ����
		int EVERYPAGENUM=5;//ÿҳ����
		int page=Integer.parseInt(page1);   //���ݹ����ĵ�ǰҳ
		int cou = 1;//�õ���Ϣ����	
		int pagecount=1;  //��ҳ��
		String sql1="select count(*) as cou from t_jieyue_pqy";
		Object[] params1={};
		DB mydb1=new DB();
		try
		{
			mydb1.doPstm(sql1, params1);
			ResultSet rs=mydb1.getRs();
			while(rs.next())
			{
			cou= rs.getInt("cou");
			}
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb1.closed();
		
		
		
		if (cou % EVERYPAGENUM == 0) {
			pagecount= cou / EVERYPAGENUM;
        } else {
        	pagecount=cou / EVERYPAGENUM + 1;
        }	
		
		
		
		
		
		
		req.setAttribute("EVERYPAGENUM", EVERYPAGENUM);	
		req.setAttribute("page", page);
		req.setAttribute("cou", cou);
		req.setAttribute("pagecount", pagecount);		

		
		
		
		
		
		
	
	
	
		List jieyueList=new ArrayList();
		String sql="select * from t_jieyue_pqy where del='no'";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			 for (int i = 0; i < (page - 1) * EVERYPAGENUM; i++) {
	                rs.next();
	            }
	            for (int t = 0; t < EVERYPAGENUM; t++) {
			if(rs.next())
			{
				TJieyue jieyue=new TJieyue();
				
				jieyue.setId(rs.getInt("id"));
				jieyue.setUser_id(rs.getInt("user_id"));
				jieyue.setBook_id(rs.getInt("book_id"));
				jieyue.setJieyueshuliang(rs.getInt("jieyueshuliang"));
				
				jieyue.setJieyueshijian(rs.getString("jieyueshijian"));
				jieyue.setShifouguihuan(rs.getString("shifouguihuan"));
				jieyue.setGuihuanshijian(rs.getString("guihuanshijian"));
				jieyue.setDel(rs.getString("del"));
				
				jieyue.setUser(liuService.getUser(rs.getInt("user_id")));
				jieyue.setBook(liuService.getBook(rs.getInt("book_id")));
				
				
				jieyueList.add(jieyue);
		   		    }else {
	                    break; //���ٿ�ѭ����ʱ��
	                }
}

			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("jieyueList", jieyueList);
		req.getRequestDispatcher("admin/jieyue/jieyueMana.jsp").forward(req, res);
	}
	
	
	
	public void jieyue_huanshu_pre(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		List jieyueList=new ArrayList();
		String sql="select * from t_jieyue_pqy where del='no' and shifouguihuan='否'";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				TJieyue jieyue=new TJieyue();
				
				jieyue.setId(rs.getInt("id"));
				jieyue.setUser_id(rs.getInt("user_id"));
				jieyue.setBook_id(rs.getInt("book_id"));
				jieyue.setJieyueshuliang(rs.getInt("jieyueshuliang"));
				
				jieyue.setJieyueshijian(rs.getString("jieyueshijian"));
				jieyue.setShifouguihuan(rs.getString("shifouguihuan"));
				jieyue.setGuihuanshijian(rs.getString("guihuanshijian"));
				jieyue.setDel(rs.getString("del"));
				
				jieyue.setUser(liuService.getUser(rs.getInt("user_id")));
				jieyue.setBook(liuService.getBook(rs.getInt("book_id")));
				
				
				jieyueList.add(jieyue);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("jieyueList", jieyueList);
		req.getRequestDispatcher("admin/jieyue/jieyue_huanshu_pre.jsp").forward(req, res);
	}
	
	
	public void jieyue_huanshu(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		String sql="update t_jieyue_pqy set shifouguihuan='��',guihuanshijian=? where id="+Integer.parseInt(req.getParameter("id"));
		Object[] params={req.getParameter("guihuanshijian")};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("msg", "还书成功");
		req.getRequestDispatcher("common/msg.jsp").forward(req, res);
	}
	
	public void dispatch(String targetURI,HttpServletRequest request,HttpServletResponse response) 
	{
		RequestDispatcher dispatch = getServletContext().getRequestDispatcher(targetURI);
		try 
		{
		    dispatch.forward(request, response);
		    return;
		} 
		catch (ServletException e) 
		{
                    e.printStackTrace();
		} 
		catch (IOException e) 
		{
			
		    e.printStackTrace();
		}
	}
	public void init(ServletConfig config) throws ServletException 
	{
		super.init(config);
	}
	
	public void destroy() 
	{
		
	}
}
