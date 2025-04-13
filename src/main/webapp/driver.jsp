<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Driver Page</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<style>

.sidenav {
  height: 100%; 
  width: 300px;
  position: fixed; 
  z-index: 1;
  top: 0;
  left: 0;
  background-color: whitesmoke; 
  overflow-x: hidden; 
  padding-top: 20px;
}
.sidenav button{
  width: 250px;
  


}


.main {
  margin-top: 75px;
  margin-right:50px;
  margin-left: 350px;
  border-radius:15px;
  background-color:lightgrey;
  padding:35px;
}
.hidden{
 display:none;

}
</style>
</head>
<body>
       
       <div class="sidenav" >
			<div style="text-align: center ;color:blue; margin-top: 15px;">
			<B><h3>DRIVER CONSOLE</h3></B>
			<div>
			DRIVER ID : <span id="driverId"> </span><br>
			DRIVER NAME : <span id="driverName"> </span>
			</div>
			</div><br><hr>
			
		
			           <div style="text-align: center;">
			              <button type="submit" class="btn btn-light" onclick="currentWork();">CURRENT WORK</button>
			           </div><br>
			           <div style="text-align: center;">
			               <button type="submit" class="btn btn-light" onclick="openWorkHistory();driverHistroyDetails()">WORK HISTORY</button>
			           </div><br>
			          
			           
			          <br>
			          <br>
			          <br>
                       <div style="text-align: center;">
			               <button type="submit" class="btn btn-danger" onclick="logout()">LOGOUT</button>
			           </div><br>
			   
	   </div>
	   
	   <div class="main" id="main">
	
	   </div>
	   
	   <div id="currentWorkForm" class="hidden">
           <div>
			     <div style="text-align: center ;color:GREEN;">
			        <B><h3>CURRENT WORK</h3></B>
			     </div><br>
			    <div>
			     <div>TRIP ID : <span id="tripId"> </span> </div><br>
			     <div>CUSTOMER NAME : <span id="customerName"> </span> </div><br>
			     <div>CUSTOMER PHONE NUMBER : <span id="customerPhoneno"> </span> </div><br>
			     <div>CUSTOMER ADDRESS : <span id="customerAddress"> </span> </div><br>
			     <div>VEHICLE ID :<span id="vehicleId"> </span> </div><br>
			     <div>VEHICLE NUMBER :<span id="vehicleNo"> </span> </div><br>
			     <div>TRIP STATUS :<span id="tripStatus"> </span> </div><br><br>
			    </div>
			    
			    <div style="text-align: center;">
					  <button type="submit" class="btn btn-primary" onclick="acceptWork()">Accept Work</button>
				</div><br>
		   </div>
    
    
      </div>
      <div id="startedWorkForm" class="hidden">
           <div>
			     <div style="text-align: center ;color:GREEN;">
			        <B><h3>CURRENT WORK</h3></B>
			     </div><br>
			    <div>
			     <div>TRIP ID : <span id="tripId"> </span> </div><br>
			     <div>CUSTOMER NAME : <span id="customerName"> </span> </div><br>
			     <div>CUSTOMER PHONE NUMBER : <span id="customerPhoneno"> </span> </div><br>
			     <div>CUSTOMER ADDRESS : <span id="customerAddress"> </span> </div><br>
			     <div>VEHICLE ID :<span id="vehicleId"> </span> </div><br>
			     <div>VEHICLE NUMBER :<span id="vehicleNo"> </span> </div><br>
			     <div>TRIP STATUS :<span id="tripStatus"> </span> </div><br><br>
			     
			    </div>
			    
				<div style="text-align: center"; id="workComplete">
				      <button type="submit" class="btn btn-primary" onclick="workCompleted()">Work Completed</button>
				</div>
		   </div>
    
    
      </div>
      
      <div id="workHistoryForm" class="hidden">
           <div>
			     <div style="text-align: center ;color:GREEN;">
			        <B><h3>WORK HISTORY</h3></B>
			     </div><br>
		
		   </div>
		   <div style="text-align: center;">
       <table id='table'class="form-table table-bordered table-striped table-hover">
            <tr>
                <th> TRIP ID</th>
                <th> CUSTOMER NAME </th>
                <th> CUSTOMER PHONE NUMBER </th>
                <th> CUSTOMER ADDRESS </th>
                <th> VEHICLE ID </th>
                <th> VEHICLE NUMBER </th>
                <th> TRIP STATUS </th>
                
            </tr>
            </table>
        </div>
    
    
      </div>
      
   
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>   
 <script>
 function currentWork(){
	 document.getElementById("main").innerHTML="";
	 let userData=JSON.parse(sessionStorage.getItem("user_data"));

	
	 document.getElementById("driverId").innerHTML=userData.userId;
	 $.post("/api/driver/driverwork?driver_Id="+userData.userId,(data,status)=>{
		 if(data.tripStatus==="pending"){
			 let currentWorkForm=document.getElementById("currentWorkForm").innerHTML;
			 let maindiv=document.getElementById("main").innerHTML=currentWorkForm;
		 }
		 else if(data.tripStatus==="work Started"){
			 let startedWorkForm=document.getElementById("startedWorkForm").innerHTML;
			 let maindiv=document.getElementById("main").innerHTML=startedWorkForm;
			 
		 }
		 else{
			 let maindiv=document.getElementById("main").innerHTML="Currently you don't have any work";
		 }
		 document.getElementById("tripId").innerHTML=data.tripId;
		 document.getElementById("customerName").innerHTML=data.customerName;
		 document.getElementById("customerPhoneno").innerHTML=data.customerPhoneNo;
		 document.getElementById("customerAddress").innerHTML=data.customerAddress;
		 document.getElementById("vehicleId").innerHTML=data.vehicleId;
		 document.getElementById("vehicleNo").innerHTML=data.vehicleNo;
		 document.getElementById("tripStatus").innerHTML=data.tripStatus;
		 })	 
 }
 
 function acceptWork(){
	 let tripId=document.getElementById("tripId").innerHTML;
	 $.post("/api/driver/workaccept?trip_Id="+tripId,(data,status)=>{
		 currentWork();
		 alert(data);
	 })
 }
 function workCompleted(){
	 let userData=JSON.parse(sessionStorage.getItem("user_data"));
	 let tripId=document.getElementById("tripId").innerHTML;
	 let vehicleId=document.getElementById("vehicleId").innerHTML;
	 let vehicleNumber=document.getElementById("vehicleNo").innerHTML;
	 $.post("/api/driver/workcomplete?trip_Id="+tripId+"&driver_Id="+userData.userId+"&vehicle_Id="+vehicleId+"&vehicle_Number="+vehicleNumber,(data,status)=>{
		 currentWork();
		 alert(data);
		 
	 })
 }
 function driverDetails(){
  let userData=JSON.parse(sessionStorage.getItem("user_data"));
  $.get("/api/driver/view?driver_Id="+userData.userId,(data,status)=>{
	  document.getElementById("driverName").innerHTML=data.driverName;
  })
 }
 
 function driverHistroyDetails(){
	 let userData=JSON.parse(sessionStorage.getItem("user_data"));
	 $.post("/api/driver/workHistory?driver_Id="+userData.userId,(data,status)=>{
		 var trip = '';
		 $.each(data, function (index, value) {
			 trip += '<tr>';
			 trip += '<td>' + 
                 value.tripId + '</td>';

                 trip += '<td>' + 
                 value.customerName + '</td>';

                 trip += '<td>' + 
                 value.customerPhoneNo + '</td>';
                 
                 trip += '<td>' + 
                 value.customerAddress + '</td>';
                 
                 trip += '<td>' + 
                 value.vehicleId+ '</td>';
                 
                 trip += '<td>' + 
                 value.vehicleNo + '</td>';
                 
                 trip += '<td>' + 
                 value.tripStatus + '</td>';

                 trip += '</tr>';
		 })
		 $('#table').append(trip);
	 })
 }
 
 
 $(document).ready(function(){
	 driverDetails()
	 currentWork();
	 
 })
  
 function openWorkHistory(){
	 let WorkHistoryForm=document.getElementById("workHistoryForm").innerHTML;
	 let maindiv=document.getElementById("main").innerHTML=WorkHistoryForm;
 }
 function logout(){
	 sessionStorage.clear();
	 window.location.href="/";
 }
 $(document).ready(function(){
	 let userData=JSON.parse(sessionStorage.getItem("user_data"));

	 if((userData===null)){
		 sessionStorage.clear();
		 window.location.href="/";
	 } else{
		 if(userData.jobRole !=="driver" || userData.authStatus!=="true" ){
			 sessionStorage.clear();
			 window.location.href=userData.forwardTo;
		 }
	 }
	 
 })
 
 </script>  
</body>
</html>