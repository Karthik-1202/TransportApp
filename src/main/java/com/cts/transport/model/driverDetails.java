package com.cts.transport.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="driver_details")
public class driverDetails {
	    @Id
	    @Column(name="driver_id")
        private String driverId;
	    @Column(name="driver_name")
        private String driverName;
	    @Column(name="driver_license_no")
        private String driverLicenseNo;
	    @Column(name="driver_mailid")
        private String driverMailId;
	    @Column(name="driver_address")
        private String driverAddress;
	    @Column(name="driver_phone_no")
        private String driverPhoneNo;
	    @Column(name="driver_status")
        private boolean driverStatus;
	    @Column(name="driver_working_hours")
        private String driverWorkingHours;
	    
	    
	    public driverDetails() {
	    	super();
	    }
	    
	   
		public driverDetails(String driverId, String driverName, String driverLicenseNo, String driverMailId,
				String driverAddress, String driverPhoneNo, boolean driverStatus, String driverWorkingHours) {
			super();
			this.driverId = driverId;
			this.driverName = driverName;
			this.driverLicenseNo = driverLicenseNo;
			this.driverMailId = driverMailId;
			this.driverAddress = driverAddress;
			this.driverPhoneNo = driverPhoneNo;
			this.driverStatus = driverStatus;
			this.driverWorkingHours = driverWorkingHours;
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
		public String getDriverLicenseNo() {
			return driverLicenseNo;
		}
		public void setDriverLicenseNo(String driverLicenseNo) {
			this.driverLicenseNo = driverLicenseNo;
		}
		public String getDriverMailId() {
			return driverMailId;
		}
		public void setDriverMailId(String driverMailId) {
			this.driverMailId = driverMailId;
		}
		public String getDriverAddress() {
			return driverAddress;
		}
		public void setDriverAddress(String driverAddress) {
			this.driverAddress = driverAddress;
		}
		public String getDriverPhoneNo() {
			return driverPhoneNo;
		}
		public void setDriverPhoneNo(String driverPhoneNo) {
			this.driverPhoneNo = driverPhoneNo;
		}
		public boolean getDriverStatus() {
			return driverStatus;
		}
		public void setDriverStatus(boolean driverStatus) {
			this.driverStatus = driverStatus;
		}
		public String getDriverWorkingHours() {
			return driverWorkingHours;
		}
		public void setDriverWorkingHours(String driverWorkingHours) {
			this.driverWorkingHours = driverWorkingHours;
		}
	    
	    
	    
	    
}
