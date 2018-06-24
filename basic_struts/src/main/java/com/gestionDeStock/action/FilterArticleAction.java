package com.gestionDeStock.action;

import java.util.List;

import com.gestionDeStock.beans.Article;
import com.gestionDeStock.beans.Inventaire;
import com.gestionDeStock.dao.ArticleDao;
import com.gestionDeStock.dao.InventaireDao;
import com.opensymphony.xwork2.ActionSupport;


//action pour filtrer et afficher les article
public class FilterArticleAction extends ActionSupport{

    private static final long serialVersionUID = 1L;
    private String date = "";
    private List<Article> articles ;
     
	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String execute() throws Exception {
	        System.out.println(date);
	        setArticles((List<Article>) ArticleDao.articleByDate(date));
	        return SUCCESS;
	   }

	public List<Article> getArticles() {
		return articles;
	}

	public void setArticles(List<Article> articles) {
		this.articles = articles;
	}



}
