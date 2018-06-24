package com.gestionDeStock.action;

import com.gestionDeStock.beans.Achat;
import com.gestionDeStock.beans.Inventaire;
import com.gestionDeStock.dao.AchatsDao;
import com.gestionDeStock.dao.InventaireDao;
import com.opensymphony.xwork2.ActionSupport;


//action de supprission d'achat
public class RemoveAchat extends ActionSupport {
    private static final long serialVersionUID = 1L;
    private int achat;
    

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String execute() throws Exception {
        Achat ach = new Achat();
        System.out.println("inv :"+achat);
        ach.setCodeAchat(achat);
    	if(AchatsDao.remove(ach))
    	{
    		System.out.println("worked");
            return SUCCESS;
    	}
    	System.out.println("i am her");
		return SUCCESS;
    }

	public int getAchat() {
		return achat;
	}

	public void setAchat(int achat) {
		this.achat = achat;
	}
}
