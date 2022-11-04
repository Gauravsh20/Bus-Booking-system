<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<c:set var="x" value="Prasanna"/>
<c:out value="${x}"/>
	<h1>User Details</h1>
	<form method="get" action="">
		
			User Id :
			<input type="text" name="userid"/> <br/><br/>
		
			Full Name :
		    <input type="text" name="fullname"/> <br/><br/>
		
			Contact No :
			<input type="text" name="contactno"/> <br/><br/>
		
			Email Address :
			<input type="text" name="emailaddress"/> <br/><br/>
		
			User Name :
			<input type="text" name="username"/> <br/><br/>
		
			Password :
			<input type="password" name="password"/> <br/><br/>
		
		<input type="submit" value="Submit" />
	</form>
	<c:if test="${param.userid!=null}">
		<jsp:useBean id="beanDao" class="com.infinite.hib.UserDAO"/>
		<jsp:useBean id="users" class="com.infinite.hib.User"/>
		<jsp:setProperty property="*" name="users"/>
		<c:out value="${beanDao.Adduser(users)}"/>
		<p>Working</p>
	</c:if>
	
</body>
</html>