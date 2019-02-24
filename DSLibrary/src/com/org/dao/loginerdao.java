package com.org.dao;



import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;


import com.org.model.user;
public class loginerdao {
org.hibernate.cfg.Configuration configuration=new org.hibernate.cfg.Configuration().configure();
@SuppressWarnings("deprecation")
SessionFactory sFactory=configuration.buildSessionFactory(); //����ʵ��
public boolean insert(user u){
	Session session=sFactory.openSession();    //�õ�һ��session����
	Transaction tx=null;
	try {
		tx=session.beginTransaction();
		session.save(u);
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
public user getlog(String username)
{
Session session =sFactory.openSession();
user log =null;
try {
	log=(user)session.get(user.class, username);
	if(log!=null)System.out.print("��¼�ɹ�");
} catch (Exception e) {
	
	e.printStackTrace();
}finally {session.close();}
return log;
}



public boolean updatelog(String username,String password,String answer)
{
	/*System.out.print(username+password);*/
	user u=getlog(username);
	if(u==null)
		return false;
	u.setPassword(password);
	u.setAnswer(answer);
	Session session=sFactory.openSession();    //�õ�һ��session����
/*	System.out.print(u.getUsername()+u.getPassword());*/
	Transaction tx=null;
	try {
		tx=session.beginTransaction();
		
		session.update(u);
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

public List show()
{
	Session session=com.HibernateSessionFactory.getSession();
	
	Transaction tx=null;
	tx=session.beginTransaction();
	String sqlString="select * from tb_loginer";
	
	Query query =session.createSQLQuery(sqlString).addEntity(user.class);
	java.util.List<user> resultSet=query.list();
	tx.commit();
	return resultSet;	
}



public boolean del(String username){
	Session session=sFactory.openSession();    //�õ�һ��session����
	Transaction tx=null;
	try {
		tx=session.beginTransaction();
		user u=getlog(username);
		session.delete(u);
		tx.commit();
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

