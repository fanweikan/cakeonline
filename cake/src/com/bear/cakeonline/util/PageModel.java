package com.bear.cakeonline.util;

import java.util.List;

public class PageModel {
	/* 翻页数据 */
	@SuppressWarnings("rawtypes")
	private List datas;
	/* 当前页 */
	private int currPage;
	/* 每页显示的记录条数 */
	private int pageSize;// 默认每页显示4条记录
	/* 总记录条数 */
	private int totals;
	/* 总页数 */
	private int pageCount;
	// 分页显示的页数,比如在页面上显示1，2，3，4，5页，start就为1，end就为5，这个也是算过来的
	private int start;
	private int end;
	/* 后一页 */
	private int nextPage;
	/* 前一页 */
	private int prevPage;
	/* 翻页的地址 */
	private String url;

	public PageModel() {

	}

	

	/**
	 * 根据翻页的要求来构造翻页模型
	 * 
	 * @param totals
	 *            总记录数
	 * @param datas
	 *            翻页数据
	 * @param pageSize
	 *            每页显示的条数
	 * @param currPage
	 *            当前页
	 */
	@SuppressWarnings("rawtypes")
	public PageModel(int totals, List datas, int pageSize, int currPage) {
		this.totals = totals;
		this.datas = datas;
		this.pageSize = pageSize;
		this.currPage = currPage;
		if (totals % pageSize == 0) {
			this.pageCount = totals / pageSize;
		} else {
			this.pageCount = totals / pageSize + 1;
		}
		this.start = 1;
		this.end = 5;
		this.nextPage = this.currPage + 1 > this.pageCount ? this.pageCount : this.currPage + 1;
		this.prevPage = this.currPage - 1 < 1 ? 1 : this.currPage - 1;

		if (pageCount <= 5) {
			// 总页数都小于5，那么end就为总页数的值了。
			this.end = this.pageCount;
		} else {
			// 总页数大于5，那么就要根据当前是第几页，来判断start和end为多少了，
			this.start = currPage - 2;
			this.end = currPage + 2;

			if (start < 0) {
				// 比如当前页是第1页，或者第2页，那么就不如和这个规则，
				this.start = 1;
				this.end = 5;
			}
			if (end > this.pageCount) {
				// 比如当前页是倒数第2页或者最后一页，也同样不符合上面这个规则
				this.end = pageCount;
				this.start = end - 5;
			}
		}
	}

	@SuppressWarnings("rawtypes")
	public List getDatas() {
		return datas;
	}

	@SuppressWarnings("rawtypes")
	public void setDatas(List datas) {
		this.datas = datas;
	}

	public int getCurrPage() {
		return currPage;
	}

	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public int getTotals() {
		return totals;
	}

	public int getPageCount() {
		return pageCount;
	}

	public int getNextPage() {
		return nextPage;
	}

	public int getPrevPage() {
		return prevPage;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

}
