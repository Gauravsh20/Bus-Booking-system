<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
body{
 background-color: lightblue;

}
table {
	 border-collapse: collapse;
}
.heading{
text-align:center;
font-family: cursive;
}
th, td {
  padding: 8px;
  text-align: center;
  border-bottom: 1px solid #ddd;
}

tr:hover {

background-color: #3DCE65;
}

th {
  background-color: #04AA6D;
  color: white;
}


</style>
<body>
     <form method="get" action="ShowBus.jsp">
        <jsp:useBean id="beanDao" class="com.infinite.bus.BusDAO"/>
          <div class="heading">
          <h1>Show All Bus's</h1>  
          </div>
          
               
         <table border="3" align="center">
            <tr>
              <th>BusId</th>
              <th>BusNo</th>
              <th>UserId</th>
              <th>BusType</th>
              <th>ServiesType</th>
              <th>NoOf Seats</th>
            </tr>
           <c:forEach var="showBus" items="${beanDao.showBus(bus)}" >
              <tr>
                 <td><c:out value="${showBus.busId}"/></td>
                 <td><c:out value="${showBus.busNo}"/></td>
                 <td><c:out value="${showBus.userId}"/></td>
                 <td><c:out value="${showBus.busType}"/></td>
                 <td><c:out value="${showBus.serviesType}"/></td>
                 <td><c:out value="${showBus.noOfSeats}"/></td>
              </tr>
           </c:forEach>   
         </table>
   
     </form>
</body>
</html>