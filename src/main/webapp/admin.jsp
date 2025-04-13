<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Page</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/css/select2.min.css" rel="stylesheet" /> 
<style>
  .vehicle_admin{
  text-align:left;
  
  
  }
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
			<div style="text-align: center ;color:blue; margin-top: 15px;"><B>
			<h3>ADMIN CONSOLE</h3></B>
			</div><br><hr>
		
			 <div style="text-align: center;">
			    <button type="submit" class="btn btn-light" onclick="openAddVehicle()">ADD VEHICLE</button>
			          </div><br>
			           <div style="text-align: center;">
			    <button type="submit" class="btn btn-light" onclick="openRemoveVehicle();allVehicle();">REMOVE VEHICLE</button>
			          </div><br>
			           <div style="text-align: center;">
			    <button type="submit" class="btn btn-light" onclick="openUpdateVehicle();allVehicles();">UPDATE VEHICLE STATUS</button>
			          </div><br>
			           <div style="text-align: center;">
			    <button type="submit" class="btn btn-light" onclick="openAddDriver()">ADD DRIVER</button>
			          </div><br>
			           <div style="text-align: center;">
			    <button type="submit" class="btn btn-light" onclick="openRemoveDriver(); allDriver();">REMOVE DRIVER</button>
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
			
			
			
    <div id="addVehicleForm" class="hidden">
        <div>
	  <div style="text-align: center ;color:GREEN;"><B>
		<h3>ADD VEHICLE</h3></B>
		</div><br>
		   <div>
		          <!-- <div class="mb-3">
		    <label for="vehicle_id" class="form-label">Vehicle Id</label>
		    <input type="text" class="form-control" id="vehicle_id">
		          </div>-->
		          
		          <div class="mb-3">
		    <label for="vehicle_type" class="form-label">Vehicle Type</label>
		       <select class="form-select"  id="vehicle_type">
			  <option selected>select vehicle type</option>
			  <option value="lorry">Lorry</option>
			  <option value="trailer">Trailer</option>
			  <option value="truck">Truck</option>
			   </select>
		          </div>
		          
		          <div class="mb-3">
		    <label for="vehicle_name" class="form-label">Vehicle Name</label>
		    <input type="text" class="form-control" id="vehicle_name">
		          </div>
		          
		          <div class="mb-3">
		    <label for="vehicle_no" class="form-label">Vehicle No</label>
		    <input type="text" class="form-control" id="vehicle_no">
		          </div>
		    
		          <div style="text-align: center;">
		    <button type="submit" class="btn btn-danger" onclick="addVehicle()">Add vehicle</button>
		          </div>
		 </div>
		 </div>
    
    
    </div>
    <div id="removeVehicleForm" class="hidden">
            <div>
	  <div style="text-align: center ;color:GREEN;"><B>
		<h3>REMOVE VEHICLE</h3></B>
		</div><br>
		   <div>
		           <div class="mb-3">
		    <label for="Rvehicle_id" class="form-label">Vehicle Id</label>
		    <select class="form-control" id="Rvehicle_id" onchange="viewVehicleDetails()"></select>
		          </div>
		          
		          
			        <div style="text-align: center;">
					  <button type="submit" class="btn btn-primary" onclick="viewVehicleDetails()">View</button>
					</div>
					
					<div id="viewVehicleDetails">
					    
					</div>
			    
		         
		          <div  id="removeVehicleButton" style="text-align: center;" class="hidden">
		          <br>
		           <div>
		              VEHICLE NUMBER = <span id="viewVehicleNo"></span>
		            </div><br>
		            <div>
		              VEHICLE TYPE = <span id="viewVehicleType"></span>
		            </div><br>
		            <div>
		              VEHICLE NAME = <span id="viewVehicleName"></span>
		            </div><br>
		           
		            <div>
		              VEHICLE STATUS = <span id="viewVehicleStatus"></span>
		            </div><br>
		          
		          
		    <button type="submit" class="btn btn-danger" onclick="removeVehicle()">Remove vehicle</button>
		          </div>
		          
		 </div>
		 </div> 
    
    
    
    </div>
    <div id="addDriverForm" class="hidden">
        <div style="text-align: center; color:green;">
        <b><h3>ADD DRIVER</h3></b>
        </div>
        
         <!--<div class="mb-3">
         <label for="driver_id" class="form-label">Driver Id</label>
         <input type="text" class="form-control" id="driver_id">
        </div>-->
        
        <div class="mb-3">
         <label for="driver_name" class="form-label">Driver Name</label>
         <input type="text" class="form-control" id="driver_name">
        </div>
        <div class="mb-3">
        <label for="driver_password" class="form-label">Create Password</label>
        <input type="password" class="form-control" id="driver_password">
        </div>
        <div class="mb-3">
         <label for="driver_license_no" class="form-label">Driver License Number</label>
         <input type="text" class="form-control" id="driver_license_no">
        </div>
        
        <div class="mb-3">
         <label for="driver_mailid" class="form-label">Driver Mail Id</label>
         <input type="text" class="form-control" id="driver_mailid">
        </div>
        
        <div class="mb-3">
         <label for="driver_address" class="form-label">Driver Address</label>
         <input type="text" class="form-control" id="driver_address">
        </div>
        
        <div class="mb-3">
         <label for="driver_phoneno" class="form-label">Driver Phone Number</label>
         <input type="text" class="form-control" id="driver_phoneno">
        </div>
       
        <div style="text-align: center;">
		  <button type="submit" class="btn btn-primary" onclick="addDriver()">Add Driver</button>
		</div>
    
    </div>
