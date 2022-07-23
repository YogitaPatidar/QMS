<%@include file="header.jsp"%>
	<section>
	<div>
		<h2>Customer</h2>
		<div style="float:left;">
			<h2>Sign In</h2>
			<%--
			String id1,pwd1;
				Cooki
				e c[]=request.getCookies();
				for(int i=0;i<c.length;i++){
					if(c[i].getName().equals("id")){
						id1=c[i].getValue();
					}
					if(c[i].getName().equals("pwd")){
						pwd1=c[i].getValue();
					}
				}
			--%>
			<form action="CustomerLoginSer" method="post">
				<input type="email" name="txtemail1" placeholder="Enter name..."/><br>		
				<input type="password" name="txtpass1" placeholder="Enter password..."/><br>
				<input type="submit" name="btnsubmit" value="Login"/><br>
<!-- 				<input type="checkbox" name="remember" id="cb" value="true"/> -->
				
			</form>
			
			<h2><%
			if(request.getParameter("btnsubmit1")!=null){
				Cookie id=new Cookie("id",request.getParameter("txtemail1"));
				Cookie pwd=new Cookie("pwd",request.getParameter("txtpass1"));
				id.setMaxAge(260000*1000);
				pwd.setMaxAge(260000*1000);
				response.addCookie(id);
				response.addCookie(pwd);
			}
			%></h2>
		</div>
		<div style="float:right;">
			<h2>Sign Up</h2>
			<form action="CustomerRegisterationSer" method="post">
				<input type="text" name="txtname" placeholder="Enter full name..."/><br>	
				<input type="email" name="txtemail" placeholder="Enter email id..."/><br>		
				<input type="password" name="txtpass" placeholder="Enter password..."/><br>
				<input type="submit" name="btnsubmit" value="Register"/>
			</form>		
		</div>
	</div>
	</section>
		
<%@include file="footer.jsp"%>