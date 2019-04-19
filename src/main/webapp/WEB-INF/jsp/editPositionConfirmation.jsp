<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

<div class="confirmation-page"
	style="background-image: url('img/ColumbusSkyline.jpg')">
	<h1>Edit Position Confirmation</h1>

	<h4>
		You have successfully updated <b>${position.jobTitle}</b>
	</h4>

	<div class="confirmation-data">
		<p>
			<b>Benefits:</b>
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
		</p>
		<p>
			<b>Area of City:</b> ${position.areaOfCity}
		</p>
		<p>
			<b>Hourly Rate:</b> ${position.hourlyRate}
		</p>
		<p>
			<b>Hourly Type:</b> ${position.hourlyType}
		</p>
		<p>
			<b>Shift:</b> ${position.shift}
		</p>
		<p>
			<b>Hire Type:</b> ${position.hireType}
		</p>
		<p>
			<b>Second Chance Employer:</b>
			<c:choose>
				<c:when test="${position.secondChanceEmployer}">
					 		Yes
					 	</c:when>
				<c:otherwise>
					 		No
					 	</c:otherwise>
			</c:choose>
		</p>
		<p>
			<b>Job Description:</b>${position.jobDescription}</p>
		<p>
			<b>Preferred Requisites:</b> ${position.otherComments}
		</p>

		<div class="confirmation-button-container">
			<c:url var="homeURL" value="/" />
			<a href="${homeURL}"><button class="confirmation-button-style"
					type="button">Finished</button></a>
			<c:url var="employerPositionsURL" value="/employerPositions" />

			<a href="${employerPositionsURL}"><button
					class="confirmation-button-style" type="button">Edit
					Another Position</button></a>

		</div>
	</div>
</div>

<c:import url="/WEB-INF/jsp/footer.jsp" />