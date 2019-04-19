<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:import url="/WEB-INF/jsp/header.jsp">
	<c:param name="subTitle" value="EmpowerBus Registration" />
</c:import>

<!-- This page is not being used, but is working  -->


<!-- <script type="text/javascript">
	//throwing error on line 4 $ is not defined
	$(document).ready(function () {
		$.validator.addMethod('capitals', function(thing){
			return thing.match(/[A-Z]/);
		});
		$("form").validate({
			
			rules : {
				userName : {
					required : true
				},
				password : {
					required : true,
					//change back to 15
					minlength: 3,
					capitals: true,
				},
				confirmPassword : {
					required : true,		
					equalTo : "#password"  
				}
			},
			messages : {			
				password: {
					minlength: "Password too short, make it at least 15 characters",
					capitals: "Field must contain a capital letter",
				},
				confirmPassword : {
					equalTo : "Passwords do not match"
				}
			},
			errorClass : "error"
		});
	});
</script> -->

<!-- Found in  -->

<c:url var="formAction" value="/users" />
<form:form method="POST" action="${formAction}" modelAttribute="user">
	<form:errors path="*" cssClass="error" />
	<div class="form-group">
		<%-- 		<input type="hidden" name="userName" value="${user.userName}"/> 
 --%>
		<label for="userName">User Name: </label> <input type="text"
			id="userName" name="userName" placeHolder="User Name"
			class="form-control" />
	</div>
	<div class="form-group">
		<label for="password">Password: </label> <input type="password"
			id="password" name="password" placeHolder="Password"
			class="form-control" />
	</div>
	<div class="form-group">
		<label for="confirmPassword">Confirm Password: </label> <input
			type="password" id="confirmPassword" name="confirmPassword"
			placeHolder="Re-Type Password" class="form-control" />
	</div>
	<div class="form-group">
		<label class="add-position-label"><b>User Type:</b></label> <br>

		<!-- Sets role value to DB. Changed to checkboxes for uniformity -->
		<div class="checkbox-role">
			<c:set var="role" value="" />
			<input type="checkbox" id="role" name="role" value="employer"
				path="role"><label>Employer&nbsp&nbsp</label> <input
				type="checkbox" id="role" name="role" value="jobSeeker" path="role"><label>Job
				Seeker&nbsp&nbsp </label> <input type="checkbox" id="role" name="role"
				value="admin" path="role"><label>Administrator&nbsp&nbsp
			</label>
		</div>
		<button type="submit" class="btn btn-primary">Create User</button>
		</form>
	</div>
</form:form>



}


<c:import url="/WEB-INF/jsp/footer.jsp" />

