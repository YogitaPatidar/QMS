<%@ page import="java.sql.*"%>
<%@ include file="dheader.jsp"%>
<%@ include file="sidebar.jsp"%>
	 <main class="col-md-9 ml-sm-auto col-lg-10 px-md-4 py-4">
           <h1 class="h2">Profile</h1>
      <div>
		<div class="card" style="float:left;">
			  <img class="pimg" src="../assets/images/img12.jpg" alt="John">
			  <h1><%=session.getAttribute("mname")%></h1>
			  <p class="title">Manager</p>
			  <p><%=session.getAttribute("mname") %></p>
			  <div style="margin: 24px 0;">
			   	<a href="#"><i class="fa fa-dribbble"></i></a> 
			    <a href="#"><i class="fa fa-twitter"></i></a>  
			    <a href="#"><i class="fa fa-linkedin"></i></a>  
			    <a href="#"><i class="fa fa-facebook"></i></a> 
			  </div>
  			<p><button>Edit</button></p>
		</div>
		<div style="float:right; position:relative;">
			<h3><%=session.getAttribute("mname")%></h1>
			  <p>Manager</p><br>
			  <p><%=session.getAttribute("deptname")%></p>
		</div>
		</div>
      </main>
  </div>
</div>  

<%@ include file="dfooter.jsp"%>
  