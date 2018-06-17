package com.gestionDeStock.beans;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.*;

@Entity
@Table(name="inventaire")
public class Inventaire implements Serializable{
	public Inventaire() {
		// TODO Auto-generated constructor stub
	}
	
	@Id
	@GeneratedValue
	@Column(name = "codeInv")
	private int codeInv;
	
	@Column(name="codeArt")
	private int codeArt;
	
	@Column(name="qteArt")
	private int qteArt;
	
	@Column(name="descInv")
	private String descInv;
	
	@Column(name="dateInv")
	private Date dateInv;

	public int getCodeInv() {
		return codeInv;
	}

	public void setCodeInv(int codeInv) {
		this.codeInv = codeInv;
	}

	public int getCodeArt() {
		return codeArt;
	}

	public void setCodeArt(int codeArt) {
		this.codeArt = codeArt;
	}

	public int getQteArt() {
		return qteArt;
	}

	public void setQteArt(int qteArt) {
		this.qteArt = qteArt;
	}

	public String getDescInv() {
		return descInv;
	}

	public void setDescInv(String descInv) {
		this.descInv = descInv;
	}

	public Date getDateInv() {
		return dateInv;
	}

	public void setDateInv(Date dateInv) {
		this.dateInv = dateInv;
	}
	
}
