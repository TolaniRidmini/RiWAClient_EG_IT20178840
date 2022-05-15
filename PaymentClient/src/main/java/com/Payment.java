package com;

import java.sql.*;

public class Payment {

	public Connection connect(){
        //database connection details
        String dbDriver = "com.mysql.jdbc.Driver";
        String dbURL = "jdbc:mysql://127.0.0.1:3306/";
        String dbName = "electrogrid";
        String dbUsername = "root";
        String dbPassword = "root";
        
        Connection conn = null;
        
        try {
        	//connecting the database
        	Class.forName(dbDriver);
        	conn = DriverManager.getConnection(dbURL+dbName, dbUsername, dbPassword);
        	
        	//if successfully connected this will be printed in the terminal
        	System.out.print("Database connected successfully");
        } catch(Exception e) {
        	e.printStackTrace();
        }
        
        return conn;
    }

    
    public String readPayments()
    {
    	String output = "";
    	try
    	{
    		Connection con = connect();
    		if (con == null)
    		{
    			return "Error while connecting to the database for reading.";
    		}
    		// Prepare the html table to be displayed
    		output = "<table border='1'><tr><th>PaymentID</th>" 
					+"<th>UserID</th><th>PowerSupplierID</th>"
					+ "<th>Payment_Method</th>" 
					+ "<th>Payment_Date</th>" 
					+ "<th>Amount</th>"
					+ "<th>Type</th>"
					+ "<th>Consumption_Unit</th>"
					+ "<th>NoOfUnits</th></tr>"; 
    		
    		String query = "select * from payment";
    		Statement stmt = con.createStatement();
    		ResultSet rs = stmt.executeQuery(query);
    		// iterate through the rows in the result set
    		while (rs.next())
    		{String PaymentID = Integer.toString(rs.getInt("PaymentID")); 
			String UserID = Integer.toString(rs.getInt("UserID")); 
			String PowerSupplierID = Integer.toString(rs.getInt("PowerSupplierID"));  
			String Payment_Method = rs.getString("Payment_Method"); 
			String Payment_Date = rs.getString("Payment_Date"); 
			String Amount = Double.toString(rs.getDouble("Amount"));  
			String Type = rs.getString("Type"); 
			String Consumption_Unit = rs.getString("Consumption_Unit"); 
			String NoOfUnits = rs.getString("NoOfUnits"); 
			// Add into the html table
			output += "<tr><td>" + PaymentID + "</td>"; 
			output += "<td>" + UserID + "</td>"; 
			output += "<td>" + PowerSupplierID + "</td>"; 
			output += "<td>" + Payment_Method + "</td>"; 
			output += "<td>" + Payment_Date + "</td>"; 
			output += "<td>" + Amount + "</td>"; 
			output += "<td>" + Type + "</td>"; 
			output += "<td>" + Consumption_Unit + "</td>"; 
			output += "<td>" + NoOfUnits + "</td>"; 
			
			
    			// buttons
    			output += "<td><input name='btnUpdate' type='button' value='Update' class='btnUpdate btn btn-secondary' data-itemid='"+ PaymentID + "'>" + "</td>"
    					+ "<td><input name='btnRemove' type='button' value='Remove' class='btnRemove btn btn-danger' data-itemid='"+ PaymentID + "'>" + "</td></tr>";
    		}
    		con.close();
    		// Complete the html table
    		output += "</table>";
    }
    catch (Exception e)
    {
    	output = "Error while reading the payments.";
    	System.err.println(e.getMessage());
    }
    	return output;
    }
    
    
  //method to insert data
    public String insertPayments(String PaymentID, String UserID, String PowerSupplierID, String Payment_Method, String Payment_Date, String Amount,String Type, String Consumption_Unit,String NoOfUnits)
    {
    	String output = "";
    	try
    	{
    		Connection con = connect(); 
			if (con == null) 
			{
				return "Error while connecting to the database for inserting."; 
			} 
			// create a prepared statement
			String query = " insert into Payment(`PaymentID`,`UserID`,`PowerSupplierID`,`Payment_Method`,`Payment_Date`,`Amount`,`Type`,`Consumption_Unit`,`NoOfUnits`)"
					+ " values (?, ?, ?, ?, ?, ?, ?, ?,?)"; 
			PreparedStatement preparedStmt = con.prepareStatement(query); 
			// binding values
			preparedStmt.setInt(1, Integer.parseInt(PaymentID)); 
			preparedStmt.setInt(2, Integer.parseInt(UserID)); 
			preparedStmt.setString(3,PowerSupplierID);
			preparedStmt.setString(4, Payment_Method); 
			preparedStmt.setString(5, Payment_Date);	
			preparedStmt.setDouble(6, Double.parseDouble(Amount));
			preparedStmt.setString(7, Type);
			preparedStmt.setInt(8, Integer.parseInt(Consumption_Unit));	
			preparedStmt.setInt(9, Integer.parseInt(NoOfUnits));	
				
    		// execute the statement
    		preparedStmt.execute();
    		con.close();
    		String newPayments = readPayments();
    		output = "{\"status\":\"success\", \"data\": \"" + newPayments + "\"}";
    	}
    	catch (Exception e)
    	{
    		output = "{\"status\":\"error\", \"data\":\"Error while inserting the Payments.\"}";
    		System.err.println(e.getMessage());
    	}
    	return output;
    }
    
    
    public String deletePayments(String PaymentID) 
	 { 
	 String output = ""; 
	 try
	 { 
	 Connection con = connect(); 
	 if (con == null) 
	 { 
	 return "Error while connecting to the database for deleting."; 
	 } 
	 // create a prepared statement
	 String query = "delete from Payment where PaymentID=?"; 
		PreparedStatement preparedStmt = con.prepareStatement(query); 
		// binding values
		preparedStmt.setInt(1, Integer.parseInt(PaymentID)); 
	 // execute the statement
	 preparedStmt.execute(); 
	 con.close(); 
	 String newPayments = readPayments(); 
	 output = "{\"status\":\"success\", \"data\": \"" + newPayments + "\"}"; 
	 } 
	 catch (Exception e) 
	 { 
	 output = "{\"status\":\"error\", \"data\": \"Error while deleting the item.\"}"; 
	 System.err.println(e.getMessage()); 
	 } 
	 return output; 
	 } 
    
    
    
