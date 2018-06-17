package com.gestionDeStock.beans;

import java.util.Date;

import javax.persistence.*;

@Entity
@Table(name="commande")
public class Commande {
	
	@Id
	@GeneratedValue
	@Column(name="codecmd")
	private int codecmd;
	
	@Column(name="client")
	private int client;
	
	@Column(name="nomarti")
	private String nomarti;
	
	@Column(name="qtecmd")
	private int qtecmd;
	
	@Column(name="total")
	private int total;
	
	@Column(name="datecmd")
	private Date datecmd;

	public int getCodecmd() {
		return codecmd;
	}

	public void setCodecmd(int codecmd) {
		this.codecmd = codecmd;
	}

	public int getClient() {
		return client;
	}

	public void setClient(int client) {
		this.client = client;
	}

	public String getNomarti() {
		return nomarti;
	}

	public void setNomarti(String nomarti) {
		this.nomarti = nomarti;
	}

	public int getQtecmd() {
		return qtecmd;
	}

	public void setQtecmd(int qtecmd) {
		this.qtecmd = qtecmd;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public Date getDatecmd() {
		return datecmd;
	}

	public void setDatecmd(Date datecmd) {
		this.datecmd = datecmd;
	}
				
	
}
