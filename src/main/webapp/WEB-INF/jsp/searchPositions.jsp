<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

<!--filter that can be used for employees to search for certain criteria, once search is selected, a listing of all positions 
meeting the selected filters will display on the table -->


<div class="position-card-container"
	style="background-image: url('img/opacWorkerCollageTwo.png')">

	<section class="filter-criteria">
		<p>
			<b>Filter Positions by:</b>
		</p>


		<c:url var="formAction" value="/filterPositions" />


		<!--Sending GET request to Postion controller -->

		<form class="filter-criteria-form" method="GET" action="${formAction}">

			<label class="search-position-label" for="benefits"><b>Benefits</b></label>
			<select name="benefits" id="benefits">
				<option value="">Select</option>
				<option value="healthBenefits">Health Benefits</option>
				<option value="retirementBenefits">Retirement Benefits</option>
				<option value="educationBenefits">Education Benefits</option>
			</select> <label class="search-position-label" for="areaOfCity"><b>Area
					Of City</b></label> <select name="areaOfCity" id="areaOfCity">
				<option value="">Select</option>
				<option value="North">North</option>
				<option value="Northeast">Northeast</option>
				<option value="Northwest">Northwest</option>
				<option value="East">East</option>
				<option value="Southeast">Southeast</option>
				<option value="South">South</option>
				<option value="Southwest">Southwest</option>
				<option value="West">West</option>
			</select> <label class="search-position-label" for="hourlyType"><b>Hourly
					Type</b></label> <select name="hourlyType" id="hourlyType">
				<option value="">Select</option>
				<option value="Part-time">Part-Time</option>
				<option value="Full-time">Full-Time</option>
			</select> <label class="search-position-label" for="shift"><b>Shift</b></label>
			<select name="shift" id="shift">
				<option value="">Select</option>
				<option value="1st">1st</option>
				<option value="2nd">2nd</option>
				<option value="3rd">3rd</option>
			</select> <label class="search-position-label" for="hireType"><b>Hire
					Type</b></label> <select name="hireType" id="hireType">
				<option value="">Select</option>
				<option value="Permanent">Permanent</option>
				<option value="Temporary">Temporary</option>
				<option value="Temp-to-Hire">Temp-to-Hire</option>
				<option value="Seasonal">Seasonal</option>
			</select> <label class="search-position-label" for="secondChanceEmployer"><b>Second
					Chance Employer </b></label> <select name="secondChanceEmployer"
				id="secondChanceEmployer">
				<option value="">Select</option>
				<option value="true">Yes</option>
				<option value="false">No</option>
			</select>

			<button type="submit" class="filter-button">Search</button>
			<a href="/searchPositions"><button
					class="filter-button remove-filter">Clear Filter</button></a>

		</form>
		
		<c:choose>
		<c:when test="${positions.size() == 0}">
			<div class="card-error">
				<h2 id="filter-h2">No results for search criteria selected! Please try again.</h2>
			</div>
		</c:when>

	</c:choose>
	</section>

	<%-- <c:choose>
		<c:when test="${positions.size() == 0}">
			<div class="card-error">
				<h2 id="filter-h2">No results for search criteria selected! Please try again.</h2>
			</div>
		</c:when>

	</c:choose> --%>

	<c:forEach items="${positions}" var="position">



		<div class="available-positions-card">

			<div class="titleAndLogo">

				<h1 id="job-title">${position.jobTitle}</h1>
				<c:url var="logo" value="/img/${position.employerId}.jpg" />
				<img class="companyLogo" src="${logo}">
			</div>


			<p>
				<b>Company Name:</b> ${position.employerName}
			</p>
			<p>
				<b>Job Description:</b> ${position.jobDescription}
			</p>

			<div>
				<b>Area of City:</b> ${position.areaOfCity}
			</div>
			<div>
				<b>Hourly Rate: </b> $${position.hourlyRate}
			</div>
			<div>
				<b>Type: </b> ${position.hourlyType}
			</div>
			<div>
				<b>Hiring For: </b> ${position.hireType}
			</div>
			<div>
				<b>Shift: </b> ${position.shift}
			</div>
			<div>
				<b>Benefits Offered: </b>
				<c:choose>
					<c:when test="${position.healthBenefits}">
					 		Health
					 	</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${position.retirementBenefits}">
					 		Retirement
					 	</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${position.educationBenefits}">
					 		Education
					 	</c:when>
				</c:choose>
				<c:if
					test="${!position.educationBenefits and !position.healthBenefits and !position.retirementBenefits}">
						None
					</c:if>
			</div>
			<div>
				<b>Second Chance Employer: </b>
				<c:choose>
					<c:when test="${position.secondChanceEmployer}">
					 		Yes
					 	</c:when>
					<c:otherwise>
					 		No
					 	</c:otherwise>
				</c:choose>
			</div>

			<div>
				<b>Additional Information:</b> ${position.otherComments}
			</div>
			<button class="apply-button">Apply Now</button>
		</div>

	</c:forEach>

</div>

<script src="js/script.js"></script>

<c:import url="/WEB-INF/jsp/footer.jsp" />