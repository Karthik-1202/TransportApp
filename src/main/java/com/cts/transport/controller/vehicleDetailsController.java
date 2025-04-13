package com.cts.transport.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.cts.transport.exception.resourceNotFoundException;
import com.cts.transport.interfaces.vehicleDetailsInterface;
import com.cts.transport.model.vehicleDetails;
@CrossOrigin(origins="http://localhost:4200")
@RestController
public class vehicleDetailsController {
	@Autowired
	private vehicleDetailsInterface vehDetail;
	@PostMapping("/api/vehicle/add")
  public String addVehicle(vehicleDetails newVehicle) {
	  try{
		  vehicleDetails lastObj=this.vehDetail.findFirstByOrderByVehicleIdDesc();
		  String lastId=lastObj.getVehicleId();
		  int temp=Integer.parseInt(lastId.substring(3));
		  temp+=1;
		  String newVehicleId="VEH"+Integer.toString(temp);
		  newVehicle.setVehicleId(newVehicleId);
		  this.vehDetail.save(newVehicle);
	  }catch(RuntimeException e) {
		  return "failed";
	  }
	  return "vehicle added successfully";
  }
	@PostMapping("/api/vehicle/remove")
	public String removeVehicle(@RequestParam("vehicle_Id")String vehicleId) {
		vehicleDetails Obj=this.vehDetail.findById(vehicleId).orElseThrow(()->new resourceNotFoundException("vehicle not found"));
		try {
			this.vehDetail.delete(Obj);
		}catch(RuntimeException e) {
			  return "failed";
		  }
		return "vehicle removed successfully";
	}
	
	@GetMapping("/api/vehicle/view")
	public vehicleDetails viewVehicle(@RequestParam("vehicle_Id")String vehicleId) {
		vehicleDetails Obj=this.vehDetail.findById(vehicleId).orElseThrow(()->new resourceNotFoundException("vehicle not found"));
		return Obj;
	}
	@PostMapping("/api/vehicle/update_status")
	public String updateVehicleStatus(@RequestParam("vehicle_Id")String vehicleId,@RequestParam("vehicle_Status")int vehicleStatus) {
		try {
			vehicleDetails Obj=this.vehDetail.findById(vehicleId).orElseThrow(()->new resourceNotFoundException("vehicle not found"));
			Obj.setVehicleStatus(vehicleStatus==1);
			this.vehDetail.save(Obj);
		}catch(RuntimeException e) {
			  return "failed";
		  }
		return "Status Updated";
	}
	@GetMapping("/api/vehicle/available")
	public List<vehicleDetails> availableVehicles(@RequestParam("vehicle_Type")String vehicleType){
		return vehDetail.getAvailableVehicles(vehicleType);
	}
	@GetMapping("/api/vehicle/allvehicle")
	public List<vehicleDetails> allVehicle(){
		return vehDetail.getAllvehicles();
	}
	public void updateVehicleStatusNotAvailable(String vehicleId) {
		vehicleDetails Obj=this.vehDetail.findById(vehicleId).orElseThrow(()->new resourceNotFoundException("vehicle not found"));
		Obj.setVehicleStatus(false);
		this.vehDetail.save(Obj);
	}
	public vehicleDetails viewVehicleDetails(String vehicleId) {
		vehicleDetails Obj=this.vehDetail.findById(vehicleId).orElseThrow(()->new resourceNotFoundException("vehicle not found"));
		return Obj;
	}
}
