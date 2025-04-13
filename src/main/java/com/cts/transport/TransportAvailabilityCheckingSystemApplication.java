package com.cts.transport;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
//import org.springframework.metricx.controller.MetricxEndpoint;

import io.micrometer.core.instrument.Metrics;
@SpringBootApplication(scanBasePackageClasses = {Metrics.class, TransportAvailabilityCheckingSystemApplication.class })
public class TransportAvailabilityCheckingSystemApplication {

	public static void main(String[] args) {
		SpringApplication.run(TransportAvailabilityCheckingSystemApplication.class, args);
	}

}

