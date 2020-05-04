
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.Patient"%>

<!DOCTYPE htmlt>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Patients Management</title>
<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Components/jquery-3.4.0.min.js"></script>
<script src="Components/patients.js"></script>
</head>
<body>

	<div class="container">
		<div class="row">
			<div class="col-6">


				<h1>Patients Management </h1>

				<form id="formPatient" name="formPatient" method="post" action="patients.jsp">
					Patient name : <input id="patientName" name="patientName" type="text"
						class="form-control form-control-sm"> <br> 
					Patient age : <input id="patientAge" name="patientAge" type="text"
						class="form-control form-control-sm"> <br> 
					Patient address : <input id="patientAddress" name="patientAddress" type="text"
						class="form-control form-control-sm"> <br> 
					Patient phone : <input id="patientPhone" name="patientPhone" type="text"
						class="form-control form-control-sm"> <br>
					Patient gender : <input id="patientGender" name="patientGender" type="text"
						class="form-control form-control-sm"> <br>
					Patient notes : <input id="patientNotes" name="patientNotes" type="text"
						class="form-control form-control-sm"> <br>
					
					 <input id="btnSave" name="btnSave" type="button" value="Save"
						class="btn btn-primary"> <input type="hidden"
						id="hidPatientIDSave" name="hidPatientIDSave" value="">
				</form>

				<div id="alertSuccess" class="alert alert-success"></div>
				<div id="alertError" class="alert alert-danger"></div>
				<br>
				<div id="divPatientsGrid">
					<%
						Patient patientObj = new Patient();
					out.print(patientObj.readPatients());
					%>
				</div>
</body>
</html>