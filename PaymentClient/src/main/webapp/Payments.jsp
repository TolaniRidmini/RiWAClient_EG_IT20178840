v<%@page import="com.Payment"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%
if (session.getAttribute("Username") == null) {response.sendRedirect("index.jsp");}
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Payments Management</title>
	<link rel="stylesheet" href="Views/bootstrap.min.css">
	<script src="Components/jquery.min.js"></script>
	<script src="Components/payments.js"></script>
	<script src="Components/auth.js"></script>
</head>
<body>
	<div>
	<button id="btnLogout">LogOut</button>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-6">
				<h1>Payments Management</h1>
				<form id="formPayment" name="formPayment">
				PaymentID: <input id="PaymentID" name="PaymentID" type="text" class="form-control form-control-sm"> <br>
				UserID: <input id="UserID" name="UserID" type="text" class="form-control form-control-sm"> <br>
				PowerSupplierID: <input id="PowerSupplierID" name="PowerSupplierID" type="text" class="form-control form-control-sm"> <br>
				Payment Method: <input id="Payment_Method" name="Payment_Method" type="text" class="form-control form-control-sm"> <br>
				Payment Date: <input id="Payment_Date" name="Payment_Date" type="text" class="form-control form-control-sm"> <br>
				Amount: <input id="Amount" name="Amount" type="text" class="form-control form-control-sm"> <br>
				Type: <input id="Type" name="Type" type="text" class="form-control form-control-sm"> <br>
				Consumption Unit: <input id="Consumption_Unit" name="Consumption_Unit" type="text" class="form-control form-control-sm"> <br>
				Number Of Units: <input id="NoOfUnits" name="NoOfUnits" type="text" class="form-control form-control-sm"> <br>
				<input id="btnSave" name="btnSave" type="button" value="Save" class="btn btn-primary">
				<input type="hidden"	id="hidItemIDSave" name="hidItemIDSave" value="">
				</form>
				<div id="alertSuccess" class="alert alert-success"></div>
				<div id="alertError" class="alert alert-danger"></div>
				<br>
			<div id="divItemsGrid">
		<%
		Payment payObj = new Payment();
				out.print(payObj.readPayments());
		%>
		</div>
	</div>
	</div>
	</div>
</body>
</html>