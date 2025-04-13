package com.cts.transport.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="vehicle_details")
public class vehicleDetails {
	@Id
	@Column(name="vehicle_id")
	private String vehicleId;
	@Column(name="type_of_vehicle")
	private String vehicleType;
	@Column(name="vehicle_name")
	private String vehicleName;
	@Column(name="vehicle_no")
	private String vehicleNo;
	@Column(name="vehicle_status")
	private boolean vehicleStatus;
	
	public vehicleDetails() {
		super();
	}
	
	public vehicleDetails(String vehicleId, String vehicleType, String vehicleName, String vehicleNo,
			boolean vehicleStatus) {
		super();
		this.vehicleId = vehicleId;
		this.vehicleType = vehicleType;
		this.vehicleName = vehicleName;
		this.vehicleNo = vehicleNo;
		this.vehicleStatus = vehicleStatus;
	}
	
	public String getVehicleId() {
		return vehicleId;
	}
	public void setVehicleId(String vehicleId) {
		this.vehicleId = vehicleId;
	}
	public String getVehicleType() {
		return vehicleType;
	}
	public void setVehicleType(String vehicleType) {
		this.vehicleType = vehicleType;
	}
	public String getVehicleName() {
		return vehicleName;
	}
	public void setVehicleName(String vehicleName) {
		this.vehicleName = vehicleName;
	}
	public String getVehicleNo() {
		return vehicleNo;
	}
	public void setVehicleNo(String vehicleNo) {
		this.vehicleNo = vehicleNo;
	}
	public boolean isVehicleStatus() {
		return vehicleStatus;
	}
	public void setVehicleStatus(boolean vehicleStatus) {
		this.vehicleStatus = vehicleStatus;
	}
	
	
	

}
