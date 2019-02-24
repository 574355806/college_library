package com.org.model;

public class Page {

	 /**
     * 
     * 记录当前页的id
     * 
     */
    private int pageId;
    /**
     * 每一页的数量
     */
    private int everyPageCount;
    /**
     * 总数量
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
