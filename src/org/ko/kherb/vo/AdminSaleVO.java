package org.ko.kherb.vo;

import java.time.LocalDate;

public class AdminSaleVO {
 

String pname;
String price;
int pcount;
int pno;
String sum;
LocalDate dd; //일일 값 넣기
String year; //년 값 넣기
String month;
String title;
String content;
String odate;
int limit;
int offset;
String sort;
public String getPname() {
	return pname;
}
public void setPname(String pname) {
	this.pname = pname;
}

public String getPrice() {
	return price;
}
public void setPrice(String price) {
	this.price = price;
}
public int getPcount() {
	return pcount;
}
public void setPcount(int pcount) {
	this.pcount = pcount;
}

public String getSum() {
	return sum;
}
public void setSum(String sum) {
	this.sum = sum;
}

public LocalDate getDd() {
	return dd;
}
public void setDd(LocalDate dd) {
	this.dd = dd;
}
public String getYear() {
	return year;
}
public void setYear(String year) {
	this.year = year;
}
public String getMonth() {
	return month;
}
public void setMonth(String month) {
	this.month = month;
}

public int getPno() {
	return pno;
}
public void setPno(int pno) {
	this.pno = pno;
}

public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}

public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}

public String getOdate() {
	return odate;
}
public void setOdate(String odate) {
	this.odate = odate;
}


public int getLimit() {
	return limit;
}
public void setLimit(int limit) {
	this.limit = limit;
}
public int getOffset() {
	return offset;
}
public void setOffset(int offset) {
	this.offset = offset;
}

public String getSort() {
	return sort;
}
public void setSort(String sort) {
	this.sort = sort;
}
@Override
public String toString() {
	return "AdminSaleVO [pname=" + pname + ", price=" + price + ", pcount=" + pcount + "]";
}



}
