<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/WEB-INF/jsp/header.jsp" />



<div class="employer-position-card-container"
	style="background-image: url('img/opacWorkerCollageTwo.png')">

	<section class="add-position-link-container">
		<c:url var="addPositionURL" value="/addPosition" />
		<a class="add-position-link" href="${addPositionURL}">Add Position</a><br>

	</section>

	<c:forEach items="${positions}" var="position">
		<div class="employer-positions-card">
			<h1>${position.jobTitle}</h1>


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

			<c:url var="editPositionURL" value="/editPosition">
				<c:param name="positionId" value="${position.positionId}" />
			</c:url>
			<a href="${editPositionURL}"><button class="apply-button">Edit
					Position</button></a>

		</div>

	</c:forEach>


</div>



<c:import url="/WEB-INF/jsp/footer.jsp" />