<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<c:import url="/WEB-INF/jsp/common/header.jsp" />
<div id="userHome-main">

	<div id="main-info-sidebar">
		<!-- start of code to show stars -->
		<div id="bonus-stars">
			<c:forEach var="i" begin="1" end="5">
				<span class="fa fa-star filled"></span>
			</c:forEach>
			<c:forEach var="i" begin="6" end="999">
				<span class="numberCounter"></span>
			</c:forEach>
		</div>
		<br> <br>
		<!-- side-bar for user data -->
		<p>
		<h1>${calories}</h1>

		<h3>

			<!-- <script>
			function fasterPreview( uploader ) {
			    if ( uploader.files && uploader.files[0] ){
			          $('#profileImage').attr('src', 
			             window.URL.createObjectURL(uploader.files[0]) );
			    }
			}
 
			$("#info.image").change(function(){
			    fasterPreview( this ); 
			}); 
			 </script>

			<script src="img.jpg "></script>
			<div id="profile-container">
				<image id="profileImage" value="${info.image}" src="https://assets.rollingstone.com/assets/2015/list/50-best-star-wars-characters-20151203/items/luke-skywalker-20151203/218592/large_rect/1449072059/1401x788-6---Luke.jpg" />
				<link rel="stylesheet" 
					href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 

				<input id="profileImage" type="file" name="profile_photo"
					placeholder="Photo">
			</div> -->



		</h3>




		<c:out value="${ info.userName }" />
		's Profile

		<div id="user-wt-comp">
			<div id="main-current-wt">
				<h3>Current Weight:</h3>
				<h1>
					<c:out value="${ info.weight }" />
				</h1>
			</div>

			<div id="main-target-wt">
				<h3>Target Weight:</h3>
				<h1>
					<c:out value="${ info.targetWeight }" />
				</h1>
			</div>
		</div>
		<div id="main-userInfo">
			<p>
				Name:
				<c:out value="${ info.firstName }" />
				<c:out value="${ info.lastName }" />
			</p>
			<p>
				Birth Date:
				<c:out value="${ info.birthDate }" />
			</p>
			<p>
				Height:
				<c:out value="${ info.height }" />
				inches
			</p>
			<div>
				<c:url var="editProfileHref" value="/users/editProfile" />
				<button type="button" class="info-update-btn btn-info btn-block">
					<a class="info-update-btn btn-info btn-block"
						href="${ editProfileHref }">Update Info</a>
				</button>
			</div>
		</div>
	</div>
	<!-- main-info-sidebar end -->

	<div id="meal-data">

		<div class="calorie-graph">
			<canvas id="myChart"></canvas>
		</div>
		<script>
			let mychart = document.getElementById('myChart').getContext('2d');

			//Global Options
			Chart.defaults.global.defaultFontFamily = 'Michroma';
			Chart.defaults.global.defaultFontSize = 18;
			Chart.defaults.global.defaultFontColor = 'green';

			let massPopChart = new Chart(myChart, {
				type : 'bar', // bar, horizontalBar, pie, line, doughnut, radar, polarArea
				data : {
					labels : [ "${ mealData.mealDate }" ],
					datasets : [ {
						label : 'Cal Consumed',
						data : [ "${ calories }" ],
						backgroundColor : [ 'pink', ],
						borderWidth : 1,
						borderColor : '#777',
						hoverBorderWidth : 3,
						hoverBorderColor : '#fff'
					}, {
						label : 'Cal Target',
						data : [ 2000 ],
						backgroundColor : '#66ff66',
						borderWidth : 1,
						borderColor : '#000'
					} ]
				},
				options : {
					title : {
						display : true,
						text : 'Calorie Intake',
						fontSize : 25
					},
					legend : {
						display : true,
						position : 'top',
						labels : {
							fontColor : 'black'
						}
					},
					layout : {
						padding : {
							left : 50,
							right : 50,
							bottom : 0,
							top : 25
						}
					},
					tooltips : {
						display : false
					}
				}
			})
		</script>

		<!-- radio buttons for graph data -->
		<div class="graph-selector">
			<div class="btn-group btn-group-toggle" data-toggle="buttons">
				<!--  <label class="btn btn-secondary active"> <input type="radio"
					name="graphSet" id="graphMonth" autocomplete="off"> monthly 
				</label> <label class="btn btn-secondary"> <input type="radio"
					name="graphSet" id="graphWeek" autocomplete="off"> weekly
				</label> -->
				<label class="btn btn-secondary"> <input type="radio"
					name="graphSet" id="graphDay" autocomplete="off" checked>
					today
				</label>
			</div>
		</div>



		<c:url var="foodEntryHref" value="/users/foodEntry" />
		<a id="foodEntry" value="/users/foodEntry" href="${ foodEntryHref }">
			<button type="button" class="btn btn-caution btn-lg">Add to
				List</button>
		</a>
	</div>
	<!-- meal-data end -->
	<div class="ad">
		<!-- advertisement goes here -->
		<c:url var="imgAd" value="/img/WalkDETpic.png" />
		<img src="${imgAd}" class="img-promo" />
		<p id="ad-text">(un)-Paid Advertisement</p>

	</div>
</div>

<script type="text/javascript">
	
</script>
<c:import url="/WEB-INF/jsp/common/footer.jsp" />


<!-- carousel to show past entered meals -->
<!-- <div id="meal-carousel" class="meal-carousel" data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleIndicators" data-slide-to="0"
					class="active"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			</ol>
			<div class="carousel-inner" role="listbox">
				<div class="carousel-item active">
					<img class="img-logo" src="${ imgSrc }"
						data-src="holder.js/900x400?theme=social" alt="First slide">
				</div>
				<div class="carousel-item">
					<img class="img-logo" src="${ imgSrc }"
						data-src="holder.js/900x400?theme=industrial" alt="Second slide">
				</div>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleIndicators"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div> -->
<!-- carousel end -->