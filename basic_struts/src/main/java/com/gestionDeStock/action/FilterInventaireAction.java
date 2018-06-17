package com.gestionDeStock.action;

import java.util.List;

import org.hibernate.property.access.spi.SetterFieldImpl;

import com.gestionDeStock.beans.Inventaire;
import com.gestionDeStock.dao.InventaireDao;
import com.gestionDeStock.dao.LoginDao;
import com.opensymphony.xwork2.ActionSupport;

public class FilterInventaireAction extends ActionSupport{

    private static final long serialVersionUID = 1L;
    private int article;
    private String date;
    private List<Inventaire> inventaires ;
    private List<Inventaire> inventairesAll ;
     
	public int getArticle() {
		return article;
	}

	public void setArticle(int article) {
		this.article = article;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public List<Inventaire> getInventaires() {
		return inventaires;
	}

	public void setInventaires(List<Inventaire> inventaires) {
		this.inventaires = inventaires;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String execute() throws Exception {
	        System.out.println(article + "  "+date);
	    	if(article != 0 || date != null)
	    	{
	    		setInventaires((List<Inventaire>) InventaireDao.inventaireByDateAndArticle(article, date));
	    		setInventairesAll((List<Inventaire>) InventaireDao.allInventaire());
	            return SUCCESS;
	    	}
			return SUCCESS;
	   }

	public List<Inventaire> getInventairesAll() {
		return inventairesAll;
	}

	public void setInventairesAll(List<Inventaire> inventairesAll) {
		this.inventairesAll = inventairesAll;
	}

}
