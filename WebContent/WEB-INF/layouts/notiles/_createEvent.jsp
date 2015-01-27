<div>
	<form method="POST" id="event-form"
		action="${pageContext.request.contextPath}/customer/createEvent"
		ectype="application/x-www-form-urlencoded" autocomplete="off">
		<table>
			<tr>
				<td class="field-name">Event Name :</td>
				<td class="form-control"><input type="text" size="50"
					maxlength="250" name="name" required="required"
					placeholder="Ex.: Victoria's Birthday party" class="inputs">
			</tr>
			<tr>
				<td class="field-name">Date/Time :</td>
				<td class="form-control"><input type="text" size="30"
					maxlength="50" name="datetimepicker" id="datetimepicker"
					required="required" class="inputs" /></td>
			</tr>
			<tr>
				<td class="field-name">Number of Persons :</td>
				<td class="form-control"><input type="text" size="20"
					maxlength="20" name="person_count" required="required"
					pattern="[0-9]+" title="Must be a Number" class="inputs">
			</tr>
			<tr>
				<td class="field-name">Total Budget :</td>
				<td class="form-control"><input type="text" size="20"
					maxlength="20" name="budget_total" required="required"
					pattern="[0-9]+" title="Must be a Number" class="inputs">
			</tr>

			<tr>
				<td colspan="2" style="text-align: center;"><br>Event
					Location</td>
			</tr>
			<tr>
				<td class="field-name">Street 1 :</td>
				<td class="form-control"><input type="text" size="30"
					maxlength="50" name="street1" required="required"
					placeholder="Line 1" class="inputs"></td>
			</tr>
			<tr>
				<td class="field-name">Street 2 :</td>
				<td class="form-control"><input type="text" size="30"
					maxlength="50" name="street2" placeholder="Line 2" class="inputs"></td>
			</tr>
			<tr>
				<td class="field-name">City :</td>
				<td class="form-control"><input type="text" size="30"
					name="city" required="required" placeholder="City" class="inputs"></td>
			</tr>
			<tr>
				<td class="field-name">State :</td>
				<td class="form-control"><select id="state" name="state"
					class="form-control bfh-states inputs"></select></td>
			</tr>
			<tr>
				<td class="field-name">Zip :</td>
				<td class="form-control"><input type="text" size="10" name="zip"
					maxlength="10" required="required" placeholder="Ex.: xxxxx"
					class="inputs"></td>
			</tr>
			<tr>
				<td></td>
				<td><button type="submit" width="50px" class="btn btn-lg btn-primary btn-block">Create
						Event</button></td>
			</tr>
		</table>
	</form>
</div>