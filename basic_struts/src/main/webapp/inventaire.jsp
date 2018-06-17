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
					<li class="active"><a href="#">Inventaire <span
							class="sr-only">(current)</span></a></li>
					<li><a href="achats.jsp">Achats</a></li>
					<li><a href="#">Article</a></li>
				</ul>
			</div>

		</div>
		</nav>


		<div class="col col-lg-11" style="margin: auto; float: none">
			<div class="row" style="margin: 30px">
				<s:form action='filter-inventaire' style="margin-top:40px;">
			
				<div class="col-lg-6">
					<div class="input-group">
						<span class="input-group-btn">
							<button class="btn btn-default">#</button>
						</span> <select name="article" class="selectpicker" title="article .. "
							data-live-search="true">
							<s:iterator value="inventairesAll" status="inventairesStatus">
								<option  value="<s:property value="codeArt" />"><s:property value="nomArt" /></option>
							</s:iterator>
						</select>
					</div>
					<!-- /input-group -->
				</div>
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
						<th scope="col">code d'inventaire</th>
						<th scope="col">nom d'article</th>
						<th scope="col">quantite</th>
						<th scope="col">description</th>
						<th scope="col">date</th>
					</tr>
				</thead>
				<tbody>
					<s:iterator value="inventaires" status="inventairesStatus">
						<tr>
							<th scope="row"><s:property value="codeInv" /></th>
							<td><s:property value="nomArt" /></td>
							<td><s:property value="qteArt" /></td>
							<td><s:property value="descInv" /></td>
							<td><s:property value="dateInv" /></td>
						</tr>
					</s:iterator>
				</tbody>
			</table>
		</div>
	</div>


</body>
</html>