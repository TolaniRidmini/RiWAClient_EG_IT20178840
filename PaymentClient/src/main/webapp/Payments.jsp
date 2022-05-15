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
	 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="Components/jquery.min.js"></script>
	<script src="Components/payments.js"></script>
	<script src="Components/auth.js"></script>
</head>
<body>
	<div>
	<button id="btnLogout" class="btn btn-dark">
	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box-arrow-left" viewBox="0 0 16 16">
	  <path fill-rule="evenodd" d="M6 12.5a.5.5 0 0 0 .5.5h8a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 0-.5-.5h-8a.5.5 0 0 0-.5.5v2a.5.5 0 0 1-1 0v-2A1.5 1.5 0 0 1 6.5 2h8A1.5 1.5 0 0 1 16 3.5v9a1.5 1.5 0 0 1-1.5 1.5h-8A1.5 1.5 0 0 1 5 12.5v-2a.5.5 0 0 1 1 0v2z"/>
	  <path fill-rule="evenodd" d="M.146 8.354a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L1.707 7.5H10.5a.5.5 0 0 1 0 1H1.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3z"/>
	</svg>&nbsp
	LogOut
	</button>
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
				<input id="btnSave" name="btnSave" type="button" value="Save" class="btn btn-success">
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
	 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>