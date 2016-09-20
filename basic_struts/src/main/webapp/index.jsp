<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Basic Struts 2 Application - Welcome</title>
</head>
<body>
	<h1>Welcome To Struts 2!</h1>
	<p>
		<s:url action='hello' var="helloLink">
			<s:param name="userName">Random Message</s:param>
		</s:url>
		<a href="${helloLink}">Hello with random name</a>
	</p>
	
	<p>Get your own personal hello by filling out and submiting this form</p>
	<s:form action='hello'>
		<s:textfield name="userName" label="Your name"/>
		<s:submit values="Submit"/>
	</s:form>
</body>
</html>