    public String updatePayments(String PaymentID, String UserID,String PowerSupplierID, String Payment_Method, String Payment_Date, String Amount,String Type, String Consumption_Unit,String NoOfUnits) 

	{ 
		String output = ""; 
		String decodedate = java.net.URLDecoder.decode(Payment_Date);
		try
		{ 
			Connection con = connect(); 
			if (con == null) 
			{return "Error while connecting to the database for updating."; } 
			// create a prepared statement
			String query = "UPDATE Payment SET UserID=?,PowerSupplierID=?,Payment_Method=?,Payment_Date=?,Amount=?,Type=?,Consumption_Unit=?,NoOfUnits=? WHERE PaymentID=?"; 
			PreparedStatement preparedStmt = con.prepareStatement(query); 
			// binding values
			
			preparedStmt.setInt(1, Integer.parseInt(UserID));
			preparedStmt.setInt(2, Integer.parseInt(PowerSupplierID));
			preparedStmt.setString(3, Payment_Method); 
			preparedStmt.setString(4, decodedate);	
			preparedStmt.setDouble(5, Double.parseDouble(Amount));
			preparedStmt.setString(6, Type);
			preparedStmt.setInt(7, Integer.parseInt(Consumption_Unit));	
			preparedStmt.setInt(8, Integer.parseInt(NoOfUnits));
			preparedStmt.setInt(9, Integer.parseInt(PaymentID)); 
			// execute the statement
			preparedStmt.execute();
			con.close();
			String newUsers =  readPayments(); 
			 output = "{\"status\":\"success\", \"data\": \"" + 
			 newUsers + "\"}"; 
			 } 
			 catch (Exception e) 
			 { 
			 output = "{\"status\":\"error\", \"data\": \"Error while updating the Technician.\"}"; 
			 System.err.println(e.getMessage()); 
			 } 
			 return output; 
			 } 
    
    

}
