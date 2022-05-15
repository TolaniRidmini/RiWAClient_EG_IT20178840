package com;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

/**
 * Servlet implementation class ItemsAPI
 */
@WebServlet("/PaymentsAPI")
public class PaymentsAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	Payment PaymentObj = new Payment();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentsAPI() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String output = PaymentObj.insertPayments(request.getParameter("PaymentID"),
				request.getParameter("UserID"),
				request.getParameter("PowerSupplierID"),
				request.getParameter("Payment_Method"),
				request.getParameter("Payment_Date"),
				request.getParameter("Amount"),
				request.getParameter("Type"),
				request.getParameter("Consumption_Unit"),
				request.getParameter("NoOfUnits"));
		
		response.getWriter().write(output);
	}
	
	/**
	 * @see HttpServlet#doPut(HttpServletRequest, HttpServletResponse)
	 */
	
	
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map paras = getParasMap(request);
		String output = PaymentObj.updatePayments(paras.get("PaymentID").toString(),
		paras.get("UserID").toString(),
		paras.get("PowerSupplierID").toString(),
		paras.get("Payment_Method").toString(),
		paras.get("Payment_Date").toString(),
		paras.get("Amount").toString(),
		paras.get("Type").toString(),
		paras.get("Consumption_Unit").toString(),
		paras.get("NoOfUnits").toString());
		response.getWriter().write(output);
	}
	

	/**
	 * @see HttpServlet#doDelete(HttpServletRequest, HttpServletResponse)
	 */
	
	
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map paras = getParasMap(request);
		String output = PaymentObj.deletePayments(paras.get("PaymentID").toString());
		response.getWriter().write(output);
	}
	
	
	private static Map getParasMap(HttpServletRequest request)
	{
		Map<String, String> map = new HashMap<String, String>();
		try
		{
			Scanner scanner = new Scanner(request.getInputStream(), "UTF-8");
			String queryString = scanner.hasNext() ? scanner.useDelimiter("\\A").next() : "";
			scanner.close();
			String[] params = queryString.split("&");
			for (String param : params)
			{
				String[] p = param.split("=");
				map.put(p[0], p[1]);
			}
			}
		catch (Exception e)
		{
			
		}
		return map;
	}


}
