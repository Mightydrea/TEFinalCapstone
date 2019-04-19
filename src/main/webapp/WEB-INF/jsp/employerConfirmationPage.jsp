<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:import url="/WEB-INF/jsp/header.jsp" />


<div class="confirmation-page"
	style="background-image: url('img/ColumbusSkyline.jpg')">
	<h1>New Employer Confirmation</h1>

	<h4>
		You have successfully created <b>${employer.companyName}</b>
	</h4>

	<div class="confirmation-data">
		<p>
			<b>Street Address:</b> ${employer.streetAddress1}
		</p>
		<p>
			<b>Street Address (optional):</b> ${employer.streetAddress2}
		</p>
		<p>
			<b>City:</b> ${employer.city}
		</p>
		<p>
			<b>State:</b> ${employer.state}
		</p>
		<p>
			<b>Zip Code:</b> ${employer.zipCode}
		</p>

		<div class="confirmation-button-container">
			<c:url var="homeURL" value="/" />
			<a href="${homeURL}"><button class="confirmation-button-style"
					type="button">Finished</button></a>
			<c:url var="createEmployerURL" value="/createEmployer" />

			<a href="${createEmployerURL}"><button
					class="confirmation-button-style" type="button">Create
					Another Employer</button></a>

		</div>
	</div>
</div>






<c:import url="/WEB-INF/jsp/footer.jsp" />
