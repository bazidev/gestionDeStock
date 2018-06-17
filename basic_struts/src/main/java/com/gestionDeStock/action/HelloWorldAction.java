package com.gestionDeStock.action;

import com.gestionDeStock.model.MessageStore;
import com.opensymphony.xwork2.ActionSupport;

public class HelloWorldAction extends ActionSupport {
 
    private static final long serialVersionUID = 1L;
    private static int helloCount = 0;
    private String userName;
 
    private MessageStore messageStore;
     

    public String execute() throws Exception {
         
        messageStore = new MessageStore() ;
        System.out.println("hello count is " + helloCount++);
        return SUCCESS;
    }
 
    public MessageStore getMessageStore() {
        return messageStore;
    }
 
    public void setMessageStore(MessageStore messageStore) {
        this.messageStore = messageStore;
    }

	public static int getHelloCount() {
		return helloCount;
	}

	public static void setHelloCount(int helloCount) {
		HelloWorldAction.helloCount = helloCount;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
}
