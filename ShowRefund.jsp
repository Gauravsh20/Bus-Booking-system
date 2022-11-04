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
    <form method="get" action="ShowRefund.jsp">
      <jsp:useBean id="beanDao" class="com.infinite.bus.BusDAO"/>
      <table border="3" align="center">
        <tr>
          <th>RefundId</th>
          <th>PaymentId</th>
          <th>UserId</th>
          <th>WalletId</th>
          <th>Amount</th>
          <th>RefundDate</th>
          <th>RefundStatus</th>
         </tr>
         
         <c:forEach var="showRefund" items="${beanDao.showRefund(refund)}">
           <tr>
             <td><c:out value="${showRefund.refundId}"/></td>
             <td><c:out value="${showRefund.paymentId}"/></td>
             <td><c:out value="${showRefund.userId}"/></td>
             <td><c:out value="${showRefund.walletId}"/></td>
             <td><c:out value="${showRefund.amount}"/></td>
             <td><c:out value="${showRefund.refundDate}"/></td>
             <td><c:out value="${showRefund.refundStatus}"/></td>
            <tr> 
         
         </c:forEach>  
      </table>
    </form>
</body>
</html>