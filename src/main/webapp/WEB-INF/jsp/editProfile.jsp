<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<c:import url="/WEB-INF/jsp/common/header.jsp" />

<div id="edit-profile-main">
	<div>
		<h1 class="page-title">Edit Profile</h1>
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
														goals : {
															required : false
														},

														password : {
															required : false,
															equalTo : "#password"
														},
														
														confirmPassword : {
															required : false,
															equalTo : "#password"
														},
														profilePhoto : {
															required : false
														},

														birthDay : {
															required : false, 
															minlength : 10,
														},
														
														currentWeight : {
															required : false,
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
													
													}		
							});     
		</script>
		<c:url var="formAction" value="/users/editProfile" />
		<form method="POST" action="${formAction}" id="info-entry">
			<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}" />
			<div class="row">
				<div class="col-sm-2"></div>
				<div class="col-sm-6">

					<div class="form-group">
						<label for="password">Change Password: </label><input
							type="password" id="password" name="password"
							placeHolder="Edit Password" class="form-control" />
					</div>

					<div class="form-group">
						<label for="password">Confirm New Password: </label><input
							type="password" id="confirmPassword" name="confirmPassword"
							placeHolder="Confirm New Password" class="form-control" />
					</div>
					<br>

					<div class="form-group">
						<label for="birthDay">Birthday : </label><input type="date"
							id="birthDay" name="birthDay" placeHolder="Edit Birth Day"
							class="form-control" />
					</div>

					<div class="form-group">
						<label for="profilePhoto">Profile Photo: </label> <input
							id="image" type="file" name="profile_photo" placeholder="Photo"
							class="form-control">
					</div>

					<div class="form-group">
						<label for="currentWeight">Current Weight: </label><input
							type="text" id="currentWeight" name="currentWeight"
							placeHolder="Edit Current Weight" class="form-control" />
					</div>

					<div class="btn-goal btn-group-toggle" data-toggle="buttons">
						<label for="goal">Weight Goal : </label><label
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
					</div>	<br>
					<button type="submit" class="btn btn-danger">Update
						Profile</button>
				</div>
				<div class="col-sm-4"></div>

			</div>
		</form>
	</div>
</div>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />
