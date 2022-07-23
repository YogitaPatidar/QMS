<%@include file="../header.jsp"%>
	<section>
	<div>
		<h2>Admin</h2>
		<div>
			<center><h2>Sign In</h2></center>
			<form action="AdminLoginSer" method="post" style="margin-left: 550px;margin-right: 550px; width:700px;">
				<input type="email" name="txtemail1" placeholder="Enter email..."/><br>		
				<input type="password" name="txtpass1" placeholder="Enter password..."/><br>
				<input type="checkbox" name="remember" id="cb" value="true"/><br>	
				<input type="submit" name="btnsubmit" value="Login"/><br>											
			</form>			
		</div>		
	</div>
	</section>		
<%@include file="../footer.jsp"%>