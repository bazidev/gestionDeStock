package com.gestionDeStock.action;

import com.gestionDeStock.dao.InventaireDao;
import com.gestionDeStock.dao.LoginDao;
import com.opensymphony.xwork2.ActionSupport;

import java.util.List;

import com.gestionDeStock.beans.*;


//action de login
public class LoginAction extends ActionSupport {
 
    private static final long serialVersionUID = 1L;
    private String userName;
    private String password;
    private List<Inventaire> inventaires ;
    private List<Inventaire> inventairesAll ; 

    public String execute() throws Exception {
        
    	if(LoginDao.login(userName, password))
    	{
    		setInventairesAll((List<Inventaire>) InventaireDao.allInventaire());
    		setInventaires((List<Inventaire>) InventaireDao.allInventaire());
            return SUCCESS;
    	}
    	addActionError("nom d'utilisateur ou mot de passe incorrect");
		return ERROR;
    }
 
 

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	
	//validation des champs requis
	public void validate(){
		
		if("".equals(getUserName())){
			addFieldError("userName", getText("username.required"));
		}
		if("".equals(getPassword())){
			addFieldError("password", getText("password.required"));
		}
		
	}



	public List<Inventaire> getInventaires() {
		return inventaires;
	}



	public void setInventaires(List<Inventaire> inventaires) {
		this.inventaires = inventaires;
	}



	public List<Inventaire> getInventairesAll() {
		return inventairesAll;
	}



	public void setInventairesAll(List<Inventaire> inventairesAll) {
		this.inventairesAll = inventairesAll;
	}
}