<!--  remove driver form-->
     <div id="removeDriverForm" class="hidden">
            <div>
	  <div style="text-align: center ;color:GREEN;"><B>
		<h3>REMOVE DRIVER</h3></B>
		</div><br>
		   <div>
		           <div class="mb-3">
		    <label for="Rdriver_id" class="form-label">Driver Id</label>
		    <select class="form-select"  id="Rdriver_id" onchange="viewDriverDetails()">
		        
			   </select>
		          </div>
		          
		          
			        <div style="text-align: center;">
					  <button type="submit" class="btn btn-primary" onclick="viewDriverDetails()">View</button>
					</div>
					
					<div id="viewDriverDetails">
					    
					</div>
			    
		         
		          <div  id="removeDriverButton" style="text-align: center;" class="hidden">
		          <br>
		           <div>
		              DRIVER NAME = <span id="viewDriverName"></span>
		            </div><br>
		            <div>
		              DRIVER LICENSE NUMBER = <span id="viewDriverLicenseNo"></span>
		            </div><br>
		            <div>
		              DRIVER MAIL ID = <span id="viewDriverMailId"></span>
		            </div><br>
		           
		            <div>
		              DRIVER PHONE NUMBER = <span id="viewDriverPhoneNo"></span>
		            </div><br>
		            
		            <div>
		              DRIVER STATUS = <span id="viewDriverStatus"></span>
		            </div><br>
		          
		          
		    <button type="submit" class="btn btn-danger" onclick="removeDriver();">Remove Driver</button>
		          </div>
		          
		 </div>
		 </div> 
    
    
    
    </div>
    
    
    <div id="vehicleStatusUpdateForm" class="hidden">
            <div>
	  <div style="text-align: center ;color:GREEN;"><B>
		<h3>UPDATE VEHICLE STATUS</h3></B>
		</div><br>
		   <div>
		           <div class="mb-3">
		    <label for="VupdateStatus" class="form-label">Vehicle Id</label>
		    <select class="form-control" id="VupdateStatus" onchange="updateViewVehicleDetails()"></select>
		          </div>
		          <div style="text-align: center;">
					  <button type="submit" class="btn btn-primary" onclick="updateViewVehicleDetails()">View</button>
					</div>
