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
					<li class="active"><a
						href="<s:url action="filter-inventaire"/>">Inventaire <span
							class="sr-only">(current)</span></a></li>
					<li><a href="<s:url action="filter-achats"/>">Achats</a></li>
					<li><a href="<s:url action="filter-articles"/>">Article</a></li>
				</ul>
				    <ul class="nav navbar-nav navbar-right">
  					   <li><a href="/index.jsp">deconnecter</a></li>
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
								<s:iterator value="articleAll" status="articleStatus">
									<option value="<s:property value="codeart" />"><s:property
											value="nomart" /></option>
								</s:iterator>
							</select>
						</div>
						<!-- /input-group -->
					</div>
					<!-- /.col-lg-6 -->
					<div class="col-lg-6">
						<div class="input-group">
							<input default="0" name="date" class="form-control" type="date">
							<span class="input-group-btn"> <s:submit cssClass="btn"
									value="chercher" />
							</span>
						</div>
						<!-- /input-group -->
					</div>
				</s:form>
				<!-- /.col-lg-6 -->
			</div>
			<!-- /.row -->

<s:if test="hasActionMessages()">
   <div class="welcome">
      <s:actionmessage/>
   </div>
</s:if>

			<table class=" table table-striped">
				<thead>
					<tr>
						<td colspan="1" style="text-align: left;"><input
							data-toggle="modal" data-target="#addModal" type="button"
							class="btn  btn-block " id="addInventaire"
							value="Ajouter Inventaire" /></td>
					</tr>
					<tr>
						<th scope="col">code d'inventaire</th>
						<th scope="col">code d'article</th>
						<th scope="col">nom d'article</th>
						<th scope="col">quantite</th>
						<th scope="col">description</th>
						<th scope="col">date</th>
						<th scope="col">modifier</th>
						<th scope="col">#</th>
					</tr>
				</thead>
				<tbody>
					<s:iterator value="inventaires" status="inventairesStatus">
						<tr>
							<th scope="row"><s:property value="codeInv" /></th>

							<td id="codeArt"><s:property value="codeArt" /></td>
							<td id="nomArt"><s:property value="nomArt" /></td>
							<td id="qteArt"><s:property value="qteArt" /></td>
							<td id="descInv"><s:property value="descInv" /></td>
							<td id="dateInv"><s:date name="dateInv" format="MM/dd/yyyy" /></td>
							<td><input data-toggle="modal" data-target="#editModal"
								type="button" class=" editInv btn  btn-block " value="modifier" /></td>
							<td>
								<button type="button" class="conf-sup btn btn-dark"
									data-toggle="modal" data-target="#confirmModal">
									<span class="glyphicon glyphicon-trash"></span>
								</button>
							</td>
						</tr>
					</s:iterator>
				</tbody>
			</table>

			<!-- modals -->
			<!-- Modal -->
			<div class="modal fade" id="addModal" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">

					<s:form action='ajouter-inventaire' style="margin-top:40px;">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">ajouter
									inventaire</h5>
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
								</select> <br />
								<s:textfield id="quantite" placeholder="quantite" type="number"
									name="quantity" min="0" step="1" />
								<input default="0" name="date" class="form-control" type="date" />
								<br />
								<s:textarea id="description" name="description" cols="2"
									placeholder="description">
								</s:textarea>
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


			<!-- modifier modal -->
			<div class="modal fade" id="editModal" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<s:form action='modifier-inventaire' style="margin-top:40px;">

						<s:hidden name="inventaire" id="inv-id" />
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">modifier
									inventaire</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">

								<select id="articlePicker" name="article" class="selectpicker"
									title="article .. " data-live-search="true">
									<s:iterator value="articleAll" status="articleStatus">
										<option value="<s:property value="codeart" />"><s:property
												value="nomart" /></option>
									</s:iterator>
								</select> <br />
								<s:textfield id="quantite" placeholder="quantite" type="number"
									name="quantity" min="0" step="1" />
								<input id="date" default="0" name="date" class="form-control"
									type="date" /> <br />
								<s:textarea id="description" name="description" cols="2"
									placeholder="description">
								</s:textarea>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">fermer</button>
								<s:submit value="modifier" cssClass="btn btn-primary" />


							</div>
						</div>
					</s:form>
				</div>
			</div>
			
			
			
			<!-- confirme suppression modal -->
			<div class="modal fade" id="confirmModal" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<s:form action='supprimer-inventaire' style="margin-top:40px;">

						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Confirmation !</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
									<p>Etes-vous sur de vouloir supprimer 
									<s:hidden name="inventaire" id="inv-id" />
									?</p>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">non</button>
									<s:property value="inventaire" />
								<s:submit value="oui" cssClass="btn btn-primary" />


							</div>
						</div>
					</s:form>
				</div>
			</div>


		</div>
	</div>


</body>
</html>