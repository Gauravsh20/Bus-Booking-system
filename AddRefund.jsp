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
    <h1>Refund Details</h1>
    <form method="get" action="AddRefund.jsp">
      Payment Id  :
       <input type="text" name="paymentId"/> <br/><br/>
      User Id :
       <input type="text" name="userId"/> <br/><br/>
      Wallet Id :
       <input type="text" name="walletId"/> <br/><br/>
      Amount :
        <input type="number" name="amount"/> <br/><br/>
      Refund Date :
        <input type="date" name="refundDate"/> <br/><br/>
      Refund Status :
          <select name="refundStatus">
		       <option value="PENDING">PENDING</option>
		       <option value="SUCCESSFULL">SUCCESSFULL</option>
		       <option value="FILED">FILED</option>   
		    </select>  <br/><br/> 
		<input type="submit" value="Add Refund"/>                
    </form>
    <c:if test="${param.paymentId!=null}">
     <jsp:useBean id="beanDao" class="com.infinite.bus.BusDAO"/>
     <jsp:useBean id="refund" class="com.infinite.bus.Refund"/>
     <c:set var="rdate" value="${beanDao.ConvertDate(param.refundDate)}"/>
     <jsp:setProperty property="paymentId" name="refund" value="${param.paymentId}"/>
     <jsp:setProperty property="userId" name="refund" value="${param.userId}"/>
     <jsp:setProperty property="walletId" name="refund" value="${param.walletId}"/>
     <jsp:setProperty property="amount" name="refund" value="${param.amount}"/>
     <jsp:setProperty property="refundDate" name="refund" value="${rdate}"/>
     <jsp:setProperty property="refundStatus" name="refund" value="${param.refundStatus}"/>
     
     <c:out value="${beanDao.addRefund(refund)}"/>
    </c:if>
</body>
</html>