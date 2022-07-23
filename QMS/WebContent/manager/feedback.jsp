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
		<table  class="table table-hover">
       		<thead>
       			<tr>
       			<td>Sno.</td>
       			<td>Feedback</td>
       			<td>User</td>
       			<td>Reply</td>
       			</tr>       			
       		</thead>
       		<tbody>
       		<%
       			Class.forName("com.mysql.jdbc.Driver");
	            Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/qms","root","");
	            Statement stmt=conn.createStatement();
	            String query="select * from feedback where deptid="+session.getAttribute("dept");
	            ResultSet rs=stmt.executeQuery(query);
	            int i=1;
	            while(rs.next()){
             %>
                 <tr>
                 	 <td><%=i++%></td>
                 	 <td><%=rs.getString("feedback") %></td>
                 	 <td><%=rs.getString("custid") %></td>
                 	 <td><a href="Reply.jsp?q=<%=rs.getString("feedid")%>">Reply</a></td>
                 </tr>
             <%} %>
       		</tbody>
       </table>	  
	</main>

<%@ include file="dfooter.jsp"%>
