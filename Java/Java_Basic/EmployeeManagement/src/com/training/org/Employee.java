package com.training.org;

public class Employee {
	
	private int empId;
	private String empName;
	private double salary;
	
	public Employee() {
	//	System.out.println("Default Constructor of Employee is called");
		this.empId = 101;
		this.empName = "Varun";
		this.salary = 5000000;
	}
	
	public Employee(int empId, String empName, double salary) {
	//	System.out.println("Parameterized Constructor of Employee is called");
		this.empId = empId;
		this.empName = empName;
		this.salary = salary;
	}
	
	public String toString() {
		return "Employee Details are ID: "+empId+", Employee Name is "+empName+" and Salary is "+salary;
	}

	
	public String getEmployeeName() {
		return empName;
	}
	
	public void setName(String name) {
		this.empName = name;
	}
	
	public double getsalary() {
		return salary;
	}
	
	public void setSalary(double salary1) {
		this.salary=salary1;
	}
}
