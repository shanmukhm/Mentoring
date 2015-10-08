package com.beehyv.helloworld;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.beehyv.helloworld.services.HelloWorldService;

public class Hello {
	@SuppressWarnings("resource")
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		HelloWorldService service = (HelloWorldService) context.getBean("helloWorldService");
		String message = service.sayHello();
		
		service.setName("Spring");
		message = service.sayHello();
		System.out.println(message);
	}

}
