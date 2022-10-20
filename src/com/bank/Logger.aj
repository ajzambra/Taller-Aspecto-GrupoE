package com.bank;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Calendar;

public aspect Logger {

    pointcut success() : call(* create*(..) );
    after() : success() {
    	System.out.println("**** User created ****");
    }

    File file = new File("log.txt");
    Calendar cal = Calendar.getInstance();
    pointcut success1() : call(*  moneyWithdrawal*(..) );
    after() : success1() {
    	try(BufferedWriter bf = new BufferedWriter(new FileWriter(file,true))){
    		bf.write("retirar dinero|" + cal.getTime().getHours() +" Horas "+ "\n");
    		System.out.println("Retirar dinero|" + cal.getTime().getHours() + " Horas "+ "\n");
    	} 
    	catch(IOException ex) {}
    }
    
    
    
    pointcut success2() : call(*  moneyMakeTransaction*(..) );
    after() : success2() {
    	try(BufferedWriter bf = new BufferedWriter(new FileWriter(file,true))){
    		bf.write("transaccion|" + cal.getTime().getHours() +" Horas "+ "\n");
    		System.out.println("Realizar Transaccion|" + cal.getTime().getHours() +" Horas "+ "\n");
    	}
    	catch(IOException ex) {}
    }
    
}