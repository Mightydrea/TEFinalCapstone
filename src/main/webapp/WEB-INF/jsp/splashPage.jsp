<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

<div class="homePage"
	style="background-image: url('img/opacSkyline.png')">
	<h1>
		<span style="color: #1a1b44">UPWARD</span> <span
			style="color: #3c93A2">MOBILITY </span> <span style="color: #1a1b44">FOR</span>
		<span style="color: #d9b03c">ALL</span><span style="color: #1a1b44">.</span>
	</h1>

</div>
<div class="colorBar">

	<img
		src="https://static1.squarespace.com/static/5a28538e9f07f52d7fcb1928/t/5a3bd10a41920237e56c4257/1513869583786/gradient-01.png"><br>

</div>

<div class="how-it-works">
	<img src="img/how-it-works.png">
</div>


<!--This script is the JQuery overlay for hoverable map  -->

<script src="https://code.jquery.com/jquery-3.4.0.min.js"
	integrity="sha256-BJeo0qm959uMBGb65z40ejJYGSgR7REI4+CW1fNKwOg="
	crossorigin="anonymous"></script>

<script type="text/javascript"
	src="<c:url value="/jQuery/jquery.maphilight.min.js"/>"></script>
<script type="text/javascript">
	$(function() {
		console.log('hoverrunning', $('#map'));
		$.fn.maphilight.defaults = {
			fill : true,
			fillColor : '000000',
			fillOpacity : 0.2,
			stroke : true,
			strokeColor : 'ff0000',
			strokeOpacity : 1,
			strokeWidth : 1,
			fade : true,
			alwaysOn : false,
			neverOn : false,
			groupBy : false,
			wrapClass : true,
			shadow : false,
			shadowX : 0,
			shadowY : 0,
			shadowRadius : 6,
			shadowColor : '000000',
			shadowOpacity : 0.8,
			shadowPosition : 'outside',
			shadowFrom : false
		}
		$('#map').maphilight();
	});
</script>

<div class="map-container">

	<h1>
		<em>One Click Away From Your Next Career!</em>
	</h1>
	<img src="img/map/columbusMap.png" usemap="#image-map" id="map"
		class="map">

	<map name="image-map">
		<area target="" alt="North" title="North"
			href="/capstone/positionsByRegion?areaOfCity=North"
			coords="314,347,316,346,468,0,187,0,293,290,315,346,315,345"
			shape="poly">
		<area target="" alt="South" title="South"
			href="/capstone/positionsByRegion?areaOfCity=South"
			coords="317,346,436,606,255,606,205,607,314,346,317,348,317,347,317,348,318,347,317,346,318,347,317,350"
			shape="poly">
		<area target="" alt="East" title="East"
			href="/capstone/positionsByRegion?areaOfCity=East"
			coords="666,219,315,346,666,461,666,435,666,335,666,331,666,335"
			shape="poly">
		<area target="" alt="West" title="West"
			href="/capstone/positionsByRegion?areaOfCity=West"
			coords="315,345,0,438,0,221" shape="poly">
		<area target="" alt="North West" title="Northwest"
			href="/capstone/positionsByRegion?areaOfCity=Northwest"
			coords="186,0,1,1,1,220,314,345" shape="poly">
		<area target="" alt="North East" title="Northeast"
			href="/capstone/positionsByRegion?areaOfCity=Northeast"
			coords="318,343,666,219,663,1,469,0" shape="poly">
		<area target="" alt="South West" title="Southwest"
			href="/capstone/positionsByRegion?areaOfCity=Southwest"
			coords="313,347,204,606,0,606,0,438" shape="poly">
		<area target="" alt="South East" title="Southeast"
			href="/capstone/positionsByRegion?areaOfCity=Southeast"
			coords="318,347,438,607,665,605,666,460" shape="poly">
	</map>

</div>




<c:import url="/WEB-INF/jsp/footer.jsp" />