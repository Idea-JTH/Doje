package com.hotdog.vo;

public class Criteria {
	private Integer page; //현재 페이지
	private Integer perPagerNum; //페이지당 글의 수
	private Integer perChapterNum; // 챕터당 페이지수
	private String keyword;
	private String table;
	
	private boolean prev;
	private boolean next;
	private Integer start;
	private Integer end;
	private Integer totalPage;
	
	public Criteria() {
		this.page = 1;
		this.perPagerNum = 10;
		this.perChapterNum = 5;
		this.keyword = null;
		this.prev=true;
		this.next = true;
	}
	
	public Integer getPageStart() {
		return (page - 1) * perPagerNum;
	}
	
	public void calculate(Integer total) {
		//전체 글의 개수를 기반으로 페이징 처리
		this.totalPage = (int) Math.ceil((double)total / this.perPagerNum);
		if(this.totalPage == 0) {
			this.totalPage = 1;
		}
		
		this.end = (int)Math.ceil( 
					(double) this.page / this.perChapterNum ) * this.perChapterNum;
		this.start = this.end - this.perChapterNum + 1;
		
		if(this.end > this.totalPage) {
			this.end = this.totalPage;
			this.next = false;
		}
		
		if(this.start == 1) {
			this.prev = false;
		}
	}
	
	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public Integer getStart() {
		return start;
	}

	public void setStart(Integer start) {
		this.start = start;
	}

	public Integer getEnd() {
		return end;
	}

	public void setEnd(Integer end) {
		this.end = end;
	}

	public Integer getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}
	
	public String getTable() {
		return table;
	}
	
	public void setTable(String table) {
		this.table = table;
	}


	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getPerPagerNum() {
		return perPagerNum;
	}

	public void setPerPagerNum(Integer perPagerNum) {
		this.perPagerNum = perPagerNum;
	}

	public Integer getPerChapterNum() {
		return perChapterNum;
	}

	public void setPerChapterNum(Integer perChapterNum) {
		this.perChapterNum = perChapterNum;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	
}

