package com.gestionDeStock.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.gestionDeStock.beans.Admin;
import com.gestionDeStock.utils.HibernateUtil;

public class LoginDao {
	public static boolean login(String username,String password) {
		Session session = HibernateUtil.getSession();
		if (session != null) {
			try {
				Query query =  session.createQuery("from Admin where username= :username");
				query.setParameter("username", username);		
				Admin admin= (Admin) query.list().get(0);
			    if (password.equals(admin.getPassword())) {
			     System.out.println("User: " + admin.toString());
			     return true;
			    }
				
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
