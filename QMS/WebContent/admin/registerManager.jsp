<%@include file="dheader.jsp"%>
<%@ include file="sidebar.jsp"%>
<%@page import="java.sql.*" %>
	<main class="col-md-9 ml-sm-auto col-lg-10 px-md-4 py-4">
          <h1 class="h2" style="margin-left:250px;padding-top:15px;">Manager Registration</h1>
			<form action="../RegisterManagerSer" class="form-group" method="post">
				<input type="text" name="txtname" placeholder="Enter full name..."/><br>	
				<input type="email" name="txtemail" placeholder="Enter email id..."/><br>		
				<input type="password" name="txtpass" placeholder="Enter Password..."/><br>
				<select name="dept">
					<option>select</option>
					<%
						Class.forName("com.mysql.jdbc.Driver");
	                  	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/qms","root","");
	                  	Statement stmt=conn.createStatement();
	                  	String query="select * from department";
	                  	ResultSet rs=stmt.executeQuery(query);
	                  	while(rs.next()){
                 	 %>
					<option value="<%=rs.getString("deptid")%>"><%=rs.getString("deptname")%></option>
					<%} %>
				</select><br><br>				
				<input type="submit" name="btnsubmit" value="Register"/>
			</form>		
	</main>
		
<%@include file="dfooter.jsp"%>