<%@ page import="java.sql.*"%>
<%@ include file="dheader.jsp"%>
<%@ include file="sidebar.jsp"%>
	<main class="col-md-9 ml-sm-auto col-lg-10 px-md-4 py-4">
	   <h1 class="h2">History</h1>	
	   <table class="table table-hover">
	   		<thead>
	   			<tr>
	   				<td>Sno.</td><td>Feedback</td><td>Department</td><td>Time</td><td>Reply</td>
	   			</tr>
	   		</thead>
	   		<tbody>
			<%
				Class.forName("com.mysql.jdbc.Driver");
	            Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/qms","root","");
	            Statement stmt=conn.createStatement();
	            String query="select * from feedback inner join department on feedback.deptid= department.deptid where feedback.custid="+session.getAttribute("custid");
	            ResultSet rs=stmt.executeQuery(query);
	            int i=1;
	            while(rs.next()){
                 	 %>
                 	 <tr>
                 	 	<td><%=i++%></td>
                 	 	<td><%=rs.getString("feedback")%></td>
                 	 	<td><%=rs.getString("deptname")%></td>
                 	 	<td><%=rs.getString("datetime")%></td>
                 	 	<td><a href="reply.jsp?q=<%=rs.getString("feedid")%>">reply</a></td>
                 	 </tr>
					<%} %> 
			</tbody>
		</table>        
	</main>
<%@ include file="dfooter.jsp"%>
	