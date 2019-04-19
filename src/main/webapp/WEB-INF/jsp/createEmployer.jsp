<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:import url="/WEB-INF/jsp/header.jsp" />


<div class="create-employer-form-page"
	style="background-image: url('img/ColumbusSkyline.jpg')">
	<h2>Create New Employer</h2>


	<div class="create-employer-form">
		<c:url var="formAction" value="/submit" />


		<!-- Sends Post to the employer Controller  -->
		
		
		<form:form method="POST" action="${formAction}"
			modelAttribute="employer">
			<form:errors path="*" cssClass="error" />


			<br>
			<label class="create-employer-label" for="companyName">Company
				Name<span>*</span>
			</label>
			<form:input size="40" path="companyName" />


			<label class="create-employer-label" for="streetAddress1">Street
				Address<span>*</span>
			</label>
			<form:input size="40" path="streetAddress1" />


			<label class="create-employer-label" for="streetAddress2">Street
				Address (optional)</label>
			<form:input size="40" path="streetAddress2" />

			<label class="create-employer-label" for="city">City<span>*</span></label>
			<form:input size="40" path="city" />


			<label class="create-employer-label" for="state">State<span>*</span></label>
			<form:select id="state" path="state">
				<form:option value="">Choose State</form:option>
				<form:option value="AL">AL</form:option>
				<form:option value="AK">AK</form:option>
				<form:option value="AR">AR</form:option>
				<form:option value="AZ">AZ</form:option>
				<form:option value="CA">CA</form:option>
				<form:option value="CO">CO</form:option>
				<form:option value="CT">CT</form:option>
				<form:option value="DC">DC</form:option>
				<form:option value="DE">DE</form:option>
				<form:option value="FL">FL</form:option>
				<form:option value="GA">GA</form:option>
				<form:option value="HI">HI</form:option>
				<form:option value="IA">IA</form:option>
				<form:option value="ID">ID</form:option>
				<form:option value="IL">IL</form:option>
				<form:option value="IN">IN</form:option>
				<form:option value="KS">KS</form:option>
				<form:option value="KY">KY</form:option>
				<form:option value="LA">LA</form:option>
				<form:option value="MA">MA</form:option>
				<form:option value="MD">MD</form:option>
				<form:option value="ME">ME</form:option>
				<form:option value="MI">MI</form:option>
				<form:option value="MN">MN</form:option>
				<form:option value="MO">MO</form:option>
				<form:option value="MS">MS</form:option>
				<form:option value="MT">MT</form:option>
				<form:option value="NC">NC</form:option>
				<form:option value="NE">NE</form:option>
				<form:option value="NH">NH</form:option>
				<form:option value="NJ">NJ</form:option>
				<form:option value="NM">NM</form:option>
				<form:option value="NV">NV</form:option>
				<form:option value="NY">NY</form:option>
				<form:option value="ND">ND</form:option>
				<form:option value="OH">OH</form:option>
				<form:option value="OK">OK</form:option>
				<form:option value="OR">OR</form:option>
				<form:option value="PA">PA</form:option>
				<form:option value="RI">RI</form:option>
				<form:option value="SC">SC</form:option>
				<form:option value="SD">SD</form:option>
				<form:option value="TN">TN</form:option>
				<form:option value="TX">TX</form:option>
				<form:option value="UT">UT</form:option>
				<form:option value="VT">VT</form:option>
				<form:option value="VA">VA</form:option>
				<form:option value="WA">WA</form:option>
				<form:option value="WI">WI</form:option>
				<form:option value="WV">WV</form:option>
				<form:option value="WY">WY</form:option>
			</form:select>


			<label class="create-employer-label" for="zipCode">Zip Code<span>*</span></label>
			<form:input size="40" path="zipCode"
				placeholder="Five digit zip code" />


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