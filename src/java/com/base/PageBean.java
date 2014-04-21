package com.base;


import java.util.List;

public class PageBean {
	
	@SuppressWarnings("unchecked")
	
	private List list; // 要返回的某一页的记录列表
	private Integer totalRow=1; // 总记录数
	private Integer totalPage=1; // 总页数
	private Integer currentPage=1; // 当前页
	private Integer prePage=1;
	private Integer nextPage=1;
	private Integer pageSize = 15; // 每页记录数
	private Boolean hasPrePage=false; // 是否有前一页
	private Boolean hasNextPage=false; // 是否有下一页
	
	public PageBean(){
		pageSize = 10;
		currentPage = 1;
	}
	
	public void setTotalRow(Integer totalRow) {
		if(this.pageSize<1)
			this.pageSize = 10;
		this.totalRow = totalRow;
		totalPage = totalRow % pageSize == 0 ? totalRow / pageSize : totalRow/ pageSize + 1;
		
		if(this.currentPage<=1){
			prePage = 1;
			hasPrePage = false;
		}else{
			prePage = currentPage - 1;
			hasPrePage = true;
		}
		nextPage = currentPage + 1;
		if(this.currentPage < this.totalPage)
			hasNextPage = true;
		else
			hasNextPage = false;
	}
	
	public PageBean(List objectList){
		this.list = objectList;
		this.totalRow = list.size();
	}
	public String toString(){
		return super.toString();
	}

	public Integer getCurrentPage() {
		if(currentPage==0)
			currentPage = 1;
		return currentPage;
	}

	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}

	/**
	 * @return the list
	 */
	public List getList() {
		return list;
	}

	/**
	 * @param list the list to set
	 */
	public void setList(List list) {
		this.list = list;
	}

	/**
	 * @return the totalPage
	 */
	public Integer getTotalPage() {
		return totalPage;
	}

	/**
	 * @param totalPage the totalPage to set
	 */
	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}

	/**
	 * @return the prePage
	 */
	public Integer getPrePage() {
		return prePage;
	}

	/**
	 * @param prePage the prePage to set
	 */
	public void setPrePage(Integer prePage) {
		this.prePage = prePage;
	}

	/**
	 * @return the nextPage
	 */
	public Integer getNextPage() {
		return nextPage;
	}

	/**
	 * @param nextPage the nextPage to set
	 */
	public void setNextPage(Integer nextPage) {
		this.nextPage = nextPage;
	}

	/**
	 * @return the pageSize
	 */
	public Integer getPageSize() {
		return pageSize;
	}

	/**
	 * @param pageSize the pageSize to set
	 */
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	/**
	 * @return the hasPrePage
	 */
	public Boolean getHasPrePage() {
		return hasPrePage;
	}

	/**
	 * @param hasPrePage the hasPrePage to set
	 */
	public void setHasPrePage(Boolean hasPrePage) {
		this.hasPrePage = hasPrePage;
	}

	/**
	 * @return the hasNextPage
	 */
	public Boolean getHasNextPage() {
		return hasNextPage;
	}

	/**
	 * @param hasNextPage the hasNextPage to set
	 */
	public void setHasNextPage(Boolean hasNextPage) {
		this.hasNextPage = hasNextPage;
	}

	/**
	 * @return the totalRow
	 */
	public Integer getTotalRow() {
		return totalRow;
	}


	
}