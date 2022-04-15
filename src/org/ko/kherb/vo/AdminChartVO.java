package org.ko.kherb.vo;

import java.time.LocalDate;

public class AdminChartVO {
 int SPRICE;
 String DATE;
 String Local;
 int sum; //총액 받아오기 
 String summ;
 LocalDate dd; //일일 값 넣기
 LocalDate week;
 String year; //년 값 넣기
 String month; // 월 값 넣기
 
 String jan;
 String feb;
 String mar;
 String apr;
 String may;
 String jun;
 String jul;
 String aug;
 String sep;
 String oct;
 String nov;
 String dece;
 
 String oneyear;
 String twoyear;
 String threeyear;
 String fouryear;
 String fiveyear;
 
 
 String pname;
 String Month1;
 String mcode;
 
 
public int getSPRICE() {
	return SPRICE;
}
public void setSPRICE(int sPRICE) {
	SPRICE = sPRICE;
}

public String getDATE() {
	return DATE;
}
public void setDATE(String dATE) {
	DATE = dATE;
}

public String getLocal() {
	return Local;
}
public void setLocal(String local) {
	Local = local;
}



public int getSum() {
	return sum;
}
public void setSum(int sum) {
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

public String getJan() {
	return jan;
}
public void setJan(String jan) {
	this.jan = jan;
}
public String getFeb() {
	return feb;
}
public void setFeb(String feb) {
	this.feb = feb;
}
public String getMar() {
	return mar;
}
public void setMar(String mar) {
	this.mar = mar;
}
public String getApr() {
	return apr;
}
public void setApr(String apr) {
	this.apr = apr;
}
public String getMay() {
	return may;
}
public void setMay(String may) {
	this.may = may;
}
public String getJun() {
	return jun;
}
public void setJun(String jun) {
	this.jun = jun;
}
public String getJul() {
	return jul;
}
public void setJul(String jul) {
	this.jul = jul;
}
public String getAug() {
	return aug;
}
public void setAug(String aug) {
	this.aug = aug;
}
public String getSep() {
	return sep;
}
public void setSep(String sep) {
	this.sep = sep;
}
public String getOct() {
	return oct;
}
public void setOct(String oct) {
	this.oct = oct;
}
public String getNov() {
	return nov;
}
public void setNov(String nov) {
	this.nov = nov;
}
public String getDece() {
	return dece;
}
public void setDece(String dece) {
	this.dece = dece;
}

public String getOneyear() {
	return oneyear;
}
public void setOneyear(String oneyear) {
	this.oneyear = oneyear;
}
public String getTwoyear() {
	return twoyear;
}
public void setTwoyear(String twoyear) {
	this.twoyear = twoyear;
}
public String getThreeyear() {
	return threeyear;
}
public void setThreeyear(String threeyear) {
	this.threeyear = threeyear;
}
public String getFouryear() {
	return fouryear;
}
public void setFouryear(String fouryear) {
	this.fouryear = fouryear;
}
public String getFiveyear() {
	return fiveyear;
}
public void setFiveyear(String fiveyear) {
	this.fiveyear = fiveyear;
}

public String getMonth1() {
	return Month1;
}
public void setMonth1(String month1) {
	Month1 = month1;
}

public String getPname() {
	return pname;
}
public void setPname(String pname) {
	this.pname = pname;
}

public String getSumm() {
	return summ;
}
public void setSumm(String summ) {
	this.summ = summ;
}


public LocalDate getWeek() {
	return week;
}
public void setWeek(LocalDate week) {
	this.week = week;
}
public String getMcode() {
	return mcode;
}
public void setMcode(String mcode) {
	this.mcode = mcode;
}
@Override
public String toString() {
	return "AdminChartVO [SPRICE=" + SPRICE + ", DATE=" + DATE + ", Local=" + Local + ", sum=" + sum + ", dd=" + dd
			+ ", year=" + year + ", month=" + month + ", jan=" + jan + ", feb=" + feb + ", mar=" + mar + ", apr=" + apr
			+ ", may=" + may + ", jun=" + jun + ", jul=" + jul + ", aug=" + aug + ", sep=" + sep + ", oct=" + oct
			+ ", nov=" + nov + ", dece=" + dece + ", oneyear=" + oneyear + ", twoyear=" + twoyear + ", threeyear="
			+ threeyear + ", fouryear=" + fouryear + ", fiveyear=" + fiveyear + ", pname=" + pname + ", Month1="
			+ Month1 + ", getSPRICE()=" + getSPRICE() + ", getDATE()=" + getDATE() + ", getLocal()=" + getLocal()
			+ ", getSum()=" + getSum() + ", getDd()=" + getDd() + ", getYear()=" + getYear() + ", getMonth()="
			+ getMonth() + ", getJan()=" + getJan() + ", getFeb()=" + getFeb() + ", getMar()=" + getMar()
			+ ", getApr()=" + getApr() + ", getMay()=" + getMay() + ", getJun()=" + getJun() + ", getJul()=" + getJul()
			+ ", getAug()=" + getAug() + ", getSep()=" + getSep() + ", getOct()=" + getOct() + ", getNov()=" + getNov()
			+ ", getDece()=" + getDece() + ", getOneyear()=" + getOneyear() + ", getTwoyear()=" + getTwoyear()
			+ ", getThreeyear()=" + getThreeyear() + ", getFouryear()=" + getFouryear() + ", getFiveyear()="
			+ getFiveyear() + ", getMonth1()=" + getMonth1() + ", getPname()=" + getPname() + ", getClass()="
			+ getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
}





}
