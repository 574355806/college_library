package com.org.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.org.model.book;
import com.org.model.borrowrecord;

public class hbPage {
	
	
	public static int getTotalCount(Object object ) {
        Session session = null;
        List list = null;
        try {
            session = com.HibernateSessionFactory.getSession();
            Transaction t = session.beginTransaction();
           /* if(object instanceof borrowrecord)
            	 list = session.createSQLQuery("select * from tb_borrowrecord").addEntity(borrowrecord.class).list();
            
            else */ list = session.createQuery("from "+object.getClass().getSimpleName()).list();
         
            t.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }

        return list.size();
    }
    /**
     * 
     * @param object 要查询的持久化类
     * @param pageId 当前页
     * @param everyPageCount 每一页的数量
     * @return
     */
    @SuppressWarnings("unchecked")
    public static List<Object> showPageList(Object object,int pageId,int everyPageCount){
       Session session = null;
        List<Object> list = null;
        try {
            session = com.HibernateSessionFactory.getSession();
            Transaction t = session.beginTransaction();
            org.hibernate.Query query = session.createQuery("from "+object.getClass().getSimpleName());;
            if (pageId==1) {
            //如果当前页id为1
            //需要从第0条读取
                query.setFirstResult(pageId-1);
            }
            //如果当前页不为1  从当前页-1，乘以每一页的数量开始读取参数为0，代表从第一条开始读取
            query.setFirstResult((pageId-1)*everyPageCount);
            query.setMaxResults(everyPageCount);
            list=query.list();
            t.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        System.out.println(list);
         return list;
    }
	

}
