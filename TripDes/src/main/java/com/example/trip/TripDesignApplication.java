package com.example.trip;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = {"com.example.trip.controller"})
public class TripDesignApplication {

	public static void main(String[] args) {
		SpringApplication.run(TripDesignApplication.class, args);
	}

}
