<%@page import="java.sql.*"%>
<%@ include file="dheader.jsp"%>
<%@ include file="sidebar.jsp"%>
<script>
function showdata(a)
{
	xmlhttp = new XMLHttpRequest();
	xmlhttp.onreadystatechange=function()
	{
		document.getElementById("res").innerHTML = xmlhttp.responseText;
	}
	xmlhttp.open("POST","FeedbackByDept.jsp?q="+a,true);
	xmlhttp.send();
}
</script>
	 <main class="col-md-9 ml-sm-auto col-lg-10 px-md-4 py-4">
        <h1 class="h2">All Feedback</h1>
        	<input list="deptname" id="dept" name="dept" placeholder="select department..." onchange="showdata(this.value)" />
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
	<div id="res">
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
//        		Class.forName("com.mysql.jdbc.Driver");
// 	            Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/qms","root","");
// 	            Statement stmt2=conn.createStatement();
	            String query2="select * from feedback inner join department on feedback.deptid=department.deptid";
	            ResultSet rs1=stmt.executeQuery(query2);
	            int j=1;
	            while(rs1.next()){
             %>
                 <tr>
                 	 <td><%=j++%></td>
                 	 <td><%=rs1.getString("feedback") %></td>
                 	 <td><%=rs1.getString("custid") %></td>
                 	 <td><%=rs1.getString("deptname") %></td>
                 	 <td><a href="Reply.jsp?q=<%=rs1.getString("feedid")%>" class="btn btn-sm btn-primary">View reply</a></td>
                 </tr>
             <%} %>
       		</tbody>
       </table>
     </div>
	</main>

<%@ include file="dfooter.jsp"%>