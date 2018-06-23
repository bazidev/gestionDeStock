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
					<li class="active"><a href="<s:url action="filter-achats"/>">Achats <span
							class="sr-only">(current)</span></a></li>
					<li><a href="<s:url action="filter-articles"/>">Article</a></li>
				</ul>
			</div>

		</div>
		</nav>


		<div class="col col-lg-11" style="margin: auto; float: none">
			<div class="row" style="margin: 30px">
				<s:form action='filter-achats' style="margin-top:40px;">
			
				<div class="col-lg-6">
					<div class="input-group">
						<span class="input-group-btn">
							<button class="btn btn-default">#</button>
						</span> <select name="article" class="selectpicker" title="article .. "
							data-live-search="true">
							<s:iterator value="achatsAll" status="achatsStatus">
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
						<td colspan="1" style="text-align: left;"><input
							data-toggle="modal" data-target="#addModal" type="button"
							 class="btn  btn-block " id="addAchat"
							value="Ajouter Achat" /></td>
					</tr>
					<tr>
						<th scope="col">code d'achat</th>
						<th scope="col">nom d'article</th>
						<th scope="col">quantite achete</th>
						<th scope="col">date de reception</th>
					</tr>
				</thead>
				<tbody>
					<s:iterator value="achats" status="achatsStatus">
						<tr>
							<th scope="row"><s:property value="codeAchat" /></th>
							<td><s:property value="nomArt" /></td>
							<td><s:property value="qteAchete" /></td>
							<td><s:property value="dateReception" /></td>
						</tr>
					</s:iterator>
				</tbody>
			</table>
		</div>
		
		
		<!-- modals -->
			<!-- Modal -->
			<div class="modal fade" id="addModal" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
				
				<s:form action='ajouter-achat' style="margin-top:40px;">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">ajouter achat</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
					<select name="article" class="selectpicker" title="article .. "
							data-live-search="true">
								<s:iterator value="articleAll" status="articleStatus">
										<option value="<s:property value="codeart" />"><s:property
												value="nomart" /></option>
									</s:iterator>
						</select>
							<br />
						<s:textfield placeholder="quantite" type="number" name="quantity" min="0" step="1"/>
						<input default="0" name="date" class="form-control" type="date" />
						<br />
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">fermer</button>
						  <s:submit value="ajouter" cssClass="btn btn-primary" />
				
						
						</div>
					</div>
					</s:form>
				</div>
			</div>
		
	</div>


</body>
</html>