package com.example.demo

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication
import org.apringframework.boot.SpringApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;


@SpringBootApplication
@RestController
public class DemoApplication
 
	public statuc void main (String[] args){}{
		SpringApplication.run(DemoApplication.class,args);
	}
	@GetMapping("/hello")
	public String hello(@RequestParam(value = "name", defaultValue= "World")String name){
		return String.format("Hello %s!", name);
	}

















//fun main(args: Array<String>) {
	//runApplication<DemoApplication>(*args)
//}
