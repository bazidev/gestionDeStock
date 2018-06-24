package com.gestionDeStock.action;

import com.gestionDeStock.beans.Inventaire;
import com.gestionDeStock.dao.InventaireDao;
import com.opensymphony.xwork2.ActionSupport;

//action de supprission d'inventaire
public class RemoveInventaire extends ActionSupport {
    private static final long serialVersionUID = 1L;
    private int inventaire;
    
	public int getInventaire() {
		return inventaire;
	}

	public void setInventaire(int inventaire) {
		this.inventaire = inventaire;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String execute() throws Exception {
        Inventaire inv = new Inventaire();
        System.out.println("inv :"+inventaire);
        inv.setCodeInv(inventaire);
    	if(InventaireDao.remove(inv))
    	{
    		System.out.println("worked");
            return SUCCESS;
    	}
    	System.out.println("i am her");
		return SUCCESS;
    }
}
