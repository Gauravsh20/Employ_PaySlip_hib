<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Take Leave</title>
</head>
<body>
<center>
<c:set var="empno" value="${param.empno}"></c:set>
 <h1>Apply Leave</h1>
	<form>
		Employ Number:
		<input type="text" name="empno" value="${empno}"><br><br>

		Leave Start Date:
		<input type="date" name="startDate"><br><br>

		Leave End Date:
		<input type="date" name="endDate"><br><br>

		Leave Reason:
		<textarea name="leaveReason"></textarea><br><br>
		
		<input type="submit" value="SUBMIT">
	</form>
	</center>
	<c:if test="${param.leaveReason!= null }">
		<jsp:useBean id="dao" class="Training.Infinite.Employ_PayRol.LeaveDAO"/>
		<jsp:useBean id="leave" class="Training.Infinite.Employ_PayRol.Leave"/>
		
		<fmt:parseDate value="${param.startDate}" pattern="yyyy-MM-dd" var="startDate"/>		
		<jsp:setProperty property="startDate" name="leave" value="${dao.convertDate(startDate) }"/>
		
		<fmt:parseDate value="${param.endDate}" pattern="yyyy-MM-dd" var="endDate"/>
		<jsp:setProperty property="endDate" name="leave" value="${dao.convertDate(endDate) }"/>

		<jsp:setProperty property="empno" name="leave" value="${param.empno }"/>
		<jsp:setProperty property="leaveReason" name="leave" value="${param.leaveReason }"/>
		<c:out value="${dao.addLeave(leave)}"/>
	</c:if>
</body>
</html>