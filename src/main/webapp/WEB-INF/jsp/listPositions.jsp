<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

<div class="position-card-container"
	style="background-image: url('img/opacWorkerCollageTwo.png')">

	<c:forEach items="${positions}" var="position">

		<div class="admin-positions-card" id="${position.positionId}">


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

			<!--These both asynchronously update the database  -->

			<!-- display position toggle -->

			<div class="toggle-container">
				<b>Display Position:</b>
				<div class="toggle">
					<c:choose>
						<c:when test="${position.displayed}">
							<span class="toggle-label">Off</span>
							<label class="switch" data-on-label="On"> <input
								type="checkbox" checked><span class="slider round"></span>
							</label>
							<span class="toggle-label">On</span>
						</c:when>
						<c:otherwise>
							<span class="toggle-label">Off</span>
							<label class="switch"> <input type="checkbox"> <span
								class="slider round"></span>
							</label>
							<span class="toggle-label">On</span>
						</c:otherwise>

					</c:choose>
				</div>
			</div>



			<b>Select Pick-up Location:</b> <select
				class="pickUpLocationSelector" name="pickUpLocation">
				<c:choose>
					<c:when test="${empty position.pickUpLocation}">
						<option value="empty">select</option>

					</c:when>
					<c:otherwise>
						<option value="${position.pickUpLocation}">${position.pickUpLocation}</option>
						<option value="empty">Remove Pickup Location</option>

					</c:otherwise>
				</c:choose>

				<option
					value="Cota Transit Terminal Bay 4, Northbound & E. Rich St.">Cota
					Transit Terminal Bay 4, Northbound & E. Rich St.</option>
				<option
					value="Cota Transit Terminal Bay 7, Southbound Path & E. Main St.">Cota
					Transit Terminal Bay 7, Southbound Path & E. Main St.</option>
				<option
					value="Cota Spring St. Terminal Bay 2, North Terminal on W. Spring St.">Cota
					Spring St. Terminal Bay 2, North Terminal on W. Spring St.</option>
				<option
					value="Easton Terminal Bay 3, Easton Small Bus Ln. & S. Hague Ave.">Easton
					Terminal Bay 3, Easton Small Bus Ln. & S. Hague Ave.</option>
				<option value="1527 Leonard Ave & Veterans Admin Loop">1527
					Leonard Ave & Veterans Admin Loop</option>
				<option
					value="Reynoldsburg Park & Ride, 2100 Birchview Dr. & Reynoldsburg">Reynoldsburg
					Park & Ride, 2100 Birchview Dr. & Reynoldsburg</option>
				<option value="Grove City Park & Ride Path & Genessee Ave.">Grove
					City Park & Ride Path & Genessee Ave.</option>
				<option value="Crosswoods Park & Ride">Crosswoods Park &
					Ride</option>
				<option value="Westerville Park & Ride">Westerville Park &
					Ride</option>
				<option value="New Albany Park & Ride, 5202 Forest Dr. & S. 5th St.">New
					Albany Park & Ride, 5202 Forest Dr. & S. 5th St.</option>
				<option value="Dublin Dale Dr. Park & Ride">Dublin Dale Dr.
					Park & Ride</option>
				<option value="Westwoods Blvd & Westwoods Park & Ride">Westwoods
					Blvd & Westwoods Park & Ride</option>
				<option
					value="Canal Winchester Park & Ride, Winchester Pike & Citizens Pl">Canal
					Winchester Park & Ride, Winchester Pike & Citizens Pl</option>
				<option value="Cleveland Ave & Northern Lights Park & Ride">CLeveland
					Ave & Northern Lights Park & Ride</option>
				<option value="Dublin Dale Dr. Park & Ride">Dublin Dale Dr.
					Park & Ride</option>

			</select>

		</div>
	</c:forEach>
</div>




<script src="js/script.js"></script>

<c:import url="/WEB-INF/jsp/footer.jsp" />