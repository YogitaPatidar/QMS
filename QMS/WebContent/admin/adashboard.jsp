<%@ page import="java.sql.*"%>
<%@ include file="dheader.jsp"%>
<%@ include file="sidebar.jsp"%>
	 <main class="col-md-9 ml-sm-auto col-lg-10 px-md-4 py-4">
          <h1 class="h2">Dashboard</h1>
          <nav aria-label="breadcrumb">
  			<ol class="breadcrumb">
    			<li class="breadcrumb-item"><a href="adashboard.jsp">Home</a></li>
    			<li class="breadcrumb-item active" aria-current="page">Overview</li>
  			</ol>
		  </nav>
  		<div class="row">
	  <div class="col-12 col-xl-8 mb-4 mb-lg-0">
	      <div class="card">
	          <h5 class="card-header">Recent Feedbacks</h5>
	          <div class="card-body">
	              <div class="table-responsive">
	                  <table class="table">
	                      <thead>
	                        <tr>
	                          <th scope="col">Feedback Id</th>
	                          <th scope="col">Feedback</th>
	                          <th scope="col">Customer Id</th>
	                          <th scope="col">Department Id</th>
	                          <th scope="col">Time</th>
	                          <th scope="col"></th>
	                        </tr>
	                      </thead>
	                      <tbody>
	                      <%
	                      	Class.forName("com.mysql.jdbc.Driver");
	                      	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/qms","root","");
	                      	Statement stmt=conn.createStatement();
	                      	String query0="select * from feedback limit 0,5";
	                      	ResultSet rs=stmt.executeQuery(query0);
	                      	ResultSetMetaData rm=rs.getMetaData();
	                      	while(rs.next()){
	                      %>
	                        <tr>
	                          <th scope="row"><%=rs.getString("feedid") %></th>
	                          <td><%=rs.getString("feedback") %></td>
	                          <td><%=rs.getString("custid") %></td>
	                          <td><%=rs.getString("deptid") %></td>
	                          <td><%=rs.getString("datetime") %></td>
	                          <td><a href="Reply.jsp?q=<%=rs.getInt("feedid")%>" class="btn btn-sm btn-primary">View</a></td>
	                        </tr>
	                        <%} %>
	                      </tbody>
	                    </table>
	              </div>
	                <a href="Allfeedback.jsp" class="btn btn-block btn-light">View all</a>
	          </div>
	      </div>
	  </div>
	  <div class="col-12 col-xl-4">
	      <!-- Another widget will go here -->
	  </div>
</div>
  
      </main>
  </div>
</div>  

<%@ include file="dfooter.jsp"%>