<!-- to view details for update form -->
					<div id="uViewVehicleDetails">
					    
					</div>
			    
		         
		          <div  id="updateVehicleButton" style="text-align: center;" class="hidden">
		          <br>
		           <div>
		              VEHICLE NUMBER = <span id="uViewVehicleNo"></span>
		            </div><br>
		            <div>
		              VEHICLE TYPE = <span id="uViewVehicleType"></span>
		            </div><br>
		            <div>
		              VEHICLE NAME = <span id="uViewVehicleName"></span>
		            </div><br>
		           
		            <div>
		              VEHICLE STATUS = <span id="uViewVehicleStatus"></span>
		            </div><br>
		            
		            <div class="mb-3">
		       <label for="updateStatus" class="form-label">UPDATE STATUS</label>
		       <select class="form-select"  id="updateStatus">
			   <option selected>update status</option>
			  <option value=0>Not Available</option>
			  <option value=1>Available</option>
			   </select>
		          </div>
		          
		          
		    <button type="submit" class="btn btn-danger" onclick="updateVehicleStatus()">Update Status</button>
		          </div>
		          
		 </div>
		 </div> 
    
    
    
    </div>

    
    
    
    
    
    
    
    
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
 <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/js/select2.min.js"></script>
 <script>
 $(document).ready(function(){
	 openAddVehicle()
	 
 })
 
 function addVehicle(){
	 let vehicleId="vehicleId";
	 let vehicleName=document.getElementById("vehicle_name").value;
	 let vehicleType=document.getElementById("vehicle_type").value;
	 let vehicleNo=document.getElementById("vehicle_no").value;
	 let vehicleStatus=1;
	if(vehicleName===""||vehicleNo===""){
		alert("Enter All The Mandatory Details")
	}else{
	 $.post("/api/vehicle/add?vehicleId="+vehicleId+"&vehicleName="+vehicleName+"&vehicleType="+vehicleType+
			 "&vehicleNo="+vehicleNo+"&vehicleStatus="+vehicleStatus,(data,status)=>{
				 openAddVehicle();
				 alert(data) 
				 
			 })
	}
 }
 
 function removeVehicle(){
	 let vehicleId=document.getElementById("Rvehicle_id").value;
	 $.post("/api/vehicle/remove?vehicle_Id="+vehicleId,(data,status)=>{
		 openRemoveVehicle();
		 allVehicle();
		 alert(data);
		 
		 
	 }).fail(()=>{
		 alert("Vehicle doesn't exist")
		 
	 })
	 
	 
 }
 
 function addDriver(){
	 let driverId="DriverId";
	 let driverName=document.getElementById("driver_name").value;
	 let driverPassword=document.getElementById("driver_password").value;
	 let driverLicenseNo=document.getElementById("driver_license_no").value;
	 let driverMailId=document.getElementById("driver_mailid").value;
	 let driverAddress=document.getElementById("driver_address").value;
	 let driverPhoneNo=document.getElementById("driver_phoneno").value;
if(driverName==="" || driverPassword==="" || driverLicenseNo==="" || driverMailId==="" || driverAddress===""|| driverPhoneNo===""){
	alert("Enter All The Mandatory Fields")
}else{
	 $.post("/api/driver/add?driverId="+driverId+"&driverName="+driverName+"&driverLicenseNo="+driverLicenseNo+"&driverMailId="+driverMailId+"&driverAddress="+driverAddress+
			 "&driverPhoneNo="+driverPhoneNo+"&driverStatus="+"1"+"&driverWorkingHours="+"0",(data,status)=>{
				 openAddDriver();
				 alert(data[0]+", Driver Id is : "+data[1]);
				 driverId=data[1];
				 $.post("/api/driver/password?driver_Id="+driverId+"&password="+driverPassword,(data,status)=>{
					 
				 })		 
			 })	
}
 }
 function removeDriver(){
	 let driverId=document.getElementById("Rdriver_id").value;
	 $.post("/api/driver/remove?driver_Id="+driverId,(data,status)=>{
		 openRemoveDriver();
		 allDriver();
		 alert(data);
	 }).fail(()=>{
		 alert("Driver doesn't exist")
	 })
	 
 }
