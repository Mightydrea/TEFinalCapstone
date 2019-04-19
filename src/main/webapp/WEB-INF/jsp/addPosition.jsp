<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

<div class="add-position-form-page"
	style="background-image: url('img/ColumbusSkyline.jpg')">
	<h2>Add New Position</h2>

	<div class="add-position-form ">
		<c:url var="formAction" value="/addPosition" />

		<!-- Sends a post to the postion controller of the add postion form -->

		<form:form method="POST" action="${formAction}"
			modelAttribute="position">
			<form:errors path="*" cssClass="error" />


			<form:input type="hidden" name="employerId"
				value="${user.employerId}" path="employerId" />

			<label class="add-position-label" for="jobTitle"><b>Job
					Title</b><span>*</span></label>
			<form:input size="30" path="jobTitle" />


			<label class="add-position-label"><b>Select Benefits:</b></label>
			<br>
			<input type="checkbox" name="healthBenefits" path="healthBenefits">
			<label>Health&nbsp&nbsp</label>
			<input type="checkbox" name="retirementBenefits"
				path="retirementBenefits">
			<label>Retirement&nbsp&nbsp </label>
			<input type="checkbox" name="educationBenefits"
				path="educationBenefits">
			<label>Education&nbsp&nbsp </label>



			<label class="add-position-label" for="areaOfCity"><b>Area
					Of City</b><span>*</span></label>
			<select name="areaOfCity" id="areaOfCity">
				<option value="">Select</option>
				<option value="North">North</option>
				<option value="Northeast">Northeast</option>
				<option value="Northwest">Northwest</option>
				<option value="East">East</option>
				<option value="Southeast">Southeast</option>
				<option value="South">South</option>
				<option value="Southwest">Southwest</option>
				<option value="West">West</option>
			</select>


			<label class="add-position-label" for="hourlyRate"><b>Hourly
					Rate</b><span>*</span></label>
			<form:input size="9" placeholder="00.00" path="hourlyRate" />

			<br>
			<label class="add-position-label" for="hourlyType"><b>Hourly
					Type</b><span>*</span></label>
			<select name="hourlyType" id="hourlyType">
				<option value="">Select</option>
				<option value="Part-time">Part-Time</option>
				<option value="Full-time">Full-Time</option>
			</select>


			<label class="add-position-label" for="shift"><b>Shift</b><span>*</span></label>
			<select name="shift" id="shift">
				<option value="">Select</option>
				<option value="1st">1st</option>
				<option value="2nd">2nd</option>
				<option value="3rd">3rd</option>
			</select>

			<label class="add-position-label" for="hireType"><b>Hire
					Type</b><span>*</span></label>
			<select name="hireType" id="hireType">
				<option value="">Select</option>
				<option value="Permanent">Permanent</option>
				<option value="Temporary">Temporary</option>
				<option value="Temp-to-hire">Temporary To Hire</option>
				<option value="Seasonal">Seasonal</option>
			</select>
			<br>
			<label><b>Second Chance Employer </b></label>
			<input type="checkbox" name="secondChanceEmployer"
				path="secondChanceEmployer">
			<br>
			<label class="add-position-label" for="jobDescription"><b>Job
					Description</b><span>*</span></label>
			<form:textarea class="text-area" path="jobDescription" />

			<label class="add-position-label" for="otherComments"><b>Preferred
					Requisites</b><span></span></label>
			<form:textarea class="text-area" path="otherComments" />
			<h6>
				<span>*</span>Denotes a required field
			</h6>



			<div class="button-style">
				<button type="submit">Submit</button>
				<button type="reset">Reset</button>

			</div>

		</form:form>
	</div>
</div>

<c:import url="/WEB-INF/jsp/footer.jsp" />