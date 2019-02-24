package com.org.dao;

import java.util.Iterator;
import java.util.List;

import com.org.action.borrowrecordAction;
import com.org.model.book;
import com.org.model.borrowrecord;
import com.org.model.user;
import com.sun.accessibility.internal.resources.accessibility;

public class q {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
/*loginerdao qLoginerdao=new loginerdao();
loginer u=new loginer();
qLoginerdao.show();
u=qLoginerdao.getlog("zcr");
System.out.print(u.getPassword());*/
/*readerdao aReaderdao=new readerdao();
book book=new book();
hbPage aHbPage=new hbPage();
hbPage.showPageList(book,1,5);*/
		borrowredao a=new borrowredao();
	borrowrecord br=new borrowrecord();
	
	//System.out.print(a.getborrowre(br).getClassnum());
	borrowrecordAction action=new borrowrecordAction();
	
 /* List< borrowrecord> b=action.nearreturndate();
  Iterator< borrowrecord> iterator=b.iterator();
  while (iterator.hasNext()) {
	System.out.print(iterator.next().getBid());*/
	
}
	//}
}
