 <%@page import="java.sql.*" %>
 
 <table  class="table table-hover">
       		<thead>
       			<tr>
       			<td>Sno.</td>
       			<td>Feedback</td>
       			<td>User</td>
       			<td>Department</td>
       			<td>Reply</td>
       			</tr>       			
       		</thead>
       		<tbody>
       		<%
       			Class.forName("com.mysql.jdbc.Driver");
	            Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/qms","root","");
	            Statement stmt=conn.createStatement();
	            String query="select * from feedback inner join department on feedback.deptid=department.deptid where feedback.deptid='"+request.getParameter("q")+"'";
	            ResultSet rs=stmt.executeQuery(query);
	            int j=1;
	            while(rs.next()){
             %>
                 <tr>
                 	 <td><%=j++%></td>
                 	 <td><%=rs.getString("feedback") %></td>
                 	 <td><%=rs.getString("custid") %></td>
                 	 <td><%=rs.getString("deptname") %></td>
                 	 <td><a href="Reply.jsp?q=<%=rs.getString("feedid")%>" class="btn btn-sm btn-primary">View reply</a></td>
                 </tr>
             <%} %>
       		</tbody>
       </table>