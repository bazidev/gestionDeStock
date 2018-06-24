package com.gestionDeStock.action;

import com.gestionDeStock.dao.AchatsDao;
import com.gestionDeStock.dao.InventaireDao;
import com.opensymphony.xwork2.ActionSupport;

import java.text.SimpleDateFormat;
import com.gestionDeStock.beans.*;

public class ModifyAchat extends ActionSupport {
    private SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
    private static final long serialVersionUID = 1L;
    private int achat;
    private int article;
    private int quantity;
    private String date ; 


	public SimpleDateFormat getSdf1() {
		return sdf1;
	}

	public void setSdf1(SimpleDateFormat sdf1) {
		this.sdf1 = sdf1;
	}

	public int getAchat() {
		return achat;
	}

	public void setAchat(int achat) {
		this.achat = achat;
	}

	public int getArticle() {
		return article;
	}

	public void setArticle(int article) {
		this.article = article;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	
	public String execute() throws Exception {
        Achat ach = new Achat();
        System.out.println("inv :"+achat);
        ach.setCodeAchat(achat);
        ach.setCodeArt(article);
        ach.setQteAchete(quantity);
        ach.setDateReception(sdf1.parse(date));
    	if(AchatsDao.update(ach))
    	{
    		System.out.println("worked");
            return SUCCESS;
    	}
    	System.out.println("i am her");
		return SUCCESS;
    }

	

}
