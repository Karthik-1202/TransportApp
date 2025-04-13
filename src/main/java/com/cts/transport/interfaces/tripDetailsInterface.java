package com.cts.transport.interfaces;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import com.cts.transport.model.tripDetails;

@Repository
public interface tripDetailsInterface extends JpaRepository<tripDetails,String> {
	public tripDetails findFirstByOrderByTripIdDesc();
	@Query("from tripDetails order by tripId DESC")
	public List<tripDetails> getAllTrip();
	
	@Query("from tripDetails where driverId=?1 and (tripStatus='pending' or tripStatus='work Started')")
	public tripDetails getDriverPendingWork(String driverId) ;

	@Query("from tripDetails where driverId=?1")
	public List<tripDetails> getDriverHistory(String driverId);

}