//view vehicle details
 function viewVehicleDetails(){
	 document.getElementById("viewVehicleDetails").innerHTML="";
	 let vehicleId=document.getElementById("Rvehicle_id").value;
	 $.get("/api/vehicle/view?vehicle_Id="+vehicleId,(data,status)=>{
		 renderViewDetails(data);
	 }).fail(()=>{
		 alert("Vehicle doesn't exist")
	 })
	 
 }
 
 function renderViewDetails(data){
	 
	 document.getElementById("viewVehicleNo").innerHTML=data.vehicleNo;
	 document.getElementById("viewVehicleType").innerHTML=data.vehicleType;
	 document.getElementById("viewVehicleName").innerHTML=data.vehicleName;
	 document.getElementById("viewVehicleStatus").innerHTML=(data.vehicleStatus)?"Available":"Not Available";
	 document.getElementById("viewVehicleDetails").innerHTML=document.getElementById("removeVehicleButton").innerHTML;
	 
	 
 }
 //view vehicle details in update status form
 
 function updateViewVehicleDetails(){
	 document.getElementById("uViewVehicleDetails").innerHTML="";
	 let vehicleId=document.getElementById("VupdateStatus").value;
	 $.get("/api/vehicle/view?vehicle_Id="+vehicleId,(data,status)=>{
		 uRenderViewDetails(data);	 
	 }).fail(()=>{
		 alert("Vehicle doesn't exist")
	 })
	 
 }
 
 function uRenderViewDetails(data){
	 
	 document.getElementById("uViewVehicleNo").innerHTML=data.vehicleNo;
	 document.getElementById("uViewVehicleType").innerHTML=data.vehicleType;
	 document.getElementById("uViewVehicleName").innerHTML=data.vehicleName;
	 document.getElementById("uViewVehicleStatus").innerHTML=(data.vehicleStatus)?"Available":"Not Available";
	 document.getElementById("uViewVehicleDetails").innerHTML=document.getElementById("updateVehicleButton").innerHTML;
	 
	 
 }
 
 //viewing driver details
 
 function viewDriverDetails(){
	 document.getElementById("viewDriverDetails").innerHTML="";
	 let driverId=document.getElementById("Rdriver_id").value;
	 $.get("/api/driver/view?driver_Id="+driverId,(data,status)=>{
		 renderDriverViewDetails(data);	 
	 }).fail(()=>{
		 alert("Driver doesn't exist")
	 })
	 
 }
 
 function renderDriverViewDetails(data){
	 
	 document.getElementById("viewDriverName").innerHTML=data.driverName;
	 document.getElementById("viewDriverLicenseNo").innerHTML=data.driverLicenseNo;
	 document.getElementById("viewDriverMailId").innerHTML=data.driverMailId;
	 document.getElementById("viewDriverPhoneNo").innerHTML=data.driverPhoneNo;
	 document.getElementById("viewDriverStatus").innerHTML=(data.driverStatus)?"Available":"Not Available";
	 document.getElementById("viewDriverDetails").innerHTML=document.getElementById("removeDriverButton").innerHTML;
	 
	 
 }
 function updateVehicleStatus(){
	 let vehicleId=document.getElementById("VupdateStatus").value;
	 let vehicleStatus=document.getElementById("updateStatus").value;
	 $.post("/api/vehicle/update_status?vehicle_Id="+vehicleId+"&vehicle_Status="+vehicleStatus,(data,status)=>{
		 openUpdateVehicle();
		 allVehicles();
		 alert(data);
	 })
 }
 
 function allDriver(){
	 $("#Rdriver_id").select2();
	 $('#Rdriver_id').empty();
	//$('#Rdriver_id').append('<option value="'+"disabled selected hidden"+'">'+ "select driver Id"+'</option>');
	 $.get("/api/driver/alldriver",(data,status)=>{
		 $.each(data, function (index, value) {
		 $('#Rdriver_id').append('<option value="' + value.driverId + '">' + value.driverId +" - "+ value.driverName +'</option>');

		 })
	 })
 }
 function allVehicle(){
	 $("#Rvehicle_id").select2();
	 $('#Rvehicle_id').empty();
	 $.get("/api/vehicle/allvehicle",(data,status)=>{
		 $.each(data, function (index, value) {
		 $('#Rvehicle_id').append('<option value="' + value.vehicleId + '">' + value.vehicleId +" - "+ value.vehicleNo +'</option>');

		 })
	 })
 }
 function allVehicles(){
	 $("#VupdateStatus").select2();
	 $('#VupdateStatus').empty();
	 $.get("/api/vehicle/allvehicle",(data,status)=>{
		 $.each(data, function (index, value) {
		 $('#VupdateStatus').append('<option value="' + value.vehicleId + '">' + value.vehicleId +" - "+ value.vehicleNo +" - "+ ((value.vehicleStatus)?"Available":"Not Available")+'</option>');

		 })
	 })
 }
 
 function openAddVehicle(){
	 let addVehicleForm=document.getElementById("addVehicleForm").innerHTML;
	 let maindiv=document.getElementById("main").innerHTML=addVehicleForm;
 }
 function openRemoveVehicle(){
	 let removeVehicleForm=document.getElementById("removeVehicleForm").innerHTML;
	 let maindiv=document.getElementById("main").innerHTML=removeVehicleForm;
 }
 
 function openUpdateVehicle(){
	 let updateVehicleForm=document.getElementById("vehicleStatusUpdateForm").innerHTML;
	 let maindiv=document.getElementById("main").innerHTML=updateVehicleForm;
 }
 
 function openAddDriver(){
	 let addDriverForm=document.getElementById("addDriverForm").innerHTML;
	 let maindiv=document.getElementById("main").innerHTML=addDriverForm;
 }
 function openRemoveDriver(){
	 let removeDriverForm=document.getElementById("removeDriverForm").innerHTML;
	 let maindiv=document.getElementById("main").innerHTML=removeDriverForm;
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
		 if(userData.jobRole !=="admin" || userData.authStatus!=="true" ){
			 sessionStorage.clear();
			 window.location.href=userData.forwardTo;
		 }
	 }
	 
 })
 
 
 
 </script>
</body>
</html>