package com.gestionDeStock.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.gestionDeStock.beans.Achat;
import com.gestionDeStock.beans.Inventaire;
import com.gestionDeStock.utils.HibernateUtil;
import com.gestionDeStock.utils.HibernateUtil2;


public class AchatsDao {
	
	
	//selectioner tous les achats
	public static Object allAchats() {
		Session session = HibernateUtil.getSession();
		if (session != null) {
			try {
				Query query = session.createQuery("from Achat ");
				
				List<Achat> achts = query.list();
				for(Achat i : achts)
				{
					i.setNomArt(ArticleDao.getArticleName(i.getCodeArt()));
				}
				return achts;
				
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
	
	
	//filtrer les achats avec code d'article ou date ou les deux
	public static Object inventaireByDateAndArticle(int art,String date) {
		Session session = HibernateUtil.getSession();
		String qr = "from Achat ";
		if(art != 0 || !date.equals(""))
		{
			if(art != 0   && !date.equals(""))
			{
				qr += "where codeArt = '"+art+"' and dateReception = '"+date+"'";
			}
			else if(!date.equals(""))
			{
				qr += "where dateReception = '"+date+"' ";
			}
			else {
				qr += "where codeArt = '"+art+"'";
			}
		}
		System.out.println(qr);
		if (session != null) {
			try {
				Query query = session.createQuery(qr);			
				List<Achat> achts = query.list();	
				for(Achat i : achts)
				{
					System.out.println(i.getCodeAchat());
					i.setNomArt(ArticleDao.getArticleName(i.getCodeArt()));
				}
				return achts;
			
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
	
	
	//ajouter un achat
		public static boolean add(Achat achat) {
			Session session = HibernateUtil.getSession();
			Transaction transaction = session.beginTransaction();
			if (session != null) {
				try {
					session.save(achat);
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

		//supprimer un achat
		public static boolean remove(Achat ach) {
			Session session = HibernateUtil.getSession();
			Transaction transaction = session.beginTransaction();
			if (session != null) {
				try {
					session.delete(ach);
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

		//modifier un achat
		public static boolean update(Achat ach) {
			Session session = HibernateUtil.getSession();
			Transaction transaction = session.beginTransaction();
			if (session != null) {
				try {
					session.update(ach);
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
