package org.ko.kherb.vo;

public class CartVO {
	
	private int cno;
	private String id;
	private int pno;
	private String pname;
	private int pcount;
	private int price;
	private String img1;
	private String mcode;
	private int sumPrice;
	
	public int getSumPrice() {
		return sumPrice;
	}
	public void setSumPrice(int sumPrice) {
		this.sumPrice = sumPrice;
	}
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public String getImg1() {
		return img1;
	}
	public void setImg1(String img1) {
		this.img1 = img1;
	}
	public String getMcode() {
		return mcode;
	}
	public void setMcode(String mcode) {
		this.mcode = mcode;
	}
	@Override
	public String toString() {
		return "CartVO [cno=" + cno + ", id=" + id + ", pno=" + pno + ", pname=" + pname + ", pcount=" + pcount
				+ ", price=" + price + ", img1=" + img1 + ", mcode=" + mcode + ", sumPrice=" + sumPrice + "]";
	}
	
	
	
	

}
