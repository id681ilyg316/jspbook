package com.service;

import java.sql.ResultSet;

import com.dao.DB;
import com.entity.TBook;
import com.entity.TUser;

public class liuService
{
	public static TUser getUser(int id)
	{
		TUser user=new TUser();
		
		String sql="select * from t_user_pqy where id="+id;
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			rs.next();
			
			user.setId(rs.getInt("id"));
			user.setName(rs.getString("name"));
			user.setSex(rs.getString("sex"));
			user.setAge(rs.getString("age"));
			
			user.setAddress(rs.getString("address"));
			user.setTel(rs.getString("tel"));
			user.setEmail(rs.getString("email"));
			user.setJiehao(rs.getString("jiehao"));
			
			user.setDel(rs.getString("del"));
			
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		return user;
	}
	
	
	
	public static TBook getBook(int id)
	{
		TBook book=new TBook();
		
		String sql="select * from t_book_pqy where id="+id;
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			rs.next();
			
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
			
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		return book;
	}
}
