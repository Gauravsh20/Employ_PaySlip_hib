<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Employee</title>
</head>
<body>
	<center>
	<h1>Add Employ</h1>
	<form>
		Employ Name:
		<input type="text" name="ename"><br><br>

		Employ Gender:
		<select name="gender">
			<option disabled selected>Select your gender</option>
			<option value="MALE">Male</option>
			<option value="FEMALE">Female</option>
		</select><br><br>

		Employ Salary:
		<input type="text" name="salary"><br><br>

		<input type="submit" name="SUBMIT">
	</form>
	</center>
	<c:if test="${param.ename!= null }">
		<jsp:useBean id="dao" class="Training.Infinite.Employ_PayRol.DAO"/>
		<jsp:useBean id="employ" class="Training.Infinite.Employ_PayRol.Employ"/>
		<jsp:setProperty property="*" name="employ"/>
		<c:out value="${dao.addEmploy(employ) }"/>
	</c:if>
</body>
</html>