<%@page import="java.sql.*"%>
<%@ include file="dheader.jsp"%>
<%@ include file="sidebar.jsp"%>
	 <main class="col-md-9 ml-sm-auto col-lg-10 px-md-4 py-4">
        <h1 class="h2">Managers</h1>
	     <table  class="table table-hover">
       		<thead>
       			<tr>
	       			<td>Sno.</td>
	       			<td>Userid</td>
	       			<td>Full Name</td>
	       			<td>Email</td>
	       			<td>Department</td>
       			</tr>       			
       		</thead>
       		<tbody>
       		<%
       			Class.forName("com.mysql.jdbc.Driver");
	            Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/qms","root","");
	            Statement stmt=conn.createStatement();
	            String query="select * from manager inner join department on manager.dept=department.deptid";
	            ResultSet rs=stmt.executeQuery(query);
	            int i=1;
	            while(rs.next()){
             %>
                 <tr>
                 	 <td><%=i++%></td>
                 	 <td><%=rs.getString("mid") %></td>
                 	 <td><%=rs.getString("mname") %></td>
                 	 <td><%=rs.getString("email") %></td>
                 	 <td><%=rs.getString("deptname") %></td>
                 </tr>
             <%} %>
       		</tbody>
       </table>	  
	</main>

<%@ include file="dfooter.jsp"%>