package com.cts.transport.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.cts.transport.exception.resourceNotFoundException;
import com.cts.transport.interfaces.loginCredentialsInterface;
import com.cts.transport.model.loginCredentials;

@RestController
@CrossOrigin(origins="http//localhost:4200")
public class loginCredentialsController {
	@Autowired
	private loginCredentialsInterface loginInterface;
  @PostMapping("/api/login") 
  public HashMap login(@RequestParam("user_id") String userId,@RequestParam("password") String password) {
	  loginCredentials userObj=this.loginInterface.findById(userId).orElseThrow(()->new resourceNotFoundException("No User Found"));
	  if(password.equals(userObj.getPassword())&& userId.equals(userObj.getUserId())) {
		  HashMap<String,String> response=new HashMap<String,String>();
		  response.put("userId",userObj.getUserId());
		  response.put("jobRole",userObj.getJobRole());
		  response.put("authStatus", "true");
		  response.put("forwardTo","/"+userObj.getJobRole());
		  return response;
	  }
	  else {
		  HashMap<String,String> response=new HashMap<String,String>();
		  response.put("authStatus", "false");
		  return response;
	  }
  }
  
  public String drvLogin(String userId, String Password) {
	  loginCredentials duserObj = new loginCredentials(); 
	  duserObj.setUserId(userId);
	  duserObj.setPassword(Password);
	  duserObj.setJobRole("driver");
	  this.loginInterface.save(duserObj);
	  return "Driver login added successfully";
  }
}
