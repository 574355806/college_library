package com.org.dao;

import java.io.Serializable;
import java.util.Iterator;
import java.util.List;


import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.org.model.book;
import com.org.model.borrowrecord;

public class borrowredao {
	org.hibernate.cfg.Configuration configuration=new org.hibernate.cfg.Configuration().configure();
	@SuppressWarnings("deprecation")
	SessionFactory sFactory=configuration.buildSessionFactory(); //����ʵ��
	public boolean insert(borrowrecord br){
		Session session=sFactory.openSession();    //�õ�һ��session����
		Transaction tx=null;
		try {		
			tx=session.beginTransaction();
			if(getborrowre(br)==null)
			 {session.save(br);
			tx.commit();
			return true;}
		} catch (Exception e) {
			if (tx!=null){tx.rollback();
			return false;}
			
			e.printStackTrace();
		}
		finally{session.close();
		}
		
		return false;
	}
	public borrowrecord getborrowre(borrowrecord br)
	{
	Session session =sFactory.openSession();
	Transaction tx=null;
			
	System.err.println(br.getClassnum());
	borrowrecord b1 =new borrowrecord();
/*String xString;
xString="select * from tb_borrowrecord where bid='"+br.getBid()+"' and rnumber='"+br.getRnumber()+"' ";
System.err.println(xString);*/
	try {
		/*Query query =session.createSQLQuery(xString).addEntity(borrowrecord.class);
		java.util.List<borrowrecord> resultSet=query.list();
		//java.util.List<borrowrecord> resultSet=session.createSQLQuery(xString).addEntity(borrowrecord.class).list();
		tx.commit();
		Iterator<borrowrecord> iterator=resultSet.iterator();
		if(iterator.hasNext())
		b1=(borrowrecord)iterator.next();
		System.err.println(b1.getBid());*/
		b1=(borrowrecord)session.get(borrowrecord.class, br);
		
		System.err.println(br.getClassnum());
		
	} catch (Exception e) {
		
		e.printStackTrace();
	}finally {session.close();}
	return b1;
	}


	public boolean del(borrowrecord br){
		Session session=sFactory.openSession();    //�õ�һ��session����
		Transaction tx=null;
		borrowrecord b=getborrowre(br);
		if (b==null) return false;
			try {
			tx=session.beginTransaction();
			
			
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


	public boolean updatebr(borrowrecord br)
	{
		Session session=sFactory.openSession();    //�õ�һ��session����
		Transaction tx=null;
		try {
			tx=session.beginTransaction();
				session.update(br);	
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

	public List show()      //����sql����ѯ����
	{
		Session session=com.HibernateSessionFactory.getSession();
		Transaction tx=null;
		tx=session.beginTransaction();
		String sqlString="select * from tb_borrowrecord";
		Query query =session.createSQLQuery(sqlString).addEntity(borrowrecord.class);
		java.util.List<borrowrecord> resultSet=query.list();
		tx.commit();
		session.clear();
		return resultSet;	
	}
	public List search(String type,String key)      //����sql����ѯ����
	{
		Session session=com.HibernateSessionFactory.getSession();
		Transaction tx=null;
		tx=session.beginTransaction();
		session.clear();
		if("����".equals(type)) type="bname";
		else if("ͼ����".equals(type)) type="bid";
		else if("���߱��".equals(type)) type="rnumber";
		else if("��������".equals(type)) type="rname";
		String sqlString="select * from tb_borrowrecord where "+type+" = '"+key+"'";
		if(key=="")sqlString="select * from tb_borrowrecord";
		
		Query query =session.createSQLQuery(sqlString).addEntity(borrowrecord.class);
		java.util.List<book> resultSet=query.list();
		tx.commit();
		return resultSet;	
	}
	/*public List searchneardate()      //����sql����ѯ����
	{
		Session session=com.HibernateSessionFactory.getSession();
		Transaction tx=null;
		tx=session.beginTransaction();
		session.clear();
		
		String sqlString="select * from tb_borrowrecord where DATEDIFF(d, borrowdate, returndate )<20 ";
		
		Query query =session.createSQLQuery(sqlString).addEntity(borrowrecord.class);
		java.util.List<book> resultSet=query.list();
		tx.commit();
		return resultSet;	
	}*/



}
