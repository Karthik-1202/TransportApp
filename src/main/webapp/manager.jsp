<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Manager Page</title>
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
 <script>
 /*if(!(JSON.parse(sessionStorage.getItem("user_data")))){
	 sessionStorage.clear();
	 window.location.href="/";
 }*/
 </script>

			<div class="sidenav" >
			<div style="text-align: center ;color:blue; margin-top: 15px;"><B>
			<h3>MANAGER CONSOLE</h3></B>
			</div><br><hr>
		
			 <div style="text-align: center;">
			    <button type="submit" class="btn btn-light" onclick="openWorkAllocation()">Work Allocation</button>
			          </div><br>
			           <div style="text-align: center;">
			    <button type="submit" class="btn btn-light" onclick="openWorkHistory();tripHistroyDetails()">Work History</button>
			          </div><br>
			          
			           
			          <br>
			          <br>
			          <br>
			
			
               <div style="text-align: center;">
			    <button type="submit" class="btn btn-danger" onclick="logout()">LOGOUT</button>
			          </div><br>
			   
			</div>

			<!-- Page content -->
			<div class="main" id="main">
	
			</div>
			
			
			
     <div id="workAllocationForm" class="hidden">
        <div>
	  <div style="text-align: center ;color:GREEN;"><B>
		<h3>WORK ALLOCATION</h3></B>
		</div><br>
		   <div>
		         <div class="mb-3">
		    <label for="customer_name" class="form-label">Customer Name</label>
		    <input type="text" class="form-control" id="customer_name">
		          </div>
		          
		          <div class="mb-3">
		    <label for="customer_phone" class="form-label">Customer Phone</label>
		    <input type="text" class="form-control" id="customer_phone">
		          </div>
		          
		          <div class="mb-3">
		    <label for="customer_address" class="form-label">Customer Address</label>
		    <input type="text" class="form-control" id="customer_address">
		          </div>
		          
		          <div class="mb-3">
		    <label for="vehicle_type" class="form-label">Vehicle Type</label>
		       <select class="form-select"  id="vehicle_type" onchange="selectedVehicleType()">
			  <option selected>select vehicle type</option>
			  <option value="lorry">Lorry</option>
			  <option value="trailer">Trailer</option>
			  <option value="truck">Truck</option>
			   </select>
		          </div>
		          
		          <div class="mb-3">
		    <label for="available_vehicle" class="form-label">Available Vehicle</label>
		       <select class="form-select"  id="available_vehicle">
			  
			   </select>
		          </div>
		          
		           <div class="mb-3">
		    <label for="availabe_driver" class="form-label">Available Driver</label>
		       <select class="form-select"  id="availabe_driver">
		       
			   </select>
		          </div>
		          
		          
		         		   
		          <div style="text-align: center;">
		    <button type="submit" class="btn btn-danger" onclick="workAllocation()">Allocate Work</button>
		          </div>
		 </div>
		 </div>
    
    
    </div>
    <div id="workHistoryForm" class="hidden">
        <div style="text-align: center; color:green;">
        <b><h3>WORK HISTORY</h3></b>
        
        </div>
        <div style="text-align: center;">
        <input type="text" id="searchId" onkeyup="searchFunction()" placeholder="Search for names..">
       <table id='table'class="form-table table-bordered table-striped table-hover">
            <tr>
                <th> TRIP ID</th>
                <th> CUSTOMER NAME </th>
                <th> CUSTOMER PHONE NUMBER </th>
                <th> CUSTOMER ADDRESS </th>
                <th> DRIVER ID </th>
                <th> DRIVER NAME </th>
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
 $(document).ready(function(){
	 openWorkAllocation()
	 
 })
 
 function workAllocation(){
	 
	 let tripId="tripId"
	 let customerName=document.getElementById("customer_name").value;
	 let customerPhone=document.getElementById("customer_phone").value;
	 let customerAddress=document.getElementById("customer_address").value;
	 let vehicleId=document.getElementById("available_vehicle").value;
	 let driverId=document.getElementById("availabe_driver").value;
	
	 $.post("api/manager/workallocation?tripId="+tripId+"&customerName="+customerName+"&customerPhoneNo="+customerPhone+"&customerAddress="+customerAddress+"&vehicleId="+vehicleId+"&driverId="+driverId,
			 (data,status)=>{
				 openWorkAllocation();
				 alert(data) 			 
			 })
	 		 
	  //return ("/api/sendEmail");
 }
 
 
 
 function openWorkAllocation(){
	 let workAllocationForm=document.getElementById("workAllocationForm").innerHTML;
	 let maindiv=document.getElementById("main").innerHTML=workAllocationForm;
 }
 
 function openWorkHistory(){
	 let workHistoryForm=document.getElementById("workHistoryForm").innerHTML;
	 let maindiv=document.getElementById("main").innerHTML=workHistoryForm;
 }
 
 function selectedVehicleType(){
	 let vehicleType=document.getElementById("vehicle_type").value;
	 $('#availabe_driver').empty();
	 $('#available_vehicle').empty();
	 $.get("/api/vehicle/available?vehicle_Type="+vehicleType,(data,status)=>{
		 $.each(data, function (index, value) {
		 $('#available_vehicle').append('<option value="' + value.vehicleId + '">'  + value.vehicleId+" - "+value.vehicleNo +  '</option>');
		
		 })
	 })
	 $.get("/api/driver/available",(data,status)=>{
		 $.each(data, function (index, value) {
		 $('#availabe_driver').append('<option value="' + value.driverId + '">' + value.driverId +" - "+ value.driverName +'</option>');

		 })
	 })
	 
	 
 }
 function tripHistroyDetails(){
	 $.get("/api/manager/tripHistroy",(data,status)=>{
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
                 value.driverId + '</td>';
                 
                 trip += '<td>' + 
                 value.driverName + '</td>';
                 
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
 function logout(){
	 sessionStorage.clear();
	 window.location.href="/";
 }
 
 
 
 
 </script>
</body>
</html>