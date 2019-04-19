<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Password</title>
</head>
<body>

<form:form method="POST" action="${formAction}">
		<form:errors path="*" cssClass="error"/>
 
 <div class="add-position-form-page" style="background-image: url('img/ColumbusSkyline.jpg')">
	
	<h2>EmpowerBus Password Reset</h2>
	
	
Username: <input type="text" name="user"><br>
New Password: <input type="password" name="password">
Confirm New Password: <input type="password" name="password">


<c:url var="updatePasswordURL" value="/updatePassword" />
<a class="update-password" href="${updatePasswordURL}"><button type="button">Update</button></a>

</div>
</form:form>
	

</body>
</html> --%>