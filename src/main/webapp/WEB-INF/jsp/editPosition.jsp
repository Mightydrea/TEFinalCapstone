<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:import url="/WEB-INF/jsp/header.jsp" />


<div class="add-position-form-page"
	style="background-image: url('img/ColumbusSkyline.jpg')">

	<h2>Edit Position</h2>

	<div class="add-position-form ">

		<c:url var="formAction" value="/editPosition" />

		<!--Sends Post to the employer controller  -->

		<form:form method="POST" action="${formAction}"
			modelAttribute="position">
			<form:errors path="*" cssClass="error" />


			<!--Type is hidden so correct postion is updated into the database  -->

			<form:input type="hidden" name="employerId"
				value="${position.employerId}" path="employerId" />
			<form:input type="hidden" name="positionId"
				value="${position.positionId}" path="positionId" />

			<label class="add-position-label" for="jobTitle">Job Title<span>*</span></label>
			<form:input value="${position.jobTitle}" size="30" path="jobTitle" />


			<label class="add-position-label" for="hourlyRate">Hourly
				Rate<span>*</span>
			</label>
			<form:input value="${position.hourlyRate}" size="9"
				placeholder="00.00" path="hourlyRate" />


			<label class="add-position-label"><b>Select Benefits:</b></label>
			<br>
			<input type="checkbox" name="healthBenefits" path="healthBenefits">
			<label>Health</label>
			<input type="checkbox" name="retirementBenefits"
				path="retirementBenefits">
			<label>Retirement</label>
			<input type="checkbox" name="educationBenefits"
				path="educationBenefits">
			<label>Education</label>


			<label class="add-position-label" for="areaOfCity">Area Of
				City<span>*</span>
			</label>
			<select name="areaOfCity" id="areaOfCity">
				<option value="${position.areaOfCity}">${position.areaOfCity}</option>
				<option value="North">North</option>
				<option value="Northeast">Northeast</option>
				<option value="East">East</option>
				<option value="Southeast">Southeast</option>
				<option value="South">South</option>
				<option value="Southwest">Southwest</option>
				<option value="West">West</option>
				<option value="Northwest">northwest</option>
			</select>

			<!--Bringing the saved value from DB  -->
			<label class="add-position-label" for="hourlyType">Hourly
				Type<span>*</span>
			</label>
			<select name="hourlyType" id="hourlyType">
				<option value="${position.hourlyType}">${position.hourlyType}</option>
				<option value="Part-time">Part-Time</option>
				<option value="Full-time">Full-Time</option>
			</select>


			<label class="add-position-label" for="shift">Shift<span>*</span></label>
			<select name="shift" id="shift">
				<option value="${position.shift}">${position.shift}</option>
				<option value="1st">1st</option>
				<option value="2nd">2nd</option>
				<option value="3rd">3rd</option>
			</select>

			<label class="add-position-label" for="hireType">Hire Type<span>*</span></label>
			<select name="hireType" id="hireType">
				<option value="${position.hireType}">${position.hireType}</option>
				<option value="Permanent">Permanent</option>
				<option value="Temporary">Temporary</option>
				<option value="Temp-to-hire">Temporary-to-Hire</option>
				<option value="Seasonal">Seasonal</option>
			</select>


			<label class="add-position-label" for="jobDescription">Job
				Description<span>*</span>
			</label>
			<form:textarea value="${position.jobDescription}" class="text-area"
				path="jobDescription" />


			<label class="add-position-label" for="otherComments"><b>Preferred
					Requisites</b><span></span></label>
			<form:textarea class="text-area" path="otherComments" />
			<h6>
				<span>*</span>Denotes a required field
			</h6>

			<div class="button-style">
				<button type="submit">Save</button>
				<c:url var="employerPositionsURL" value="/employerPositions" />

				<a href="${employerPositionsURL}"><button type="button">Cancel</button></a>

			</div>

		</form:form>
	</div>
</div>













<c:import url="/WEB-INF/jsp/footer.jsp" />