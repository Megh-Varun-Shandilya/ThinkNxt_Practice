package com.training.org;

import java.util.ArrayList;
import java.util.Scanner;

public class EmployeeMain {

	public static void main(String[] args) {

		ArrayList<Employee> empList = new ArrayList<Employee>();
		Scanner scn = new Scanner(System.in);
		char ch;
		int flag = 0;
		int flag1 = 0;
	do {
		System.out.println("[1] Add new Record\n[2] Display Records\n[3] Delete Record\n[4] Update Record\n\n");
		int choice  = scn.nextInt();
		
		switch (choice) {
		
		case 1:
			System.out.println("Enter Employee Id");
			int id = scn.nextInt();
			
			System.out.println("Enter Name");
			String name = scn.next();
			
			System.out.println("Enter Salary");
			double salary = scn.nextDouble();	
	
			empList.add(new Employee(id,name,salary));
			System.out.println("Record is added successfully...");
			break;
			
		case 2:
			System.out.println("*******************Employee Records are*********************");
			for(Employee emp: empList) {
				System.out.println(emp);
			}
		break;
	
		case 3:
			System.out.println("Enter the Name to delete");
			String nam = scn.next();
			
			for(int i=0; i<empList.size();i++) {
				if(empList.get(i).getEmployeeName().equalsIgnoreCase(nam)) {
					empList.remove(i);
					System.out.println("Record is deleted successfully...");
					flag = 1;
					break;
				}
			}
			
			if(flag==0) {
				System.out.println("Record is not available");
			}
			break;
		
		case 4:
			System.out.println("[4.1]Update Name\n[4.2]Update Salary\n\n");
			int choice1 = scn.nextInt();
			
			switch (choice1) {
			case 1: 
				System.out.println("Enter the name to update");
				String oldName = scn.next();
				
				
				for(int i=0; i<empList.size();i++) {
					if(empList.get(i).getEmployeeName().equalsIgnoreCase(oldName)) {
						System.out.println("Enter the new name to be replaced with "+oldName);
						String newName = scn.next();
						empList.get(i).setName(newName);
						System.out.println("New Name updated successfully...");
						flag1=1;
						break;
					}
				}
				
				if(flag1==0) {
					System.out.println("No record found ");
				}
				break;
			
			case 2:
				System.out.println("Provide yearly increment for the employee with condition");
				System.out.println("Enter the salary condition ");
				int checkSal = scn.nextInt();
				
				System.out.println("Enter the parcentage increase in salary");
				double percentIncrease = scn.nextDouble();

				for(int i=0; i < empList.size();i++) {
					if(empList.get(i).getsalary()<checkSal){
						empList.get(i).setSalary(empList.get(i).getsalary()*(percentIncrease/100+1));
						System.out.println("Salary updated successfully...");
						flag1=1;
						break;
					}
				}
				
				 break;
			default:
				break;
			}
			
			break;
		default:
			System.out.println("Invalid choice");
			break;
			
		}
		System.out.println("Do you want to continue..?");
		ch = scn.next().charAt(0);
		
	} while (ch=='y'|| ch=='Y');
	scn.close();
	System.out.println("I'm Done");
		
		/*
		Employee  emp = new Employee();
		System.out.println(emp);
		
		Employee emp1 = new Employee(102,"Nancy",1200000);
		System.out.println(emp1);
		*/
		
		
	}

}
