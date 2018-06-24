package com.gestionDeStock.action;

import com.gestionDeStock.dao.InventaireDao;
import com.opensymphony.xwork2.ActionSupport;

import java.text.SimpleDateFormat;
import com.gestionDeStock.beans.*;

public class ModifyInventaire extends ActionSupport {
    private SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
    private static final long serialVersionUID = 1L;
    private int inventaire;
    private int article;
    private int quantity;
    private String description;
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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
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
        Inventaire inv = new Inventaire();
        System.out.println("inv :"+inventaire);
        inv.setCodeInv(inventaire);
        inv.setCodeArt(article);
        inv.setQteArt(quantity);
        inv.setDescInv(description);
        inv.setDateInv(sdf1.parse(date));
    	if(InventaireDao.update(inv))
    	{
    		System.out.println("worked");
            return SUCCESS;
    	}
    	System.out.println("i am her");
		return SUCCESS;
    }

	public int getInventaire() {
		return inventaire;
	}

	public void setInventaire(int inventaire) {
		this.inventaire = inventaire;
	}

}
