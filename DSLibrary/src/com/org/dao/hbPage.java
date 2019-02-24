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
     * @param object Ҫ��ѯ�ĳ־û���
     * @param pageId ��ǰҳ
     * @param everyPageCount ÿһҳ������
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
            //�����ǰҳidΪ1
            //��Ҫ�ӵ�0����ȡ
                query.setFirstResult(pageId-1);
            }
            //�����ǰҳ��Ϊ1  �ӵ�ǰҳ-1������ÿһҳ��������ʼ��ȡ����Ϊ0������ӵ�һ����ʼ��ȡ
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
