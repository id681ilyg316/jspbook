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
import com.entity.TBook;
import com.entity.Tcatelog;

public class book_servlet extends HttpServlet
{
	public void service(HttpServletRequest req,HttpServletResponse res)throws ServletException, IOException 
	{
		String type=req.getParameter("type");

		if(type.endsWith("bookMana"))
		{
			bookMana(req, res);
		}
		if(type.endsWith("bookAdd"))
		{
			bookAdd(req, res);
		}
		if(type.endsWith("bookAddPre"))
		{
			bookAddPre(req, res);
		}
		if(type.endsWith("bookDel"))
		{
			bookDel(req, res);
		}
	}

	private void bookAddPre(HttpServletRequest req, HttpServletResponse res) {
 

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
		req.setAttribute("catelogList", catelogList);
		String targetURL = "/admin/book/bookAdd.jsp";
		dispatch(targetURL, req, res);

	}

	public void bookAdd(HttpServletRequest req,HttpServletResponse res)
	{
		String name=req.getParameter("name");
		String zuozhe=req.getParameter("zuozhe");
		String chubanshe=req.getParameter("chubanshe");
		String chubanriqi=req.getParameter("chubanriqi");

		String isbm=req.getParameter("isbm");
		String price=req.getParameter("price");
		String yeshu=req.getParameter("yeshu");
		String kucun=req.getParameter("kucun");
		String catelog_id=req.getParameter("catelog_id");



		String sql="insert into t_book_pqy(name,zuozhe,chubanshe,chubanriqi," + 
				"				         isbm,price,yeshu,kucun,\r\n" + 
				"				         catelog_id,del) values(?,?,?,?,?,?,?,?,?,?)";
		Object[] params={name,zuozhe,chubanshe,chubanriqi,
				isbm,price,yeshu,kucun,
				catelog_id,"no"};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();

		req.setAttribute("message", "图书添加成功");
		req.setAttribute("path", "book?type=bookMana");

		String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}


	public void bookMana(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
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
		String sql1="select count(*) as cou from t_book_pqy where del = 'no'";
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

		List bookList=new ArrayList();
		String sql="select * from t_book_pqy where del='no'";
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

		req.setAttribute("bookList", bookList);
		req.getRequestDispatcher("admin/book/bookMana.jsp").forward(req, res);
	}

	public void bookDel(HttpServletRequest req,HttpServletResponse res)
	{
		String sql="update t_book_pqy set del='yes' where id="+Integer.parseInt(req.getParameter("id"));
		Object[] params={};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();

		req.setAttribute("message", "图书删除成功");
		req.setAttribute("path", "book?type=bookMana");

		String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
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
