package com.cts.transport.interfaces;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.cts.transport.model.driverDetails;
import com.cts.transport.model.vehicleDetails;

@Repository
public interface vehicleDetailsInterface extends JpaRepository<vehicleDetails,String> {
   public vehicleDetails findFirstByOrderByVehicleIdDesc();
   
   @Query("from vehicleDetails where vehicleType=?1 and vehicleStatus=1")
   public List<vehicleDetails> getAvailableVehicles(String vehicleType);
   
   @Query("from vehicleDetails order by vehicleId ASC")
	public List<vehicleDetails> getAllvehicles();

}
