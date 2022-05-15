$(document).ready(function() {
    if ($('#alertSuccess').text().trim() == "") {
        $('#alertSuccess').hide();
    }

    $('#alertError').hide();
})

// SAVE
$(document).on("click", "#btnSave", function(event)
{
	// Clear alerts---------------------
	$("#alertSuccess").text("");
	$("#alertSuccess").hide();
	$("#alertError").text("");
	$("#alertError").hide();
	// Form validation-------------------
	var status = validateItemForm();
	if (status != true)
	{
		$("#alertError").text(status);
		$("#alertError").show();
		return;
	}
	// If valid------------------------
	var type = ($("#hidItemIDSave").val() == "") ? "POST" : "PUT";
	$.ajax(
	{
		url : "PaymentsAPI",
		type : type,
		data : $("#formPayment").serialize(),
		dataType : "text",
		complete : function(response, status)
		{
			onItemSaveComplete(response.responseText, status);
		}
	});
});

// UPDATE
//to identify the update button we didn't use an id we used a class
$(document).on("click", ".btnUpdate", function(event) 
{ 
    $("#hidItemIDSave").val($(this).data("itemid"));
    $("#PaymentID").val($(this).closest("tr").find('td:eq(0)').text());
    $("#UserID").val($(this).closest("tr").find('td:eq(1)').text());
    $("#PowerSupplierID").val($(this).closest("tr").find('td:eq(2)').text());
    $("#Payment_Method").val($(this).closest("tr").find('td:eq(3)').text());
   $("#Payment_Date").val((decodeURI($(this).closest("tr").find('td:eq(4)').text())));
	$("#Amount").val($(this).closest("tr").find('td:eq(5)').text());
	$("#Type").val($(this).closest("tr").find('td:eq(6)').text());
	$("#Consumption_Unit").val($(this).closest("tr").find('td:eq(7)').text());
	$("#NoOfUnits").val($(this).closest("tr").find('td:eq(8)').text());
});


//DELETE
$(document).on("click", ".btnRemove", function(event)
{
	$.ajax(
	{
		url : "PaymentsAPI",
		type : "DELETE",
		data : "PaymentID=" + $(this).data("itemid"),
		dataType : "text",
		complete : function(response, status)
		{
			onItemDeleteComplete(response.responseText, status);
		}
	});
});


function onItemSaveComplete(response, status)
{
	if (status == "success")
	{
		var resultSet = JSON.parse(response);
		if (resultSet.status.trim() == "success")
		{
			$("#alertSuccess").text("Successfully saved.");
			$("#alertSuccess").show();
			$("#divItemsGrid").html(resultSet.data);
		} 
		else if (resultSet.status.trim() == "error")
		{
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		}
	} else if (status == "error")
	{
		$("#alertError").text("Error while saving.");
		$("#alertError").show();
	} else
	{
		$("#alertError").text("Unknown error while saving..");
		$("#alertError").show();
	} 
	$("#hidItemIDSave").val("");
	$("#formPayment")[0].reset();
}


function onItemDeleteComplete(response, status)
{
	if (status == "success")
	{
		var resultSet = JSON.parse(response);
		if (resultSet.status.trim() == "success")
		{
			$("#alertSuccess").text("Successfully deleted.");
			$("#alertSuccess").show();
			$("#divItemsGrid").html(resultSet.data);
		} 
		else if (resultSet.status.trim() == "error")
		{
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		}
	} 
	else if (status == "error")
	{
		$("#alertError").text("Error while deleting.");
		$("#alertError").show();
	} 
	else
	{
		$("#alertError").text("Unknown error while deleting..");
		$("#alertError").show();
	}
}


// CLIENT-MODEL================================================================ 

function validateItemForm() { 
    
    
    
    
     
    return true; 
} 
 