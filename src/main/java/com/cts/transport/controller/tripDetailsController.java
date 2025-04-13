package com.cts.transport.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.cts.transport.exception.resourceNotFoundException;
import com.cts.transport.interfaces.tripDetailsInterface;
import com.cts.transport.model.tripDetails;
@CrossOrigin(origins="http://localhost:4200")
@RestController
public class tripDetailsController {
	@Autowired
	private tripDetailsInterface tripDetail;
    public String addTrip(tripDetails newTrip ) {
    	
			 tripDetails lastObj=this.tripDetail.findFirstByOrderByTripIdDesc();
			  String lastId=lastObj.getTripId();
			  int temp=Integer.parseInt(lastId.substring(3));
			  temp+=1;
			  String newTripId="TRI"+Integer.toString(temp);
			  newTrip.setTripId(newTripId);
			  this.tripDetail.save(newTrip);
			
		return "Trip assigned Successfully";
    }
    public void updateTripStatusAcceptance(String tripId) {
		tripDetails Obj=this.tripDetail.findById(tripId).orElseThrow(()->new resourceNotFoundException("tripId not found"));
	    Obj.setTripStatus("work Started");
	    this.tripDetail.save(Obj);
    }

    public void updateTripStatusAcceptance2(String tripId) {
		tripDetails Obj=this.tripDetail.findById(tripId).orElseThrow(()->new resourceNotFoundException("tripId not found"));
	    Obj.setTripStatus("work Completed");
	    this.tripDetail.save(Obj);
    }
    @GetMapping("/api/manager/tripHistroy")
    public List<tripDetails> getAllTripDetail(){
    	return tripDetail.getAllTrip();
    }
    @PostMapping("/api/driver/driverwork")
    public tripDetails pendingwork(@RequestParam("driver_Id")String driverId) {
    	
    	return tripDetail.getDriverPendingWork(driverId);
    }
    @PostMapping("/api/driver/workHistory")
    public List<tripDetails> workHistory(@RequestParam("driver_Id")String driverId){
    	return tripDetail.getDriverHistory(driverId);
    }

    @GetMapping("/api/trip/view")
	public tripDetails viewDriver(@RequestParam("trip_Id")String tripId) {
		tripDetails trpObj=this.tripDetail.findById(tripId).orElseThrow(()->new resourceNotFoundException("trip not found"));
		return trpObj;
	}

}
