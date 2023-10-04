package com.training.org;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Scanner;
import javax.swing.JOptionPane;

public class Program1 {
	private int real;
	private int imag;

	public Program1() {
		System.out.println("Default constructor of Program1 is called");
		real = 0;
		imag = 0;
	}

	// Default Constructor
	public Program1(int real, int imag) {
		System.out.println("Parameterised constructor called");
		this.imag = imag;
		this.real = real;
		System.out.println(imag + "," + real);
	}

	/**
	 * @throws IOException
	 */
	/**
	 * @throws IOException
	 */
	public void acceptUserValues() throws IOException {
		/*
		 * // First Method Older way 
		 * BufferedReader input = new BufferedReader(new
		 * InputStreamReader(System.in));
		 * 
		 * System.out.println("Enter the values for real: "); 
		 * this.real = Integer.parseInt(input.readLine());
		 * 
		 * System.out.println("Enter the values for imag: "); 
		 * this.imag = Integer.parseInt(input.readLine());
		 * 
		 * System.out.println(imag+","+real);
		 */
		
		  // Second Method New Way 
		  Scanner scn = new Scanner(System.in);
		  
		  System.out.println("Enter the values for real: "); 
		  this.real = scn.nextInt();
		  
		  System.out.println("Enter the values for imag: "); 
		  this.imag = scn.nextInt();
		  
		  System.out.println(real+","+imag);
		  scn.close();
		 
		/*// Third Method
		this.real = Integer.parseInt(JOptionPane.showInputDialog("Enter First Value"));
		this.imag = Integer.parseInt(JOptionPane.showInputDialog("Enter Second Value"));
		
		JOptionPane.showMessageDialog(null," Values are "+this.real+" and "+this.imag);
		*/
		  
		  
		 
	}

	 public String toString() {
		  return (real+","+imag);
	  }
	 
	// Parameterized constructor
	public void showCompleValues() {
		System.out.println("Complex values are " + real + " and " + imag);
	}

	public static void main(String[] args) throws IOException {

		/*
		 * Program1 p1 = new Program1(); System.out.println(p1); p1.showCompleValues();
		 * for(int i=0; i <=10; i++) { System.out.println("I: "+i); }
		 */
		Program1 obj = new Program1();
		System.out.println(obj);

	}

}
