<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manager Dashboard</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css" integrity="sha384-r4NyP46KrjDleawBgD5tp8Y7UzmLA05oM1iAEQ17CSuDqnUK2+k9luXQOfXJCJ4I" crossorigin="anonymous">
<link href="style.css" type="text/css" rel="stylesheet" />
	
</head>

<body>
<%
	if(session.getAttribute("mid")==null){
		response.sendRedirect("../ManagerLogin.jsp");
	}
%>
	<nav class="position-sticky navbar navbar-light bg-light p-3">
	
  		<div class="d-flex col-12 col-md-3 col-lg-2 mb-2 mb-lg-0 flex-wrap flex-md-nowrap justify-content-between">
      		<a class="navbar-brand" href="mdashboard.jsp">Dashboard</a>
      		<button class="navbar-toggler d-md-none collapsed mb-3" type="button" data-toggle="collapse" data-target="#sidebar" aria-controls="sidebar" aria-expanded="false" aria-label="Toggle navigation">
          		<span class="navbar-toggler-icon"></span>
     		 </button>
  		</div>
  		
  		<div class="col-12 col-md-4 col-lg-2">
      		<input class="form-control form-control-dark" type="text" placeholder="Search" aria-label="Search">
 		 </div>
 		 
  		<div class="col-12 col-md-5 col-lg-8 d-flex align-items-center justify-content-md-end mt-3 mt-md-0">
      		
      		<div class="mr-3 mt-1">
         		 <a class="github-button" href="https://github.com/themesberg/simple-bootstrap-5-dashboard" data-color-scheme="no-preference: dark; light: light; dark: light;" data-icon="octicon-star" data-size="large" data-show-count="true" aria-label="Star /themesberg/simple-bootstrap-5-dashboard">Star</a>
      		</div>
      		<div class="dropdown">
          		<button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-expanded="false">
           			 Hello, <%= session.getAttribute("mname") %>
           		</button>
          		<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
            		<li><a class="dropdown-item" href="#">Settings</a></li>
            		<li><a class="dropdown-item" href="#">View Profile</a></li>
            		<li><a class="dropdown-item" href="../ManagerLogoutSer">Sign out</a></li>
         		 </ul>
        	</div>        	
  		</div>  
  
	</nav>
	