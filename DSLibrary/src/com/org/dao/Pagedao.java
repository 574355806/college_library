package com.org.dao;

public class Pagedao {
	 private static int pageCount;
	 //�õ���ҳ��
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
     * �Ƿ�����һҳ����һҳ
     * @param pageId ��ǰҳ��id
     * @param pageCount ��ҳ��
     * @return �оͷ���true ��û�оͷ���false
     */
    public static boolean isHasPage(int pageId,int pageCount){
        if (pageId==pageCount||pageId==1) {
            return false;
        }
        return true;
    }

}
