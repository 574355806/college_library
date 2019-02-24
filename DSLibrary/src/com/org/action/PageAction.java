package com.org.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;
import com.org.dao.Pagedao;
import com.org.dao.hbPage;
import com.org.model.Page;
import com.org.model.book;
import com.org.model.borrowrecord;
import com.org.model.reader;
import com.sun.org.apache.bcel.internal.generic.NEW;

public class PageAction implements ModelDriven<Page> {
	
	
	 private List list=null;
	    private  Map<String, Object> session = ActionContext.getContext().getSession();
	    private static final long serialVersionUID = 1L;
	    private Page page = new Page();
	    public List getList() {
			return list;
		}
		public void setList(List list) {
			this.list = list;
		}
		public Page getPage() {
			return page;
		}
		public void setPage(Page page) {
			this.page = page;
		}
		public Page getModel() {
	        return page;
	    }
	    @SuppressWarnings("static-access")
		public String login() {
	       //���õ�ǰҳΪ1
	        page.setPageId(1);
	        //�õ���һҳ������
	        HttpServletRequest request=ServletActionContext.getRequest();
	        String flag=request.getParameter("flag");
	        if(flag.equals("book"))
	        	{
	        	hbPage hb=new hbPage();
	            list=hb.showPageList(new book(), page.getPageId(),5);
	        test(new book(),page.getPageId(),5);
	        return "book";
	        }
	        if(flag.equals("reader"))
        	{
        	hbPage hb=new hbPage();
            list=hb.showPageList(new reader(), page.getPageId(),5);
        test(new reader(),page.getPageId(),5);
        return "reader";
        }
	        if(flag.equals("borrowrecord"))
        	{
        	hbPage hb=new hbPage();
            list=hb.showPageList(new borrowrecord(), page.getPageId(),5);
        test(new borrowrecord(),page.getPageId(),5);
        return "borrowrecord";
        }
	        
			return "false";
	    }
	    public String add() {
	       //ÿ�ζ����Լ���1
	    	  HttpServletRequest request=ServletActionContext.getRequest();
		        String flag=request.getParameter("flag");
		      
	        page.setPageId(page.getPageId()+1);
	        //���õ�����ҳ����ʾ����
	        if(flag.equals("book"))
	        {  test(new book(),page.getPageId(),5); return "addbook";}
	        else if(flag.equals("reader"))
	        { test(new reader(),page.getPageId(),5);return "addreader";}
	        else if(flag.equals("borrowrecord"))
	        {   test(new borrowrecord(),page.getPageId(),5);
	        return "addborrowrecord";
	        }
			return "false";
	    
	        
	    }
	    public String before() {
	    //ÿ�ζ����Լ���1
	    	
	        page.setPageId(page.getPageId()-1);
	        HttpServletRequest request=ServletActionContext.getRequest();
	        String flag=request.getParameter("flag");
	      
	        //���õ�����ҳ����ʾ����
	        if(flag.equals("book"))
	        {  test(new book(),page.getPageId(),5); return "beforebook";}
	        else if(flag.equals("reader"))
	        { test(new reader(),page.getPageId(),5);return "beforereader";}
	        else if(flag.equals("borrowrecord"))
	        {   test(new borrowrecord(),page.getPageId(),5);
	        return "beforeborrowrecord";
	        }
			return "false";
	    }
	    /**
	     * 
	     * @param object Ҫ��ҳ�Ķ���
	     * @param pageId ��ǰҳ
	     * @param count  ÿһҳ������
	     */
	    public void test(Object object,int pageId,int count){
	    //�õ���ҳ��
	          int pageCount=Pagedao.getPageCount(hbPage.getTotalCount(object), count); 
	          //��ֵ�Ž�session��
	          session.put("pageCount",pageCount);
	          //��ȡ��ǰҳ������
	          list  =hbPage.showPageList(object, pageId , count);
	           //��ֵ�Ž�session��
	          session.put("list",
	                    list);
	    }
}
