<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">

<title>Tech Fitness Pal</title>

<c:url var="bootstrapCss" value="/css/bootstrap.min.css" />
<c:url var="headerCss" value="/css/header.css" />
<c:url var="siteCss" value="/css/site.css" />
<c:url var="jQueryJs" value="/js/jquery.min.js" />
<c:url var="jqValidateJs" value="/js/jquery.validate.min.js" />
<c:url var="jqvAddMethJs" value="/js/additional-methods.min.js" />
<c:url var="jqTimeagoJs" value="/js/jquery.timeago.js" />
<c:url var="popperJs" value="/js/popper.min.js" />
<c:url var="bootstrapJs" value="/js/bootstrap.min.js" />

<link rel="stylesheet" type="text/css" href="${bootstrapCss}">
<link rel="stylesheet" type="text/css" href="${siteCss}">
<link
	href="https://fonts.googleapis.com/css?family=Squada+One&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js" />
<link rel="stylesheet" type="text/css"
	href="path/to/chartjs/dist/Chart.min.css">

<script src="${jQueryJs}"></script>
<script src="${jqValidateJs}"></script>
<script src="${jqvAddMethJs}"></script>
<script src="${jqTimeagoJs}"></script>
<script src="${popperJs}"></script>
<script src="${bootstrapJs}"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("time.timeago").timeago();

		$("#logoutLink").click(function(event) {
			$("#logoutForm").submit();
		});

		var pathname = window.location.pathname;
		$("nav a[href='" + pathname + "']").parent().addClass("active");

	});
</script>

</head>
<body>
	<header>
		<div>
			<c:choose>
				<c:when test="${ not empty currentUser }">
					<c:url var="homePageHref" value="/users/home" />
				</c:when>
				<c:otherwise>
					<c:url var="homePageHref" value="/login" />
				</c:otherwise>
			</c:choose>
			<c:url var="imgSrc" value="/img/TechFitnessLogoClr.png" />
			<a href="${homePageHref}"> <img src="${imgSrc}" class="img-logo" /></a>
		</div>
		<div id="greeting">
			<c:if test="${ not empty currentUser }">
				<p>
					Welcome
					<c:out value="${ info.firstName }" />
			</c:if>

		</div>
		<nav class="navbar">
			<div class="header-buttons" id="navbarSupportedContent">
				<c:choose>
					<c:when test="${ not empty currentUser }">
						<c:url var="homePageHref" value="/users/home" />
					</c:when>
					<c:otherwise>
						<c:url var="homePageHref" value="/login" />
					</c:otherwise>
				</c:choose>
				<button type="button" class="nav-item">
					<a class="nav-link btn-secondary" href="${homePageHref}">Home</a>
				</button>

				<!-- Change PW Button
				<c:url var="changePasswordHref"
					value="/users/${currentUser}/changePassword" />
				<button type="button" class="nav-item">
					<a class="nav-link btn-secondary" href="${changePasswordHref}">Change
						Password</a>
				</button>
 				-->
				<!-- Messaging buttons not necessary for current app -- potential future use -->
				<!-- <c:if test="${not empty currentUser}">
					<c:url var="dashboardHref" value="/users/${currentUser}" />
					<button type="button" class="nav-item">
						<a class="nav-link btn-secondary" href="${dashboardHref}">Private
							Messages</a>
					</button>

					<c:url var="newMessageHref"
						value="/users/${currentUser}/messages/new" />
					<button type="button" class="nav-item">
						<a class="nav-link btn-secondary" href="${newMessagesHref}">New
							Message</a>
					</button>

					<c:url var="sentMessagesHref"
						value="/users/${currentUser}/messages" />
					<button type="button" class="nav-item">
						<a class="nav-link btn-secondary" href="${sentMessagesHref}">Sent
							Messages</a>
					</button> 
				</c:if> -->
				<script>
					function adminTest() {
						var adminRole = "${ user.role }";
						var n = role.includes("admin", 0);
					}
				</script>
				<c:if test="adminRole == true">
					<c:url var="newUserHref" value="/users/new" />
					<button type="button" class="nav-item">
						<a class="nav-link btn-secondary" href="${newUserHref}">Sign
							Up</a>
					</button>
				</c:if>
				<c:choose>
					<c:when test="${empty currentUser}">
						<c:url var="newUserHref" value="/users/new" />
						<button type="button" class="nav-item">
							<a class="nav-link btn-secondary" href="${newUserHref}">Sign
								Up</a>
						</button>
						<c:url var="loginHref" value="/login" />
						<button type="button" class="nav-item">
							<a class="nav-link btn-secondary" href="${loginHref}">Log In</a>
						</button>
					</c:when>
					<c:otherwise>
						<c:url var="logoutAction" value="/login" />
						<form id="logoutForm" action="${logoutAction}" method="POST">
							<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}" />
						</form>
						<button type="button" class="nav-item">
							<a class="nav-link btn-secondary" id="logoutLink" value="/logout"
								href="${ logoutAction }">Log Out</a>
						</button>
					</c:otherwise>
				</c:choose>
			</div>
		</nav>
	</header>