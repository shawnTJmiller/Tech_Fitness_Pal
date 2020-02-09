<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/common/header.jsp" />
<div id="login-main">
	<script type="text/javascript">
		$(document).ready(function() {

			$("form").validate({

				rules : {
					userName : {
						required : true
					},
					password : {
						required : true
					}
				},
				messages : {
					confirmPassword : {
						equalTo : "Passwords do not match"
					}
				},
				errorClass : "error"
			});
		});
	</script>

	<div class="row">
		<!-- <div class="col-sm-4"></div>
		<div class="col-sm-4"> -->
			<div>
				<c:url var="formAction" value="/login" />
				<form method="POST" action="${formAction}">
					<input type="hidden" name="destination"
						value="${param.destination}" /> <input type="hidden"
						name="CSRF_TOKEN" value="${CSRF_TOKEN}" />
					<div class="form-group">
						<label for="userName">User Name:  <input type="text"
							id="userName" name="userName" placeHolder="User Name"
							class="form-control" /></label>
					</div>
					<div class="form-group">
						<label for="password">Password:  <input type="password"
							id="password" name="password" placeHolder="Password"
							class="form-control" /></label>
					</div>
					<button type="submit" class="btn btn-primary">Login</button>
				</form>
			</div>
		<!-- </div>
		<div class="col-sm-4"></div> -->
	</div>
</div>
<c:import url="/WEB-INF/jsp/common/footer.jsp" />