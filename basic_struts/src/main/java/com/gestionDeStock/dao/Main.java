package com.gestionDeStock.dao;

import java.util.Date;
import java.util.List;

import com.gestionDeStock.beans.Achat;
import com.gestionDeStock.beans.Article;
import com.gestionDeStock.beans.Inventaire;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
/*			List<Inventaire> invs = (List<Inventaire>) InventaireDao.inventaireByDateAndArticle(0, "2018-06-12");
			for(Inventaire i : invs)
			{
				System.out.println(i.getCodeArt());
			}
			
			List<Achat> achts = (List<Achat>) AchatsDao.inventaireByDateAndArticle(1, "2018-06-12");
			for(Achat i : achts)
			{
				System.out.println(i.getCodeArt());
			}
			
			List<Article> arts = (List<Article>) ArticleDao.articleByDate("2018-06-12");
			System.out.println("=================================");
			for(Article i : arts)
			{
				System.out.println(i.getCodeart());
			}
	
			Inventaire i = ArticleDao.getInventaireI("2020-12-14",3);
			System.out.println("=================================");
			
			System.out.println(i.getDateInv());
			System.out.println(i.getQteArt());*/
/*			
			System.out.println("************************************");
			List<Article> arts = (List<Article>) ArticleDao.articleByDate("2018-12-12");
			System.err.println(arts.size());
			for(Article art : arts )
			{
				System.out.println("**************************");
				System.out.println(art.getNomart());
				System.err.println(art.getPrixart());
				System.out.println(art.getQuantite());
			}
			
			LoginDao.login("admin", "admin");*/
			
		/*	Inventaire inv = new Inventaire();
			inv.setCodeArt(8);
			inv.setQteArt(20);
			inv.setDescInv("description");
			inv.setDateInv(new Date());
			
			boolean res = InventaireDao.add(inv);
			System.out.println(res);*/
		
			List<Article> arts = ArticleDao.getAllArticle();
			for(Article a : arts)
			{
				System.out.println(a.getNomart());
			}
	}

}
