package com.cts.transport.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
@CrossOrigin(origins="http//localhost:4200")
@Controller
public class ViewController {
    @RequestMapping("/")
	public String loginPage() {
	 return "index.html";
 }
    @RequestMapping("/admin")
    public String adminPage(){
    	return "admin.jsp";
    }
  
   
    
    @RequestMapping("/driver")
    public String driverPage() {
    	return "driver.jsp";
    }
    @RequestMapping("/login")
   	public String error() {
   	 return "error.jsp";
    }
}
