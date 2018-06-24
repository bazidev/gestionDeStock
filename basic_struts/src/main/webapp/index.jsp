<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><script type="text/javascript" src="/bootstrap/js/jquery.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>gestion de stock</title>
<link type="text/css"  rel="stylesheet" href="/css/style.css"/>
<sb:head />
</head>
<body>
	<div class="container-fluid ">
		<nav class="navbar navbar-default">
		  <div class="container-fluid">
		    <div class="navbar-header">
		      <a class="navbar-brand" href="#">
		      </a>
		     <p class="navbar-text"><b>gestion de stock</b></p>
		    </div>
		  </div>
		</nav>
		<div class="row  justify-content-md-center">

			<div class="col col-lg-5" style="margin: auto; float: none;">
				<s:if test="hasActionErrors()">
					<div class="errors">
						<s:actionerror />
					</div>
				</s:if>
				<s:form action='login' style="margin-top:40px;">
					<s:textfield name="userName" label="Nom d'etulisateur" />
					<s:password name="password" label="mot de pass" />
					<s:submit values="login" cssClass="btn" />
				</s:form>
			</div>
		</div>
	</div>
</body>
</html>



