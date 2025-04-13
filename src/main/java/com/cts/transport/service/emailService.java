package com.cts.transport.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.cts.transport.model.tripDetails;

@Service
public class emailService {
	@Autowired
	JavaMailSender javaMailSender;

	public void sendEmail(tripDetails tripEmail,String driverEmail) {
		
		SimpleMailMessage message = new SimpleMailMessage();
		
		message.setFrom("transportsystem333@gmail.com");
		message.setTo(driverEmail);
		message.setSubject("Work Allocation");
		message.setText("TRIP ID = "+tripEmail.getTripId()+"\n"+
		                "CUSTOMER NAME = "+tripEmail.getCustomerName()+"\n"+
		                "CUSTOMER ADDRESS = "+tripEmail.getCustomerAddress()+"\n"+
		                "CUSTOMER PHONE NUMBER = "+tripEmail.getCustomerPhoneNo()+"\n"+
		                "VEHICLE ID = "+tripEmail.getVehicleId()+"\n"+
		                "VEHICLE NUMBER = "+tripEmail.getVehicleNo()+"\n\n"+"Your Work has been allocated ,Kindly check in your portal !");
		
		javaMailSender.send(message);
		
		//return "Mail sent successfully";
	}
	public void sendEmailAdmin(String vehicleId,String vehicleNumber) {
		
SimpleMailMessage message = new SimpleMailMessage();
		
		message.setFrom("transportsystem333@gmail.com");
		message.setTo("vasanthakumarm080@gmail.com");
		message.setSubject("Vehicle Status Updation");
		message.setText(
		                "VEHICLE ID = "+vehicleId+"\n"+
		                "VEHICLE NUMBER = "+vehicleNumber+"\n\n"+"Allocated work for the above vehicle has been completed ,Kindly check in your portal and update the vehicle status");
		
		javaMailSender.send(message);
	}
	
	

}