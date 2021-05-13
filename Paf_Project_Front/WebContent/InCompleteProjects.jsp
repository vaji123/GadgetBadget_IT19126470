<%@page import="model.InCompleteProject"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Items Management</title>
<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Components/jquery-3.2.1.min.js"></script>
<script src="Components/Incomplete_projects.js"></script>
</head>
<body> 
<div class="container"><div class="row"><div class="col-6"> 
<h1>Add Complete Projects</h1>
<form id="formItem" name="formItem">
 RID: 
 <input id="rid" name="rid" type="text" class="form-control form-control-sm">
 <br> Project Code: 
 <input id="proj_code" name="proj_code" type="text" class="form-control form-control-sm">
 <br> Project Name: 
 <input id="proj_name" name="proj_name" type="text" class="form-control form-control-sm">
 <br> Project Description: 
 <input id="proj_desc" name="proj_desc" type="text" class="form-control form-control-sm">
 <br> Skills Required: 
 <input id="skills_required" name="skills_required" type="text" class="form-control form-control-sm">
 <br> Estimate Budget: 
 <input id="estimate_fund" name="estimate_fund" type="text" class="form-control form-control-sm">
 <br> No of funds made: 
 <input id="no_of_funds_made" name="no_of_funds_made" type="text" class="form-control form-control-sm">
  <br> Amount to fund: 
 <input id="Amount_to_fund" name="Amount_to_fund" type="text" class="form-control form-control-sm">
 <br>
 
 <input id="btnSave" name="btnSave" type="button" value="Save" class="btn btn-primary">
 <input type="hidden" id="hidItemIDSave" name="hidItemIDSave" value="">
</form>
<div id="alertSuccess" class="alert alert-success"></div>
<div id="alertError" class="alert alert-danger"></div>
<br>
	<div id="divItemsGrid">
 		<%
 			InCompleteProject project = new InCompleteProject(); 
 			out.print(project.readInnovativeProjects()); 
 		%>
</div>
</div> </div> </div> 
</body>
</html>