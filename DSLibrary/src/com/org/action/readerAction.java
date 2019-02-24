package com.org.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.org.dao.bookdao;
import com.org.dao.readerdao;
import com.org.model.book;
import com.org.model.reader;

public class readerAction extends ActionSupport implements ModelDriven<reader>{
	private List rlist;
	private reader reader;
	public List getRlist() {
		return rlist;
	}
	public void setRlist(List rlist) {
		this.rlist = rlist;
	}
	public reader getReader() {
		return reader;
	}
	public void setReader(reader reader) {
		this.reader = reader;
	}
	
	@Override
	public com.org.model.reader getModel() {
		if(reader==null ) reader= new reader();
		return reader;
	}
	public String show()
	{
		
		readerdao readerdao=new readerdao();
		 rlist=readerdao.show();
		 return "show";
		
	}

	public String addreader(){
		String mes;
			readerdao arReaderdao=new readerdao();
		if(arReaderdao.insert(reader)==true)
			mes="��ӳɹ�";

		else mes="���д˱�ţ����ʧ��";
		
		addActionMessage(mes);
	
		return "addreader";
		
	}
	
	public String removereader(){	
		//���httpservletrequest����
		HttpServletRequest request=ServletActionContext.getRequest();
		//���session����
	//	HttpSession session=ServletActionContext.getRequest().getSession();
	readerdao rd=new readerdao();
	 
	String mes;
	String u=request.getParameter("rnumber");
	if(rd.del(u))
	
			mes="ɾ���ɹ�";

		else mes="ɾ��ʧ��";
		
		addActionMessage(mes);
		return "removereader";
	 	
	}
	public String changereader(){
		
		HttpServletRequest request=ServletActionContext.getRequest();
		String rnumber=request.getParameter("rnumber");
		String rname=request.getParameter("rname");
		String classnum=request.getParameter("classnum");
		String rsex=request.getParameter("rsex");
		int rage;
		try {
			rage = Integer.parseInt(request.getParameter("rage").toString());
		} catch (NumberFormatException e) {
			addActionMessage("�����ʽ����");
			return "changereader";
		
		}
		String dept=request.getParameter("dept");
	
		reader reader1=new reader(rnumber, rname, rsex, classnum, dept, rage);
		readerdao rd=new readerdao();
	
	if(rd.updatereader(reader1))
			addActionMessage("�޸ĳɹ�");
	else
		addActionMessage("�޸�ʧ��");
	return "changereader";
	
}
	public String showchangereader(){
		readerdao rd=new readerdao();
		 rlist=rd.show();
				return "showchangereader";	
}

	public String showremovereader(){
		readerdao rd=new readerdao();
		 rlist=rd.show();
				return "showremovereader";
		
	}
	public String search(){
		HttpServletRequest request=ServletActionContext.getRequest();
		String type=request.getParameter("type");
		String key=request.getParameter("key");
	
		readerdao rd=new readerdao();
		
		 rlist=rd.search(type, key);
		 if(rlist==null) {
			 addActionMessage("���޴���");
			 
		 } 
				return "search";
	}
	public String result(){
		
				return "result";
		
	}
	
	public String searchoperator(){
		readerdao rd=new readerdao();
		 rlist=rd.show();
		return "searchoperator";

}
	

}
