<%@page import="java.sql.*"%>
<%@ include file="dheader.jsp"%>
<%@ include file="sidebar.jsp"%>
	 <main class="col-md-9 ml-sm-auto col-lg-10 px-md-4 py-4">
        <h1 class="h2">Customers</h1>
	     <table  class="table table-hover">
       		<thead>
       			<tr>
	       			<td>Sno.</td>
	       			<td>Userid</td>
	       			<td>Full Name</td>
	       			<td>Email</td>
       			</tr>       			
       		</thead>
       		<tbody>
       		<%
       			Class.forName("com.mysql.jdbc.Driver");
	            Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/qms","root","");
	            Statement stmt=conn.createStatement();
	            String query="select * from customer";
	            ResultSet rs=stmt.executeQuery(query);
	            int i=1;
	            while(rs.next()){
             %>
                 <tr>
                 	 <td><%=i++%></td>
                 	 <td><%=rs.getString("custid") %></td>
                 	 <td><%=rs.getString("custname") %></td>
                 	 <td><%=rs.getString("email") %></td>
                 </tr>
             <%} %>
       		</tbody>
       </table>	  
	</main>

<%@ include file="dfooter.jsp"%>