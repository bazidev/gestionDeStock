package com.gestionDeStock.action;

import com.gestionDeStock.dao.AchatsDao;
import com.gestionDeStock.dao.InventaireDao;
import com.opensymphony.xwork2.ActionSupport;

import java.text.SimpleDateFormat;
import com.gestionDeStock.beans.*;

//action pour ajouter achat
public class AjouterAchat extends ActionSupport {
    private SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
    private static final long serialVersionUID = 1L;
    private int article;
    private int quantity;
    private String date ; 


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
        Achat achat = new Achat();
        achat.setCodeArt(article);
        achat.setQteAchete(quantity);
        achat.setDateReception(sdf1.parse(date));
    	if(AchatsDao.add(achat))
    	{
            return SUCCESS;
    	}
		return SUCCESS;
    }

}
