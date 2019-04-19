<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:import url="/WEB-INF/jsp/header.jsp">
	<c:param name="subTitle" value="EmpowerBus Login" />
</c:import>

<div class="background-img">

	<div class="login-page"
		style="background-image: url('img/ColumbusSkyline.jpg')">



		<%-- <input type="hidden" name="destination" value="${param.destination}" /> --%>

		<div class="login-card">

			<!-- Sends Post to authentication controller -->

			<form:form method="POST" action="${formAction}" modelAttribute="user">
				<h2 id="login-title">User Login</h2>
				<br>
				<h6 class="error">${error}</h6>
				<c:url var="formAction" value="/login" />
				<br>

				<label for="userName">User Name: <span class="form_required"></span>
				</label>
				<input type="text" id="userName" name="userName"
					class="form-control" />
				<div class="form-group">
					<label for="password">Password: <span class="form_required"></span>
					</label> <input type="password" id="password" name="password"
						class="form-control" />

				</div>
				<button type="submit" class="btn btn-primary">Login</button>

				<!-- This can be used for user to reset password, functionality still needs built -->
				<%-- <c:url var="formAction" value="/capstone/updatePassword" />
	Forgot password? <a href="/updatePassword">Click Here</a> --%>
			</form:form>
		</div>

	</div>
</div>



<c:import url="/WEB-INF/jsp/footer.jsp" />
