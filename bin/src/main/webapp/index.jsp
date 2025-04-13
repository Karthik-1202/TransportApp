<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<style type="text/css">
body{

background-image: url("Transport.png");
}
.login_container{
padding: 25px;
margin-top: 16vh;
background-color: lightgrey;
border-radius: 20px;
}
</style>
</head>
<body>
<div
  style="background-image: url('Transport.png'); background-repeat:no-repeat;"
></div>
<br>
<br>
<h2 style="text-align: center;">Transport Availability Checking System</h2>
	<div class="row">
		<div class="col-md-4"></div>
		<div class="col-md-4">
			<div class="login_container">
			<h3 style="text-align: center;">Login</h3>
			<div>
  <div class="mb-3">
    <label for="user id" class="form-label">User ID</label>
    <input type="email" class="form-control" id="user_id">
  </div>
  <div class="mb-3">
    <label for="user_password" class="form-label">Password</label>
    <input type="password" class="form-control" id="user_password">
  </div>
  <div style="text-align: center;">
 
  <button type="submit" class="btn btn-primary" onclick="login()">Submit</button>
  </div>
</div>
			</div>
		</div>
		<div class="col"></div>
	
	
	</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
<script >
     function login(){
    	 let userId=document.getElementById("user_id").value
    	 let password=document.getElementById("user_password").value
    	 if(userId==""){
    		 alert("enter your userId");
    	 }
    	 else if(password=="")
    		 {
    		 alert("enter your password");
    		 }
    	 else{
    	 //contact Login
    	 $.post("/api/login?user_id="+userId+"&password="+password,(data,status)=>{
    		 if(data.authStatus==="true"){
    			 sessionStorage.setItem("user_data",JSON.stringify(data));
    			 window.location.href=data.forwardTo;
    		 }
    		 else{
    			 alert("wrong credentials....");
    		 }
    	 })
    	 }
     }
</script>
</body>
</html>