<%@include file="header.jsp"%>
	<section>
	<div>
		<h2>Manager</h2>
		<div>
			<h2 style="text-align:center">Sign In</h2>
			
			<form action="ManagerLoginSer" method="post" style="margin-left: 550px;margin-right: 550px; width:700px;">
				<input type="email" name="txtemail1" placeholder="Enter email..."/><br>		
				<input type="password" name="txtpass1" placeholder="Enter password..."/><br>
				<input type="submit" name="btnsubmit" value="Login"/><br>
				<input type="checkbox" name="remember" id="cb" value="true"/>				
			</form>
			
		</div>
		
	</div>
	</section>
		
<%@include file="footer.jsp"%>