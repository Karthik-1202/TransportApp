package com.cts.transport.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.cts.transport.controller.driverDetailsController;
import com.cts.transport.controller.tripDetailsController;
import com.cts.transport.controller.vehicleDetailsController;
import com.cts.transport.model.driverDetails;
import com.cts.transport.model.tripDetails;
import com.cts.transport.model.vehicleDetails;



@Service
@RestController
@CrossOrigin(origins="http://localhost:4200")
public class applicationService {
    @Autowired
	private tripDetailsController tripcon;
	@Autowired
	private vehicleDetailsController vehcon;
	@Autowired
	private driverDetailsController drvcon;
	@Autowired
	private emailService eCon;
	
	@PostMapping("/api/manager/workallocation")
	public String allocateWork(tripDetails newTrip) {
		driverDetails drvDetail=drvcon.viewDriverDetails(newTrip.getDriverId());
		newTrip.setDriverName(drvDetail.getDriverName());
		String driverEmail=drvDetail.getDriverMailId();
		vehicleDetails vehDetail=vehcon.viewVehicleDetails(newTrip.getVehicleId());
		newTrip.setVehicleNo(vehDetail.getVehicleNo());
		newTrip.setTripStatus("pending");
		String status=tripcon.addTrip(newTrip);
		vehcon.updateVehicleStatusNotAvailable(newTrip.getVehicleId());
		drvcon.updateDriverStatusNotAvailable(newTrip.getDriverId());
		eCon.sendEmail(newTrip,driverEmail);
		return "new work added, "+status;
		
	}
	@PostMapping("/api/driver/workaccept")
	public String workAcceptance(@RequestParam("trip_Id")String tripId) {
		tripcon.updateTripStatusAcceptance(tripId);
		return "work started";
	}
	@PostMapping("/api/driver/workcomplete")
	public String workCompletion(@RequestParam("trip_Id") String tripId,@RequestParam("driver_Id")String driverId,@RequestParam("vehicle_Id")String vehicleId,@RequestParam("vehicle_Number")String vehicleNumber ) {
		drvcon.updateDriverStatusAvailable(driverId);
		tripcon.updateTripStatusAcceptance2(tripId);
		eCon.sendEmailAdmin(vehicleId, vehicleNumber);
		return "work Completed Successfully";
	}
	
}
