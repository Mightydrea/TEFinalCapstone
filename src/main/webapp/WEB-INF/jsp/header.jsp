<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EmpowerBus</title>
<link href="https://fonts.googleapis.com/css?family=Roboto Condenses"
	rel="stylesheet">
<c:url value="/css/site.css" var="cssHref" />
<c:url value="/css/toggleSwitchCSS.css" var="toggleCssHref" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" href="${cssHref}">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
	integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
	crossorigin="anonymous">

</head>
<header>
	<nav>

		<ul>
			<li><a href="/capstone/" class="Header-branding"> <img
					src="//static1.squarespace.com/static/5a28538e9f07f52d7fcb1928/t/5a6737389140b71728122b28/1542249065352/?format=1500w"
					alt="EmpowerBus" class="Header-branding-logo">
			</a></li>
			<li><a href="/capstone/" class="Header-nav-item">Home</a></li>
			<li><c:url var="searchPositionsURL" value="/searchPositions" />
				<a class="Header-nav-item" href="${searchPositionsURL}">Available
					Jobs</a></li>
			<c:set var="employer" value="employer" />
			<c:set var="admin" value="admin" />
			<c:choose>

				<c:when test="${user.role eq employer}">
					<c:url var="employerPositionsURL" value="/employerPositions" />
					<li><a class="Header-nav-item" href="${employerPositionsURL}">My
							Positions</a>
					<li>
				</c:when>

				<c:when test="${user.role eq admin}">
					<c:url var="adminPositionList" value="/listPositions" />
					<li><a class="Header-nav-item" href="${adminPositionList}">List
							All Positions</a></li>

					<c:url var="createEmployerURL" value="/createEmployer" />
					<li><a class="Header-nav-item" href="${createEmployerURL}">Create
							Employer</a></li>
				</c:when>

			</c:choose>
			<li><c:choose>
					<c:when test="${user.role == null}">
						<c:url var="loginURL" value="/login" />
						<a class="Header-nav-item" href="${loginURL}">Login</a>
					</c:when>
					<c:otherwise>
						<c:url var="logoutURL" value="/logout" />
						<a class="Header-nav-item" href="${logoutURL}">Logout</a>
					</c:otherwise>
				</c:choose></li>
			<li><a href="https://www.empowerbus.com/getonthebus"
				class="Header-nav-special">Get On The Bus</a></li>
		</ul>
	</nav>

	<!--THIS LINK IS FROM EMPOWERBUS WEBSITE <a href="https://www.empowerbus.com/#services"
					class="Header-nav-item">Services</a>  -->




	<%--  THIS LINK IS FROM EMPOWERBUS WEBSITE<a href="https://www.empowerbus.com/#news" class="Header-nav-item">Recent News</a> 
				 
				 <span class="Header-nav-item "> <a
					href="https://www.empowerbus.com/careers" class="Header-nav-item">Careers</a>
				</span> <c:url var="searchPositionsURL" value="/searchPositions" /> --%>

	<!-- <a href="https://www.empowerbus.com/search?q="><i
				class="fas fa-search"></i></a> -->


	<!-- THIS LINK IS FROM EMPOWERBUS WEBSITE <div class="Header-search">
				<form class="Header-search-form" action="/search" method="get">
					<input class="Header-search-form-input" name="q" type="text"
						spellcheck="false" value="" autocomplete="off"
						placeholder="Search">
					<button class="Header-search-form-submit" type="submit"><i class="fas fa-search"></i>
					</button>
				</form>
			</div> -->



	<%-- This link will direct you to a user registration <c:url var="newUserURL" value="/users/new" />
		<a class="Header-nav-special-links" href="${newUserURL}">Register</a> --%>

</header>
<body>