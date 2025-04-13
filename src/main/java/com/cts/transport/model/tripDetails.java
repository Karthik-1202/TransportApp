package com.cts.transport.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="trip_details")
public class tripDetails {
	@Id
	@Column(name="trip_id")
	private String tripId;
	@Column(name="customer_name")
	private String customerName;
	@Column(name="customer_phone_no")
	private String customerPhoneNo;
	@Column(name="customer_address")
	private String customerAddress;
	@Column(name="driver_id")
	private String driverId;
	@Column(name="driver_name")
	private String driverName;
	@Column(name="vehicle_id")
	private String vehicleId;
	@Column(name="vehicle_no")
	private String vehicleNo;
	@Column(name="trip_status")
	private String tripStatus;
	
	
	public tripDetails() {
		super();
		
	}
	
	
	
	public tripDetails(String tripId, String customerName, String customerPhoneNo, String customerAddress,
			String driverId, String driverName, String vehicleId, String vehicleNo, String tripStatus) {
		super();
		this.tripId = tripId;
		this.customerName = customerName;
		this.customerPhoneNo = customerPhoneNo;
		this.customerAddress = customerAddress;
		this.driverId = driverId;
		this.driverName = driverName;
		this.vehicleId = vehicleId;
		this.vehicleNo = vehicleNo;
		this.tripStatus = tripStatus;
	}
	public String getTripId() {
		return tripId;
	}
	public void setTripId(String tripId) {
		this.tripId = tripId;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getCustomerPhoneNo() {
		return customerPhoneNo;
	}
	public void setCustomerPhoneNo(String customerPhoneNo) {
		this.customerPhoneNo = customerPhoneNo;
	}
	public String getCustomerAddress() {
		return customerAddress;
	}
	public void setCustomerAddress(String customerAddress) {
		this.customerAddress = customerAddress;
	}
	public String getDriverId() {
		return driverId;
	}
	public void setDriverId(String driverId) {
		this.driverId = driverId;
	}
	public String getDriverName() {
		return driverName;
	}
	public void setDriverName(String driverName) {
		this.driverName = driverName;
	}
	public String getVehicleId() {
		return vehicleId;
	}
	public void setVehicleId(String vehicleId) {
		this.vehicleId = vehicleId;
	}
	public String getVehicleNo() {
		return vehicleNo;
	}
	public void setVehicleNo(String vehicleNo) {
		this.vehicleNo = vehicleNo;
	}
	public String getTripStatus() {
		return tripStatus;
	}
	public void setTripStatus(String tripStatus) {
		this.tripStatus = tripStatus;
	}
	
}
