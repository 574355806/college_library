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
	       //设置当前页为1
	        page.setPageId(1);
	        //得到第一页的数据
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
	       //每次都会自己加1
	    	  HttpServletRequest request=ServletActionContext.getRequest();
		        String flag=request.getParameter("flag");
		      
	        page.setPageId(page.getPageId()+1);
	        //将得到的新页数显示出来
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
	    //每次都会自己减1
	    	
	        page.setPageId(page.getPageId()-1);
	        HttpServletRequest request=ServletActionContext.getRequest();
	        String flag=request.getParameter("flag");
	      
	        //将得到的新页数显示出来
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
	     * @param object 要分页的对象
	     * @param pageId 当前页
	     * @param count  每一页的数量
	     */
	    public void test(Object object,int pageId,int count){
	    //得到总页数
	          int pageCount=Pagedao.getPageCount(hbPage.getTotalCount(object), count); 
	          //将值放进session中
	          session.put("pageCount",pageCount);
	          //获取当前页的数据
	          list  =hbPage.showPageList(object, pageId , count);
	           //将值放进session中
	          session.put("list",
	                    list);
	    }
}
