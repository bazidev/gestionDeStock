package com.gestionDeStock.beans;

import javax.persistence.*;

@Entity
@Table(name="article")
public class Article  {
	@Id
	@GeneratedValue
	@Column(name="codeart")
	private int codeart;
	

	@Column(name="nomart")
	private String nomart;

	@Column(name="descart")
	private String descart;

	@Column(name="prixart")
	private int prixart;

	@Transient
	private int Quantite;
	
	
	
	public int getQuantite() {
		return Quantite;
	}

	public void setQuantite(int quantite) {
		Quantite = quantite;
	}

	public int getCodeart() {
		return codeart;
	}

	public void setCodeart(int codeart) {
		this.codeart = codeart;
	}

	public String getNomart() {
		return nomart;
	}

	public void setNomart(String nomart) {
		this.nomart = nomart;
	}

	public String getDescart() {
		return descart;
	}

	public void setDescart(String descart) {
		this.descart = descart;
	}

	public int getPrixart() {
		return prixart;
	}

	public void setPrixart(int prixart) {
		this.prixart = prixart;
	}
	
	
}
