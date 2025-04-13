package com.cts.transport.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.cts.transport.exception.resourceNotFoundException;
import com.cts.transport.interfaces.driverDetailsInterface;
import com.cts.transport.model.driverDetails;


@RestController
@CrossOrigin(origins="http://localhost:4200")
public class driverDetailsController {

	@Autowired
	private driverDetailsInterface drvDetails;
	
	@Autowired
	private loginCredentialsController loginController;
	
	@PostMapping("/api/driver/add")
	public List<String> addDriver(driverDetails newDriver) {
		
		try {
			 driverDetails lastObj=this.drvDetails.findFirstByOrderByDriverIdDesc();
			  String lastId=lastObj.getDriverId();
			  int temp=Integer.parseInt(lastId.substring(3));
			  temp+=1;
			  String newDriverId="DRV"+Integer.toString(temp);
			  newDriver.setDriverId(newDriverId);
			  this.drvDetails.save(newDriver);
			  List<String> list= new ArrayList<String>();
				list.add("Driver added Successfully ");
				list.add(newDriverId);
				return list;
			
		}catch(RuntimeException e) {
			List<String> list= new ArrayList<String>();
			list.add("failed");
			return list;
		}
	}
	@PostMapping("/api/driver/password")
	 public void driverPassword(@RequestParam("driver_Id") String drvUserId,@RequestParam("password")String driverPassword) {

		 loginController.drvLogin(drvUserId,driverPassword); 
			}
	
	@PostMapping("/api/driver/remove")
	public String removeDriver(@RequestParam("driver_Id")String driverId) {
		driverDetails drvObj=this.drvDetails.findById(driverId).orElseThrow(()->new resourceNotFoundException("driver not found"));
		try {
			this.drvDetails.delete(drvObj);
		}catch(RuntimeException e) {
			return "failed";
		}return "Driver removed Successfully";
	}
	
	@GetMapping("/api/driver/view")
	public driverDetails viewDriver(@RequestParam("driver_Id")String driverId) {
		driverDetails drvObj=this.drvDetails.findById(driverId).orElseThrow(()->new resourceNotFoundException("driver not found"));
		return drvObj;
	}
	@GetMapping("/api/driver/available")
	public List<driverDetails> availableDriver(){
		return drvDetails.getAvailableDrivers();
	}
	@GetMapping("/api/driver/alldriver")
	public List<driverDetails> allDriver(){
		return drvDetails.getAllDrivers();
	}
	public void updateDriverStatusNotAvailable(String driverId) {
		driverDetails Obj=this.drvDetails.findById(driverId).orElseThrow(()->new resourceNotFoundException("driver not found"));
		Obj.setDriverStatus(false);
		this.drvDetails.save(Obj);
	}
	public driverDetails viewDriverDetails(String driverId) {
		driverDetails drvObj=this.drvDetails.findById(driverId).orElseThrow(()->new resourceNotFoundException("driver not found"));
		return drvObj;
	}
	public void updateDriverStatusAvailable(String driverId) {
		driverDetails Obj=this.drvDetails.findById(driverId).orElseThrow(()->new resourceNotFoundException("driver not found"));
		Obj.setDriverStatus(true);
		this.drvDetails.save(Obj);
	}
}
