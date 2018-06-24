package com.gestionDeStock.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.gestionDeStock.beans.Inventaire;
import com.gestionDeStock.utils.HibernateUtil;
import com.gestionDeStock.utils.HibernateUtil2;


public class InventaireDao {
	
	
	//selectioner tous les inventaire
	public static Object allInventaire() {
		Session session = HibernateUtil.getSession();
		if (session != null) {
			try {
				Query query = session.createQuery("from Inventaire ");
				
				List<Inventaire> invs = query.list();
				
				for(Inventaire i : invs)
				{
					i.setNomArt(ArticleDao.getArticleName(i.getCodeArt()));
				}
				return invs;
				
			} catch (Exception exception) {
				System.out.println("Exception occred while reading user data: " + exception.getMessage());
				return null;
			}
			finally {
			     session.close();
			   }

		} else {
			System.out.println("DB server down.....");
		}
		return null;
	}
	
	
	//filtrer les inventaire avec code d'article ou date ou les deux
	public static Object inventaireByDateAndArticle(int art,String date) {
		Session session = HibernateUtil.getSession();
		String qr = "from Inventaire ";
		if(art != 0 || !date.equals(""))
		{
			if(art != 0   && !date.equals(""))
			{
				qr += "where codeArt = '"+art+"' and dateInv = '"+date+"'";
			}
			else if(!date.equals(""))
			{
				qr += "where dateInv = '"+date+"' ";
			}
			else {
				qr += "where codeArt = '"+art+"'";
			}
		}
		System.err.println(qr);
		if (session != null) {
			try {
				Query query = session.createQuery(qr);			
				List<Inventaire> invs = query.list();	
				for(Inventaire i : invs)
				{
					i.setNomArt(ArticleDao.getArticleName(i.getCodeArt()));
				}
				return invs;
			
			} catch (Exception exception) {
				System.out.println("Exception occred while reading user data: " + exception.getMessage());
				return null;
			}
			finally {
			     session.close();
			   }

		} else {
			System.out.println("DB server down.....");
		}
		return null;
	}
	
	
	//ajouter un inventaire
	public static boolean add(Inventaire inventaire) {
		Session session = HibernateUtil.getSession();
		Transaction transaction = session.beginTransaction();
		if (session != null) {
			try {
				session.save(inventaire);
				transaction.commit();
				return true;
			} catch (Exception exception) {
				System.out.println("Exception occred while reading user data: " + exception.getMessage());
				return false;
			}
			finally {
			     session.close();
			}

		} else {
			System.out.println("DB server down.....");
		}
		return false;
	}

	//modifier un inventaire
	public static boolean update(Inventaire inv) {
		Session session = HibernateUtil.getSession();
		Transaction transaction = session.beginTransaction();
		if (session != null) {
			try {
				session.update(inv);
				transaction.commit();
				return true;
			} catch (Exception exception) {
				System.out.println("Exception occred while reading user data: " + exception.getMessage());
				return false;
			}
			finally {
			     session.close();
			}

		} else {
			System.out.println("DB server down.....");
		}
		return false;
	}

	//supprimer un inventaire
	public static boolean remove(Inventaire inv) {
		Session session = HibernateUtil.getSession();
		Transaction transaction = session.beginTransaction();
		if (session != null) {
			try {
				session.delete(inv);
				transaction.commit();
				return true;
			} catch (Exception exception) {
				System.out.println("Exception occred while reading user data: " + exception.getMessage());
				return false;
			}
			finally {
			     session.close();
			}

		} else {
			System.out.println("DB server down.....");
		}
		return false;
	}
	
}
