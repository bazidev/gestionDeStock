package com.gestionDeStock.beans;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.*;

@Entity
@Table(name="achats")
public class Achat implements Serializable{
	public Achat() {
		// TODO Auto-generated constructor stub
	}
	
	@Id
	@GeneratedValue
	@Column(name="codeAchat")
	private int codeAchat;
	
	@Column(name="codeArt")
	private int codeArt; 
	
	@Column(name="qteAchete")
	private int qteAchete; 
	
	@Column(name="dateReception")
	private Date dateReception;

	public int getCodeAchat() {
		return codeAchat;
	}

	public void setCodeAchat(int codeAchat) {
		this.codeAchat = codeAchat;
	}

	public int getCodeArt() {
		return codeArt;
	}

	public void setCodeArt(int codeArt) {
		this.codeArt = codeArt;
	}

	public int getQteAchete() {
		return qteAchete;
	}

	public void setQteAchete(int qteAchete) {
		this.qteAchete = qteAchete;
	}

	public Date getDateReception() {
		return dateReception;
	}

	public void setDateReception(Date dateReception) {
		this.dateReception = dateReception;
	}
	
	
}
