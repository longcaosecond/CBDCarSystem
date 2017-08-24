package com.lovo.util;

import java.io.Serializable;

import org.springframework.stereotype.Component;
@Component
public class PageBean implements Serializable{
	private int currentPage;//当前页
	 private int totalPage;//总页码
	 private int all;//查询出来的总行数
	 private int pageSize=5;//默认显示几行
	 private int startIndex;//查询起始位置

	public int getStartIndex() {
		startIndex= (currentPage-1)*pageSize;
		return startIndex;
	}
	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getTotalPage() {
		if(all%pageSize==0){
			totalPage = all/pageSize;
		}else{
			totalPage = all/pageSize+1;
		}
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getAll() {
		return all;
	}
	public void setAll(int all) {
		this.all = all;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
}
