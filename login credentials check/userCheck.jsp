<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="userCheck.jsp" method="post">
User Name:
<input type="text" name="username" /> <br/><br/> 
Password:
<input type="password" name="password" /> <br/><br/>
<input type="submit" value="Login" />
</form>

<c:if test="${param.username!=null &&param.password!=null}"/>
<jsp:useBean id="users" class="infinite.BusBooking.User"/>
<jsp:setProperty property="*" name="users"/>
<jsp:useBean id="dao" class="infinite.BusBooking.UserDAO"/>
<c:set var="user" value="${param.username}"/>
<c:set var="pwd" value="${param.password }"/>
<c:set var="cnt" value="${dao.checkUsers(user,pwd)}"/>
<c:if test="${cnt==1}">
	<c:out value="Valid Credentials"/>
</c:if>
<c:if test="${cnt==0}">
<c:out value="Invalid Credentials"></c:out>
</c:if>
</body>
</html>