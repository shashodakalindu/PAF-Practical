$(document).ready(function() {
	if ($("#alertSuccess").text().trim() == "") {
		$("#alertSuccess").hide();
	}
	$("#alertError").hide();
});
// SAVE ============================================
$(document).on("click", "#btnSave", function(event) {
	// Clear alerts---------------------
	$("#alertSuccess").text("");
	$("#alertSuccess").hide();
	$("#alertError").text("");
	$("#alertError").hide();

	// Form validation-------------------
	var status = validatePatientForm();
	if (status != true) {
		$("#alertError").text(status);
		$("#alertError").show();
		return;
	}
	// If valid------------------------
	var type = ($("#hidPatientIDSave").val() == "") ? "POST" : "PUT";

	$.ajax({
		url : "PatientsAPI",
		type : type,
		data : $("#formPatient").serialize(),
		dataType : "text",
		complete : function(response, status) {
			onPatientSaveComplete(response.responseText, status);
		}
	});
});


//UPDATE==========================================
function onPatientSaveComplete(response, status) {
	if (status == "success") {
		
		var resultSet = JSON.parse(response);
		
		if (resultSet.status.trim() == "success") {
			$("#alertSuccess").text("Successfully saved.");
			$("#alertSuccess").show();
			
			$("#divPatientsGrid").html(resultSet.data);
		} else if (resultSet.status.trim() == "error") {
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		}
	} else if (status == "error") {
		$("#alertError").text("Error while saving.");
		$("#alertError").show();
	} else {
		$("#alertError").text("Unknown error while saving..");
		$("#alertError").show();
	}
	$("#hidPatientIDSave").val("");
	$("#formPatient")[0].reset();
}

$(document).on("click", ".btnRemove", function(event) {
	$.ajax({
		url : "PatientsAPI",
		type : "DELETE",
		data : "patientID=" + $(this).data("patientid"),
		dataType : "text",
		complete : function(response, status) {
			onPatientDeleteComplete(response.responseText, status);
		}
	});
});

//DELETE==========================================
function onPatientDeleteComplete(response, status) {
	if (status == "success") {
		var resultSet = JSON.parse(response);
		if (resultSet.status.trim() == "success") {
			$("#alertSuccess").text("Successfully deleted.");
			$("#alertSuccess").show();
			$("#divPatientsGrid").html(resultSet.data);
		} else if (resultSet.status.trim() == "error") {
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		}
	} else if (status == "error") {
		$("#alertError").text("Error while deleting.");
		$("#alertError").show();
	} else {
		$("#alertError").text("Unknown error while deleting..");
		$("#alertError").show();
	}
}

// UPDATE==========================================
$(document).on(
		"click",
		".btnUpdate",
		function(event) {
			$("#hidPatientIDSave").val(
					$(this).closest("tr").find('#hidPatientIDUpdate').val());
			$("#patientName").val($(this).closest("tr").find('td:eq(0)').text());
			$("#patientAge").val($(this).closest("tr").find('td:eq(1)').text());
			$("#patientAddress").val($(this).closest("tr").find('td:eq(2)').text());
			$("#patientPhone").val($(this).closest("tr").find('td:eq(3)').text());
			$("#patientGender").val($(this).closest("tr").find('td:eq(4)').text());
			$("#patientNotes").val($(this).closest("tr").find('td:eq(5)').text());
		});

// CLIENTMODEL=========================================================================
function validatePatientForm() {
	// NAME
	if ($("#patientName").val().trim() == "") {
		return "Insert Patient Name.";
	}
	// AGE
	if ($("#patientAge").val().trim() == "") {
		return "Insert Patient Age.";
	}
	// ADDRESS-------------------------------
	if ($("#patientAddress").val().trim() == "") {
		return "Insert Patient Address.";
	}
	// PHONE-------------------------------
	if ($("#patientPhone").val().trim() == "") {
		return "Insert Patient Phone.";
	}
	// GENDER-------------------------------
	if ($("#patientGender").val().trim() == "") {
		return "Insert Patient Gender.";
	}
	// is numerical value
	var tmpPhone = $("#patientPhone").val().trim();
	if (!$.isNumeric(tmpPhone)) {
		return "Insert a numerical value for Patient Phone.";
	}
	/*// convert to decimal price
	$("#itemPrice").val(parseFloat(tmpPrice).toFixed(2));*/
	// DESCRIPTION------------------------
	if ($("#patientNotes").val().trim() == "") {
		return "Insert Patient Notes.";
	}
	return true;
}
