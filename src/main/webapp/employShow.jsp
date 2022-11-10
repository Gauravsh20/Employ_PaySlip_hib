<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee Table</title>
</head>
<body>
<center>
<h1>All The Employ's</h1>
	<jsp:useBean id="dao" class="Training.Infinite.Employ_PayRol.DAO"/>
	<table border=3>
		<tr>
			<th>Empno</th>
			<th>Ename</th>
			<th>Gender</th>
			<th>Salary</th>
			<th>Hra</th>
			<th>Da</th>
			<th>Ta</th>
			<th>Tax</th>
			<th>Pf</th>
			<th>Gross</th>
			<th>NetPay</th>
			<th>LeaveAvailable</th>
			<th>Apply Leave</th>
			<th>Pay Clip</th>
		</tr>
		<c:forEach var="employ" items="${dao.showEmploy() }">
			<tr>
				<td>${employ.empno }</td>
				<td>${employ.ename }</td>
				<td>${employ.gender }</td>
				<td>${employ.salary }</td>
				<td>${employ.hra }</td>
				<td>${employ.da }</td>
				<td>${employ.ta }</td>
				<td>${employ.tax }</td>
				<td>${employ.pf }</td>
				<td>${employ.gross }</td>
				<td>${employ.netPay }</td>
				<td>${employ.leaveAvailable }</td>
				<td><a href="applyleave.jsp?empno=${employ.empno}">Leave</a></td>
				<td><a href="PaySlip.jsp?empno=${employ.empno}">Clip</a></td>
				
			</tr>
		</c:forEach>
	</table>
</center>	
</body>
</html>