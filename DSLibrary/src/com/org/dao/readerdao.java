package com.org.dao;

import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;


import com.org.model.book;
import com.org.model.reader;

public class readerdao {
	org.hibernate.cfg.Configuration configuration=new org.hibernate.cfg.Configuration().configure();
	@SuppressWarnings("deprecation")
	SessionFactory sFactory=configuration.buildSessionFactory(); //����ʵ��
	public boolean insert(reader r){
		Session session=sFactory.openSession();    //�õ�һ��session����
		Transaction tx=null;
		System.out.print(r.getRnumber());
		try {
			tx=session.beginTransaction();
			session.save(r);
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
	public reader getreader(String rnumber)
	{
	Session session =sFactory.openSession();
	reader r =null;
	try {
		r=(reader)session.get(reader.class, rnumber);
		
	} catch (Exception e) {
		
		e.printStackTrace();
	}finally {session.close();}
	return r;
	}



	public boolean updatereader(reader r)
	{
		
		reader reader1=getreader(r.getRnumber());
		
		if(reader1==null)
			return false;
		
		Session session=sFactory.openSession();    //�õ�һ��session����
		Transaction tx=null;
		try {
			tx=session.beginTransaction();
			
			session.update(r);
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

	
	public List search(String type,String key)      //����sql����ѯ����
	{
		Session session=com.HibernateSessionFactory.getSession();
		Transaction tx=null;
		tx=session.beginTransaction();
		session.clear();
		if("ѧ��".equals(type)) type="rnumber";
		else if("����".equals(type)) type="rname";
		else if("ϵ��".equals(type)) type="dept";
		else if("�༶".equals(type)) type="rclass";
		
		String sqlString;
     if(key=="")  sqlString="select * from tb_reader";
		
		else  sqlString="select * from tb_reader where "+type+" = '"+key+"'";
			Query query =session.createSQLQuery(sqlString).addEntity(reader.class);
		java.util.List<book> resultSet=query.list();
		tx.commit();
		return resultSet;	
	}



	public boolean del(String rnum){
		Session session=sFactory.openSession();    //�õ�һ��session����
		Transaction tx=null;
		try {
			tx=session.beginTransaction();
			reader r=getreader(rnum);
			System.out.print(rnum);
			session.delete(r);
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

public List show()   //��ʾ���ж�������
{
	Session session=com.HibernateSessionFactory.getSession();
	String sqlString="select * from tb_reader";
	Transaction tx=session.beginTransaction();
	
	Query query =session.createSQLQuery(sqlString).addEntity(reader.class);
	java.util.List<reader> resultSet=query.list();
	Iterator<reader> iterator=resultSet.iterator();
	while (iterator.hasNext()) {
		reader aReader=iterator.next();
		}
	tx.commit();
	session.clear();
	return resultSet;
	
	
}


}
