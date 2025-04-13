package com.cts.transport.interfaces;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.cts.transport.model.driverDetails;

@Repository
public interface driverDetailsInterface extends JpaRepository<driverDetails,String>{
	public driverDetails findFirstByOrderByDriverIdDesc();
	
	@Query("from driverDetails where driverStatus=1 order by driverWorkingHours ASC")
	public List<driverDetails> getAvailableDrivers();
	@Query("from driverDetails order by driverId ASC")
	public List<driverDetails> getAllDrivers();
}
