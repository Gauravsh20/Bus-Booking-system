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
	<body>
 <h1>Booking </h1>
     <form method="post" action="Booking.jsp">
        Schedule Id :
            <input type="text" name="scheduleId"/> <br/><br/> 
         User ID :
            <input type="text" name="userId"/> <br/><br/>  
          Fare Amount:
          <input type="number" name="fareAmount"/> <br/><br/>  
          Total Amount:
          <input type="number" name="totalAmount"/> <br/><br/> 
           Seat No:
           <input type="number" name="seatNo"/> <br/><br/>  
           
                      <input type="submit"  value="Book"/>
            <c:if test="${param.fareAmount!=null}">
      <jsp:useBean id="Dao" class="vijaypc.BusBooking.BookingDAO"/>
      <jsp:useBean id="book" class="vijaypc.BusBooking.Booking"/>
      
     
       <jsp:setProperty property="scheduleId" name="book" value="${param.scheduleId}"/>
     <jsp:setProperty property="userId" name="book" value="${param.userId}"/>
     <jsp:setProperty property="fareAmount" name="book" value="${param.fareAmount}"/>
     <jsp:setProperty property="totalAmount" name="book" value="${param.totalAmount}"/>
     <jsp:setProperty property="seatNo" name="book" value="${param.seatNo}"/>
      
      <c:out value="${Dao.addBooking(book)}"/>
</c:if>
</body>
</body>
</html>