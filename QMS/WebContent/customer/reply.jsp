<%@ page import="java.sql.*"%>
<%@ include file="dheader.jsp"%>
<%@ include file="sidebar.jsp"%>
	<main class="col-md-9 ml-sm-auto col-lg-10 px-md-4 py-4">
	   <h1 class="h2">Reply</h1>	
	   <form action="../ReplySer" method="post" class="form-group">		
		<textarea name="txtreply" class="form-control z-depth-1"  rows="5" cols="100">Reply...</textarea><br>
		<input type="hidden" name="feedid" value="<%=request.getParameter("q") %>"/>
		<input type="hidden" name="userid" value="<%=session.getAttribute("custid")%>"/>
		<input type="submit" name="feedbtn" value="Submit" class="form-control"/><br><br>
	</form>		 
	<table class="table table-hover">
	   		<thead>
	   			<tr>
	   				<td>Sno.</td><td>Feedback</td><td>Department</td><td>Time</td><td>Reply</td>
	   			</tr>
	   		</thead>
	   		<tbody>
			<%
				int feedid=Integer.parseInt(request.getParameter("q"));
				Class.forName("com.mysql.jdbc.Driver");
	            Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/qms","root","");
	            Statement stmt=conn.createStatement();
	            String query="select * from reply inner join feedback on reply.feedid= feedback.feedid inner join department on feedback.deptid=department.deptid where feedback.custid="+session.getAttribute("custid")+"and feedback.feedid="+request.getParameter("q");
	            ResultSet rs=stmt.executeQuery("select * from reply inner join feedback on reply.feedid= feedback.feedid inner join department on feedback.deptid=department.deptid where feedback.custid='"+session.getAttribute("custid")+"' and feedback.feedid='"+request.getParameter("q")+"'");
	            int i=1;
	            while(rs.next()){
                 	 %>
                 	 <tr>                 	 	
	                 	 <td><%=i++%></td>
	                 	 <td><%=rs.getString("replyby") %></td>
	                 	 <td><%=rs.getString("reply") %></td>
	                 	 <td><a href="reply.jsp?q=<%=rs.getInt("feedid")%>" class="btn btn-sm btn-primary">reply</a></td>
                 	 </tr>
					<%} %> 
			</tbody>
		</table>        
	</main>
<%@ include file="dfooter.jsp"%>
	