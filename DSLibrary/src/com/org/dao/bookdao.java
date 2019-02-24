package com.org.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.org.model.book;
import com.org.model.user;

public class bookdao {
	org.hibernate.cfg.Configuration configuration=new org.hibernate.cfg.Configuration().configure();
	@SuppressWarnings("deprecation")
	SessionFactory sFactory=configuration.buildSessionFactory(); //创建实例
	public boolean insert(book b){
		Session session=sFactory.openSession();    //得到一个session对象
		Transaction tx=null;
		try {
			tx=session.beginTransaction();
			session.save(b);
			tx.commit();
			return true;
		} catch (Exception e) {
			if (tx!=null){tx.rollback();
			return false;}
			
			e.printStackTrace();
		}
		finally{session.close();
		}
		
		return false;
	}
	public book getbook(String bid)
	{
	Session session =sFactory.openSession();
	book b =null;
	try {
		b=(book)session.get(book.class, bid);
		
	} catch (Exception e) {
		
		e.printStackTrace();
	}finally {session.close();}
	return b;
	}



	public boolean updatebook(book book1)
	{
		
		book b=getbook(book1.getBid());
		if(b==null)
			return false;
		Session session=sFactory.openSession();    //得到一个session对象
		Transaction tx=null;
		try {
			tx=session.beginTransaction();
			
			session.update(book1);
			tx.commit();
			return true;
		} catch (Exception e) {
			if (tx!=null){tx.rollback();
			return false;}
			
			e.printStackTrace();
		}
		finally{session.close();}
		return false;
		
	}

	public List show()      //利用sql语句查询所有
	{
			Session session=com.HibernateSessionFactory.getSession();
		Transaction tx=null;
		tx=session.beginTransaction();
		String sqlString="select * from tb_book";
		Query query =session.createSQLQuery(sqlString).addEntity(book.class);
		java.util.List<book> resultSet=query.list();
		tx.commit();
		session.clear();
		return resultSet;	
	}
	public List search(String type,String key)      //利用sql语句查询所有
	{
		Session session=com.HibernateSessionFactory.getSession();
		Transaction tx=null;
		 String sqlString;
		tx=session.beginTransaction();
		session.clear();
		if("书名".equals(type)) type="bname";
		else if("编号".equals(type)) type="bid";
		else if("作者".equals(type)) type="bwriter";
		else if("类型".equals(type)) type="btype";
		if(key=="")  sqlString="select * from tb_book";
		
		else  sqlString="select * from tb_book where "+type+" = '"+key+"'";
		Query query =session.createSQLQuery(sqlString).addEntity(book.class);
		java.util.List<book> resultSet=query.list();
		tx.commit();
		return resultSet;	
	}



	public boolean del(String bid){
		Session session=sFactory.openSession();    //得到一个session对象
		Transaction tx=null;
		try {
			tx=session.beginTransaction();
			book b=getbook(bid);
			System.out.print(bid);
			session.delete(b);
			tx.commit();
			session.clear();
			return true;
		} catch (Exception e) {
			if (tx!=null){tx.rollback();
			return false;}
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{session.close();}
		
		return false;
		
	}
}
