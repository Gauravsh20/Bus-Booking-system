
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
<form action="" method="get">
	
	user ID:
	<input type="text" name="userId"/><br/><br/>
	Wallet ID:
	<input type="text" name="walletId"/><br/><br/>
	Booking ID:
	<input type="text" name="bookingId"/><br/><br/>
	Amount:
	<input type="number" name="amount"/><br/><br/>
	
	DateOfBooking:
	<input type="date" name="paymentDate"/><br/><br/>
	
	Payment Status:
	<select name="paymentStatus">
	<option value="PENDING">PENDING</option>
	<option value="SUCCESSFULL">SuccessFull</option>
	<option value="FILED">FILED</option>
	
	</select>
	<input type="submit" value="pay"/>
</form>
<c:if test="${param.userId!=null }">
<jsp:useBean id="pay" class="vijaypc.BusBooking.PaymentDetail"/>
<jsp:useBean id="dao" class="vijaypc.BusBooking.PaymentDAO"/>
<jsp:setProperty property="userId" name="pay"/>
<jsp:setProperty property="walletId" name="pay"/>
<jsp:setProperty property="bookingId" name="pay"/>
<jsp:setProperty property="amount" name="pay"/>
<c:set var="strDate" value="${param.paymentDate}"/>
<c:set var="sqldt" value="${dao.convertDate(strDate)}"/>
<c:out value="${sqldt}"/>
<jsp:setProperty property="paymentDate" name="pay" value="${sqldt}"/>
<jsp:setProperty property="paymentStatus" name="pay"/>
<c:out value="${dao.addPayment(pay)}"/>
</c:if>

</body>
</html>