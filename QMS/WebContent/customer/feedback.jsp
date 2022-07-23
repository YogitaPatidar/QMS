<%@ page import="java.sql.*"%>
<%@ include file="dheader.jsp"%>
<%@ include file="sidebar.jsp"%>
<script type="text/javascript">
$(document).ready(function() {
	$('.mdb-select').materialSelect();
	});
</script>

	<main class="col-md-9 ml-sm-auto col-lg-10 px-md-4 py-4">
	   <h1 class="h2">Feedback</h1>	          
	 
	<form action="../FeedbackSer" method="post" class="form-group">		
		<textarea name="txtfeedback" class="form-control z-depth-1"  rows="8" cols="100">Feedback...</textarea><br>
		<input list="deptname" id="dept" name="dept" placeholder="select department..." />
			<datalist id="deptname">
 				<option value="" disabled selected>select department</option>
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
			</datalist>
		<input type="submit" name="feedbtn" value="Submit" class="form-control"/>
	</form>	
	</main>

<%@ include file="dfooter.jsp"%>