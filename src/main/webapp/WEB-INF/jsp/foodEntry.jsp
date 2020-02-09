<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<c:import url="/WEB-INF/jsp/common/header.jsp" />

<div id="food-entry-main">

<p>
	<c:out value="${ info.userName} " />
	's Profile
</p>

<c:url var="formAction" value="/users/processResults" />
<form method="POST" action="${formAction}" id="info-entry">
	<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}" />
	<input type="hidden" name="userName" value="${info.userName}" />
	<div class="row">
	<div class="col-sm-4"></div>
		<div class="col-sm-4">
			<div class="form-group">
			<label for="ingr">Food/Ingredient: <input type="text"
			id="ingr" name="ingr" placeHolder="food / ingredient"
			class="form-control" />
			</label>
			</div>
			<div class="form-group">
						<label for="mealdate">Date: </label> <br> <input
							type="date" name="mealDate" /> <br> <br>
					</div>
						<div class="form-group">
			<label for="meal_type">Meal Type: <select 
			id="ingr" name="mealtype" 
			class="form-control" />
			<option value="breakfast"> Breakfast</option>
			<option value="lunch">Lunch</option>
			<option value="dinner">Dinner</option>
			<option value="snacks">Snacks</option>
			</select>
			</label>
			</div>
					
		<button type="submit" class="btn btn-primary">Submit Food</button>
			
		</div>
</div>
</form>

</div>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />