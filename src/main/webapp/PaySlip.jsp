<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>PaySlip</title>
</head>
<style>
table{
border-style:solid;
width: 50%;
text-align: center;
font-family:sans-serif;
border-style: ridge;
}
.data{
text-align:left;
font-size:20px;


}
.data1{
text-align:left;
font-size:20px;
font-weight: bold;

}
.heading{
font-size:30px;
font-family:sans-serif;
}

.Ud{
font-size:2opx
}

</style>
<body>
<center>
	<jsp:useBean id="dao" class="Training.Infinite.Employ_PayRol.LeaveDAO"/>
	<c:set var="empno" value="${param.empno}"></c:set>
	<form action="">
	Employ No: 
	<input type="number" name="empno" value="${empno}" readonly="readonly"/><br/><br/>
	Month: 
		<select name="month">
			<option value="11">November</option>
			<option value="12">December</option>
		</select><br/><br/>
	<input type="submit" value="Submit"><br/><br/>
	
	</form>
	
<c:if test="${param.month!=null}">
	<c:set var="empno" value="${param.empno}"/>
	<c:set var="months" value="${param.month}"/>
	<c:set var="emp" value="${dao.searchById(empno)}"/>
	<jsp:useBean id="leave" class="Training.Infinite.Employ_PayRol.Leave"/>
	<c:set var="pay" value="${dao.lossPay(empno,months)}"/>
	<h1>---------------------------------------------------------------</h1>
</c:if>
<table border="2">
<thead>
  <tr>
    <th class="heading" colspan="4">Pay Slip</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td class="tg-0lax"><h4>Employ No </h4></td>
    <td class="Ud"><h4>${empno}</h4></td>
   
  </tr>
  <tr>
   <td class="tg-0lax"><h4>Employ Name </h4></td>
    <td class="Ud"><h4> ${emp.ename}</h4></td>
  </tr>
  <tr>
    <td class="tg-0lax"><h2>Earning</h2></td>
    <td class="tg-0lax"><h2>Deduction</h2></td>
  </tr>
  <tr>
    <td class="data">
    Basic:  ${emp.salary}<br/><br/>
    HAR:  ${emp.hra}<br/><br/>
    DA:  ${emp.da}<br/><br/>
    TA:  ${emp.ta}<br/><br/>
    </td>
     <td class="data">
     PF:  ${emp.pf}<br/><br/>
     TAX:  ${emp.tax}<br/><br/>
     Loss Of Pay:  ${pay}<br/><br/>
    </td>
  </tr>
   <tr>
    <td class="data1">
    Total Earning :  ${emp.gross}<br/><br/>
    </td>
     <td class="data1" >
    Total Deduction :${emp.pf+employ.tax+pay}<br/><br/>
    </td>
  </tr>
</tbody>
</table>


</center>
</body>
</html>