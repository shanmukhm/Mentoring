package com.tutorialspoint;

public class HelloWorld {
	private String m;
	public void setMessage(String message){
		this.m = message;
	}
	public void getMessage(){
		System.out.println("The Message : " + this.m);
	}
}
