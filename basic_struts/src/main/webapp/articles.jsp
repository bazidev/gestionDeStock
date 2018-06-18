<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="/bootstrap/js/jquery.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Hello World!</title>
<link type="text/css" rel="stylesheet" href="/css/style.css" />

<script type="text/javascript" src="/bootstrap/js/jquery.min.js"></script>

<script type="text/javascript" src="/js/index.js"></script>
<!-- Latest compiled and minified JavaScript -->

<sb:head />

<link rel="stylesheet"
	href="/bootstrap-select/css/bootstrap-select.min.css">

<script type="text/javascript"
	src="/bootstrap-select/js/bootstrap-select.min.js"></script>
</head>

<body>
	<div class="container-fluid ">
		<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#"> </a>
				<p class="navbar-text">
					<b>gestion de stock</b>
				</p>
			</div>
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li ><a href="<s:url action="filter-inventaire"/>">Inventaire </a></li>
					<li><a href="<s:url action="filter-achats"/>">Achats</a></li>
					<li  class="active"><a href="<s:url action="filter-articles"/>">Article <span
							class="sr-only">(current)</span></a></li>
				</ul>
			</div>

		</div>
		</nav>


		<div class="col col-lg-11" style="margin: auto; float: none">
			<div class="row" style="margin: 30px">
				<s:form action='filter-articles' style="margin-top:40px;">
		
				<!-- /.col-lg-6 -->
				<div class="col-lg-6">
					<div class="input-group">
						<input default="0" name="date" class="form-control" type="date"> <span
							class="input-group-btn">
							<s:submit   cssClass="btn" value="chercher" />
						</span>
					</div>
					<!-- /input-group -->
				</div>
				</s:form>
				<!-- /.col-lg-6 -->
			</div>
			<!-- /.row -->



			<table class=" table table-striped">
				<thead>
					<tr>
						<th scope="col">code d'article</th>
						<th scope="col">nom d'article</th>
						<th scope="col">prix</th>
						<th scope="col">quantite</th>
					</tr>
				</thead>
				<tbody>
					<s:iterator value="articles" status="achatsStatus">
						<tr>
							<th scope="row"><s:property value="codeart" /></th>
							<td><s:property value="nomart" /></td>
							<td><s:property value="prixart" /></td>
							<td><s:property value="Quantite" /></td>
						</tr>
					</s:iterator>
				</tbody>
			</table>
		</div>
	</div>


</body>
</html>