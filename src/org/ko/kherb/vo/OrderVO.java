package org.ko.kherb.vo;

import java.util.Date;

public class OrderVO {
	private String payno;
	private int cno;
	private int dprice;
	private String ono;
	private String id;
	private String oname;
	private String ohp;
	private int pno;
	private String pname;
	private int pcount;
	private int price;
	private int totalprice;
	private Date odate;
	private String opostcode;
	private String oaddr1;
	private String oaddr2;
	private String oimg;
	private String mcode;
	private String product;


	// 검색 관련
	private String searchCondition;
	private String searchKeyword;
	
	public OrderVO() {}
	
	public OrderVO(String searchCondition, String searchKeyword) {
		super();
		this.searchCondition = searchCondition;
		this.searchKeyword = searchKeyword;
		System.out.println("검색 데이터 저장 및 호출 시도");
		System.out.println("검색 데이터 저장 및 호출 완료 ");
	}

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public int getDprice() {
		return dprice;
	}

	public void setDprice(int dprice) {
		this.dprice = dprice;
	}
	public String getMcode() {
		return mcode;
	}

	public void setMcode(String mcode) {
		this.mcode = mcode;
	}
	public String getPayno() {
		return payno;
	}

	public void setPayno(String payno) {
		this.payno = payno;
	}

	public String getOno() {
		return ono;
	}

	public void setOno(String ono) {
		this.ono = ono;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getOname() {
		return oname;
	}

	public void setOname(String oname) {
		this.oname = oname;
	}

	public String getOhp() {
		return ohp;
	}

	public void setOhp(String ohp) {
		this.ohp = ohp;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public int getPcount() {
		return pcount;
	}

	public void setPcount(int pcount) {
		this.pcount = pcount;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getTotalprice() {
		return totalprice;
	}

	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}

	public Date getOdate() {
		return odate;
	}

	public void setOdate(Date odate) {
		this.odate = odate;
	}

	public String getOpostcode() {
		return opostcode;
	}

	public void setOpostcode(String opostcode) {
		this.opostcode = opostcode;
	}

	public String getOaddr1() {
		return oaddr1;
	}

	public void setOaddr1(String oaddr1) {
		this.oaddr1 = oaddr1;
	}

	public String getOaddr2() {
		return oaddr2;
	}

	public void setOaddr2(String oaddr2) {
		this.oaddr2 = oaddr2;
	}

	public String getOimg() {
		return oimg;
	}

	public void setOimg(String oimg) {
		this.oimg = oimg;
	}

	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	
	public String getProduct() {
		return product;
	}

	public void setProduct(String product) {
		this.product = product;
	}

	@Override
	public String toString() {
		return "OrderVO [payno=" + payno + ", cno=" + cno + ", dprice=" + dprice + ", ono=" + ono + ", id=" + id
				+ ", oname=" + oname + ", ohp=" + ohp + ", pno=" + pno + ", pname=" + pname + ", pcount=" + pcount
				+ ", price=" + price + ", totalprice=" + totalprice + ", odate=" + odate + ", opostcode=" + opostcode
				+ ", oaddr1=" + oaddr1 + ", oaddr2=" + oaddr2 + ", oimg=" + oimg + ", mcode=" + mcode
				+ ", searchCondition=" + searchCondition + ", searchKeyword=" + searchKeyword + "]";
	}
}
