package com.org.model;

public class Page {

	 /**
     * 
     * ��¼��ǰҳ��id
     * 
     */
    private int pageId;
    /**
     * ÿһҳ������
     */
    private int everyPageCount;
    /**
     * ������
     */
    private int totalCount;
    public Page(){}
	public int getPageId() {
		return pageId;
	}
	public void setPageId(int pageId) {
		this.pageId = pageId;
	}
	public int getEveryPageCount() {
		return everyPageCount;
	}
	public void setEveryPageCount(int everyPageCount) {
		this.everyPageCount = everyPageCount;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public Page(int pageId, int everyPageCount, int totalCount) {
		super();
		this.pageId = pageId;
		this.everyPageCount = everyPageCount;
		this.totalCount = totalCount;
	}
    

}
