package com.org.dao;

public class Pagedao {
	 private static int pageCount;
	 //得到总页数
    public static int getPageCount(int totalCount, int everyPageCount) {
        if (everyPageCount >= totalCount) {
            pageCount = 1;
        } else {
        	if(totalCount%everyPageCount!=0)
            pageCount = totalCount / everyPageCount + 1;
        	else pageCount=totalCount / everyPageCount;
        }

        return pageCount;

    }
    /**
     * 是否有上一页或下一页
     * @param pageId 当前页的id
     * @param pageCount 总页数
     * @return 有就返回true ，没有就返回false
     */
    public static boolean isHasPage(int pageId,int pageCount){
        if (pageId==pageCount||pageId==1) {
            return false;
        }
        return true;
    }

}
