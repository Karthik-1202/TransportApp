package com.cts.transport;

import static org.junit.Assert.assertEquals;
import static org.mockito.Mockito.when;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.context.junit4.SpringRunner;

import com.cts.transport.controller.driverDetailsController;
import com.cts.transport.controller.tripDetailsController;
import com.cts.transport.controller.vehicleDetailsController;
import com.cts.transport.interfaces.driverDetailsInterface;
import com.cts.transport.interfaces.loginCredentialsInterface;
import com.cts.transport.interfaces.tripDetailsInterface;
import com.cts.transport.interfaces.vehicleDetailsInterface;
import com.cts.transport.model.driverDetails;
import com.cts.transport.model.tripDetails;
import com.cts.transport.model.vehicleDetails;
@RunWith(SpringRunner.class)
@SpringBootTest
public class TransportAvailabilityCheckingSystemApplicationTests {

@Autowired
private vehicleDetailsController vehCon;

@MockBean
private vehicleDetailsInterface vehInf;


@MockBean
private loginCredentialsInterface loginInf;

    @SuppressWarnings("unchecked")
@Test
public <T> void getAllVehicleTest() {
when(vehInf.getAllvehicles()).thenReturn((List<vehicleDetails>) Stream
.of((T) new vehicleDetails("VEH101","lorry","tata","TN 45 SD 2345",true),(T) new vehicleDetails("VEH102","truck","tata","TN 45 SD 3487",false)).collect(Collectors.toList()));
     assertEquals(2,vehCon.allVehicle().size());
}
   


@Test
public  void getViewVehicleTest() {
    vehicleDetails Obj=new vehicleDetails("VEH101","lorry","tata","TN 45 SD 2345",true);
    Optional<vehicleDetails> optObj=Optional.of(Obj);
    when(vehInf.findById("VEH101")).thenReturn(optObj);
     vehicleDetails temp= vehCon.viewVehicleDetails("VEH101");
assertEquals("lorry",temp.getVehicleType());
assertEquals("VEH101",temp.getVehicleId());
assertEquals("tata",temp.getVehicleName());
assertEquals("TN 45 SD 2345",temp.getVehicleNo());
assertEquals(true,temp.isVehicleStatus());
}
@Test
public  void updateVehicleStatusNotAvailableTest() {
    vehicleDetails Obj=new vehicleDetails("VEH101","lorry","tata","TN 45 SD 2345",true);
    Optional<vehicleDetails> optObj=Optional.of(Obj);
    when(vehInf.findById("VEH101")).thenReturn(optObj);
   vehCon.updateVehicleStatusNotAvailable("VEH101");
assertEquals(false,Obj.isVehicleStatus());
}

//driver controller methods testing
@Autowired
private driverDetailsController drvCon;
@MockBean
private driverDetailsInterface drvInf;

@SuppressWarnings("unchecked")
@Test
public <T> void getAllDriversTest() {
when(drvInf.getAllDrivers()).thenReturn((List<driverDetails>) Stream
.of((T) new driverDetails("DRV101","John","WRWE1231JN","yuvanmohaneee@gmail.com","7/223,chennai-600001","9876543210",true,"0")).collect(Collectors.toList()));
     assertEquals(1,drvCon.allDriver().size());
}

@Test
public  void getViewDriverTest() {
    driverDetails Obj=new driverDetails("DRV103","Tom","12WE1631JN","tom@gmail.com","7/423,trichy-600001","9871343210",true,"0");
    Optional<driverDetails> optObj=Optional.of(Obj);
    when(drvInf.findById("DRV103")).thenReturn(optObj);
     driverDetails temp= drvCon.viewDriverDetails("DRV103");
assertEquals("DRV103",temp.getDriverId());
assertEquals("Tom",temp.getDriverName());
assertEquals("12WE1631JN",temp.getDriverLicenseNo());
assertEquals("tom@gmail.com",temp.getDriverMailId());
assertEquals("7/423,trichy-600001",temp.getDriverAddress());
assertEquals("9871343210",temp.getDriverPhoneNo());
assertEquals(true,temp.getDriverStatus());
}

@Test
public  void updateDriverStatusNotAvailableTest() {
driverDetails Obj=new driverDetails("DRV103","Tom","12WE1631JN","tom@gmail.com","7/423,trichy-600001","9871343210",true,"0");
Optional<driverDetails> optObj=Optional.of(Obj);
    when(drvInf.findById(Obj.getDriverId())).thenReturn(optObj);
   drvCon.updateDriverStatusNotAvailable(Obj.getDriverId());
assertEquals(false,Obj.getDriverStatus());
}

@Test
public  void updateDriverStatusAvailableTest() {
driverDetails Obj=new driverDetails("DRV103","Tom","12WE1631JN","tom@gmail.com","7/423,trichy-600001","9871343210",false,"0");
Optional<driverDetails> optObj=Optional.of(Obj);
    when(drvInf.findById(Obj.getDriverId())).thenReturn(optObj);
   drvCon.updateDriverStatusAvailable(Obj.getDriverId());
assertEquals(true,Obj.getDriverStatus());
}
//tripDetailsController method testing
@Autowired
private tripDetailsController tripCon;

@MockBean
private tripDetailsInterface tripInf;


@SuppressWarnings("unchecked")
@Test
public <T> void getAllTripTest() {
when(tripInf.getAllTrip()).thenReturn((List<tripDetails>) Stream
.of((T) new tripDetails("TRI101","Sundar","9087645321","6/908,Maduravayil,chennai-600001","DRV101","Jhon","VEH101","TN 45 FC 5757","pending")).collect(Collectors.toList()));
     assertEquals(1,tripCon.getAllTripDetail().size());
}

@Test
public  void updateTripStatusAcceptanceTest() {
tripDetails Obj= new tripDetails("TRI101","Sundar","9087645321","6/908,Maduravayil,chennai-600001","DRV101","Jhon","VEH101","TN 45 FC 5757","pending");
Optional<tripDetails> optObj=Optional.of(Obj);
    when(tripInf.findById(Obj.getTripId())).thenReturn(optObj);
  tripCon.updateTripStatusAcceptance(Obj.getTripId());
assertEquals("work Started",Obj.getTripStatus());
}

@Test
public  void updateTripStatusAcceptance2Test() {
tripDetails Obj= new tripDetails("TRI101","Sundar","9087645321","6/908,Maduravayil,chennai-600001","DRV101","Jhon","VEH101","TN 45 FC 5757","pending");
Optional<tripDetails> optObj=Optional.of(Obj);
    when(tripInf.findById(Obj.getTripId())).thenReturn(optObj);
  tripCon.updateTripStatusAcceptance2(Obj.getTripId());
assertEquals("work Completed",Obj.getTripStatus());
}

}