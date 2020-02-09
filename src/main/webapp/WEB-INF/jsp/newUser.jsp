<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<c:import url="/WEB-INF/jsp/common/header.jsp" />

<div id="newUser-main">
	<div>
		<h1 class="page-title">New Member Registration</h1>
		<br>

		<script type="text/javascript">
			$(document)
					.ready(
							function() {
								$.validator.addMethod('capitals', function(
										thing) {
									return thing.match(/[A-Z]/);
								});
								$("form")
										.validate(
												{

													rules : {
														userName : {
															required : true
														},
														password : {
															required : true,
															minlength : 10,
															capitals : true,
														},
														confirmPassword : {
															required : true,
															equalTo : "#password"
														},
														email : {
															required : true
														},

														birthDate : {
															required : true,
															minlength : 10,
														},
														height : {
															required : true,

														},
														weight : {
															required : true,
														},
														goal : {
															required : true,
														},
														gender : {
															required : true,
														}

													},
													messages : {
														password : {
															minlength : "Password too short, make it at least 10 characters",
															capitals : "Field must contain a capital letter",
														},
														confirmPassword : {
															equalTo : "Passwords do not match"
														}
													},
													errorClass : "error"
												});
							});

			$(function() {
				$("#datepicker").datepicker();
			});
		</script>
		<c:url var="formAction" value="/users/new" />
		<form method="POST" action="${formAction}" id="info-entry">
			<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}" />
			<div class="row">
				<!-- <div class="col-sm-4"></div>
				<div class="col-sm-4"> -->
				<div>
					<div class="form-group">
						<label for="userName">User Name: <input type="text"
							id="userName" name="userName" placeHolder="User Name"
							class="form-control" /></label>
					</div>
					<div class="form-group">
						<label for="password">Password: <input type="password"
							id="password" name="password" placeHolder="Password"
							class="form-control" /></label> <label for="confirmPassword">Confirm
							Password: <input type="password" id="confirmPassword"
							name="confirmPassword" placeHolder="Re-Type Password"
							class="form-control" />
						</label>
					</div>
					<div class="form-group">
						<label for="firstName">First Name: <input type="text"
							id="firstName" name="firstName" placeHolder="First Name"
							class="form-control" /></label> <label for="lastName">Last Name:
							<input type="text" id="lastName" name="lastName"
							placeHolder="Last Name" class="form-control" />
						</label>
					</div>
					<div class="form-group">
						<label for="email">Email: <input type="text" id="email"
							name="email" placeHolder="Email" class="form-control" /></label>
					</div>
					<div class="form-group">
						<label for="birthDate">Birthday: <br> <input
							type="date" name="bday" id="datepicker" /></label> <br> <br>
					</div>
					<div class="form-group">
						<label for="gender">
							<div class="btn-gender btn-group-toggle" data-toggle="buttons">
								Gender: <label class="btn btn-secondary active"><input
									type="radio" name="gender" id="gender" autocomplete="off"
									checked /> Male </label> <label class="btn btn-secondary"> <input
									type="radio" name="gender" id="gender" autocomplete="off" />
									Female
								</label>
							</div>
						</label>
					</div>
					<br>

					<div class="form-group">
						<label for="height">Height: <input id="height"
							type="number" placeHolder="Height" oninput="toFeet(this.value)"
							onchange="toFeet(this.value)" class="form-control" name="height" />
							<div class="btn-weight-type btn-group-toggle"
								data-toggle="buttons">
								<label class="btn btn-secondary active"> <input
									type="radio" name="ht-convert" id="ht-feet" autocomplete="off"
									checked /> inches
								</label> <label class="btn btn-secondary"> <input type="radio"
									name="ht-convert" id="ht-meter" autocomplete="off" />
									centimeters
								</label>
							</div>
						</label>
						<script>
							function toFeet(n) {
								var realFeet = ((n * 0.393700) / 12);
								var feet = Math.floor(realFeet);
								var inches = Math.round((realFeet - feet) * 12);
								return feet + "&prime;" + inches + '&Prime;';
							}
						</script>
						<label for="weight">Weight: <input id="weight"
							type="number" placeHolder="Weight" oninput="toPounds(this.value)"
							onchange="toKg(this.value)" class="form-control" name="weight" />


							<!--  <p>
						<label>Pounds:</label> <input id="inputPounds" type="number"
							placeholder="Pounds" oninput="weightConverter(this.value)"
							onchange="weightConverter(this.value)">
					</p>--> <!-- Radio buttons similar to 'Weight Goal' -->
							<div class="btn-weight-type btn-group-toggle"
								data-toggle="buttons">
								<label class="btn btn-secondary active"><input
									type="radio" name="wt-convert" id="weight-lbs"
									autocomplete="off" checked /> pounds </label> <label
									class="btn btn-secondary"> <input type="radio"
									name="wt-convert" id="weight-kg" autocomplete="off" />
									kilograms
								</label>
							</div> <script>
								function weightConverter(valNum) {
									document.getElementById("outputKilograms").innerHTML = valNum / 2.2046;
								}
							</script>
						</label>
					</div>

					<!-- <p>
						<label>(In Kilograms:)</label>
						<output id="outputKilograms"></output>
					</p> -->

					<div class="btn-goal btn-group-toggle" data-toggle="buttons">
						<label for="goal"> Weight Goal : </label>
						<label
							class="btn btn-secondary"> <input type="radio"
							name="loseWeight" id="loseWt" autocomplete="off" checked>
							Lose Weight
						</label> <label class="btn btn-secondary"> <input type="radio"
							name="maintainWeight" id="maintainWt" autocomplete="off">
							Maintain Weight
						</label> <label class="btn btn-secondary"> <input type="radio"
							name="gainWeight" id="gainWt" autocomplete="off"> Gain
							Weight
						</label>
					</div>
					<br> <br>
					<div class="form-group">
						<label for="targetWeight"> Target Weight: <input
							type="number" id="target-weight" name="targetWeight"
							placeHolder="Target Weight" class="form-control" /> <br>
							</label>
					</div>
					<button type="submit" class="btn btn-danger">Create User</button>
				</div>
			</div>
			<!-- <div class="col-sm-4"></div> -->
			<!-- col-sm-4 end -->
	</div>
	<!--  row end -->
	</form>
</div>
</div>


<c:import url="/WEB-INF/jsp/common/footer.jsp" />