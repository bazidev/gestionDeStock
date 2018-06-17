package com.gestionDeStock.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.gestionDeStock.beans.Achat;
import com.gestionDeStock.beans.Article;
import com.gestionDeStock.beans.Inventaire;
import com.gestionDeStock.utils.HibernateUtil;
import com.gestionDeStock.utils.HibernateUtil2;

public class ArticleDao {
	//selectioner  tous les Articles qui existent dans le stock dans une date
	public static Object articleByDate(String date) {
		
		// selectioner tous les inventaire qui existent dans le stock dan cette date	
		List<Inventaire> invts= (List<Inventaire>) InventaireDao.allInventaire();
		System.out.println(invts.size());
		List<Article> arts = new ArrayList<Article>();
		Session session = HibernateUtil2.getSession();
		if (session != null) {
		
			try {
				for(Inventaire in : invts)
				{
					Query query = session.createQuery("from Article where codeart = "+in.getCodeArt());
					List tmp = query.list();
					if(!tmp.isEmpty())
					{
						Article tmpA = (Article) tmp.get(0);
						tmpA.setQuantite(computeQuantite(tmpA.getCodeart(), date));
						arts.add(tmpA);
					}
				}
				return arts;
				
			} catch (Exception exception) {
				System.out.println("Exception occred while reading user data: " + exception.getMessage());
				return null;
			}

		} else {
			System.out.println("DB server down.....");
		}
		return null;
	}
	
	
	// dernier inventaire de l’article avant  DateX
	public static Inventaire getInventaireI(String date,int code)
	{
				Session session = HibernateUtil.getSession();
				if (session != null) {
				
					try {
						Query query = session.createSQLQuery("SELECT codeInv as {obj.codeInv}"
								+ "	,codeArt	 as {obj.codeArt}"
								+ " ,qteArt  as {obj.qteArt} "
								+ " ,descInv  as {obj.descInv}"
								+ "	,dateInv as {obj.dateInv}"
								+ " FROM `inventaire` "
								+ " where inventaire.dateInv < :date and codeArt = :code  "
								+ " ORDER by inventaire.dateInv desc limit 1").addEntity("obj",Inventaire.class);
						query.setParameter("date", date);
						query.setParameter("code", code);
						System.out.println(query.getQueryString());
						if(!query.list().isEmpty())
							return (Inventaire) query.uniqueResult();
						
					} catch (Exception exception) {
						System.out.println("Exception occred while reading user data: " + exception.getMessage());
						return null;
					}

				} else {
					System.out.println("DB server down.....");
				}
				return null;
	}
	
	
	// somme des quantités d’achats de l’article après DateI jusqu’à DateX
	public static int getQteArtAch(int code,String dateI, String dateX)
	{
					Session session = HibernateUtil.getSession();
					if (session != null) {
					
						try {
							Query query = session.createSQLQuery("select sum(qteAchete) from achats WHERE"
									+ " dateReception BETWEEN :dateI and :dateX   and codeArt = :code");
							query.setParameter("dateI", dateI);
							query.setParameter("dateX", dateX);
							query.setParameter("code", code);
							if(!query.list().isEmpty())
								return Integer.parseInt(query.uniqueResult().toString());
							
						} catch (Exception exception) {
							System.out.println("Exception occred while reading user data: " + exception.getMessage());
							return 0;
						}

					} else {
						System.out.println("DB server down.....");
					}
					return 0;
		}
	
	
	public static int getQteArtVte(int code,String dateI, String dateX)
	{
					Session session = HibernateUtil2.getSession();
					if (session != null) {
					
						try {
							Query query = session.createSQLQuery("select sum(qtecmd) from commande WHERE"
									+ " datecmd BETWEEN :dateI and :dateX and codeArt = :code");
							query.setParameter("dateI", dateI);
							query.setParameter("dateX", dateX);
							query.setParameter("code", code);
							if(!query.list().isEmpty())
								return Integer.parseInt(query.uniqueResult().toString());
							System.out.println(Integer.parseInt(query.uniqueResult().toString()));
						} catch (Exception exception) {
							System.out.println("Exception occred while reading user data: " + exception.getMessage());
							return 0;
						}

					} else {
						System.out.println("DB server down.....");
					}
					return 0;
		}
	
	public static int computeQuantite(int code,String dateX)
	{

		Inventaire i = ArticleDao.getInventaireI(dateX,code);
		if(i == null)
			return 0;
		String dateI = i.getDateInv().toString(); //
        int QteArtInv = i.getQteArt() ; //:= Quantité de l’article dans le dernier inventaire du DateI
        int  QteArtAch = getQteArtAch(code,dateI, dateX) ;//:= somme des quantités d’achats de l’article après DateI jusqu’à DateX
        int QteArtVte = getQteArtVte(code,dateI, dateX)  ;//:= somme des quantités vendus de l’article après DateI jusqu’à DateX
		int quantite = QteArtInv + QteArtAch - QteArtVte ;
		
		System.out.println("dateX : "+dateX);
		System.out.println("dateI : "+dateI);
		System.out.println("QteArtInv : "+QteArtInv);
		System.out.println("QteArtAch : "+QteArtAch);
		System.out.println("QteArtVte : "+QteArtVte);
		System.out.println("quantite : "+quantite);
		
		return quantite;
	}
}
