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
				
	
}
