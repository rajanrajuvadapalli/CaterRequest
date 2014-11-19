<h2 style="text-align:center;">Registration</h2>
		
<div align="center" id="register-options">
	<h3 style="text-align:center;color:silver;">Would you like to register as</h3>
	<table>
		<tr>
			<td class="image-button"><img
				src="${pageContext.request.contextPath}/resources/images/individual.png"
				alt="customer" onclick="showRegistrationFormFor('customer')"/></td>
			<td>&nbsp;&nbsp;&nbsp;</td>
			<td class="image-button"><img
				src="${pageContext.request.contextPath}/resources/images/chef.jpg"
				alt="restaurant" onclick="showRegistrationFormFor('restaurant')"/></td>
		</tr>
	</table>
	<br><br><br>
</div>

<div align="center" id="register-form">
	<form method="POST"
		action="${pageContext.request.contextPath}/register">
		<table>
			<tr id="customer">
				<td class="field-name">Name :</td>
				<td class="field-value"><input type="text" size="30"
					required="required" placeholder="First   Last" class="inputs"></td>
			</tr>
			<tr id="restaurant">
				<td class="field-name">Restaurant Name :</td>
				<td class="field-value"><input type="text" size="30"
					required="required" placeholder="Restaurant Name" class="inputs"></td>
			</tr>
			<tr id="restaurant">
				<td class="field-name">Cuisine Type :</td>
				<td class="field-value">
					<select class="inputs" id="cuisine-type" required="required">
						<option value="01"> AMERICAN    </option>
						<option value="02"> CHINESE     </option>
						<option value="03"> CONTINENTAL </option>
						<option value="04"> CUBAN       </option>
						<option value="05"> FRENCH      </option>
						<option value="06"> GREEK       </option>
						<option value="07"> INDIAN      </option>
						<option value="08"> INDONESIAN  </option>
						<option value="09"> ITALIAN     </option>
						<option value="10"> JAPANESE    </option>
						<option value="11"> KOREAN      </option>
						<option value="12"> LEBANESE    </option>
						<option value="13"> MALAYSIAN   </option>
						<option value="14"> MEXICAN     </option>
						<option value="15"> RUSSIAN     </option>
						<option value="16"> SINGAPORE   </option>
						<option value="17"> SPANISH     </option>
						<option value="18"> THAI        </option>
						<option value="19"> TIBETAN     </option>
						<option value="20"> VIETNAMESE  </option>
						<option value="21" selected="true'">             </option>
					</select>
				</td>
			</tr>
			<tr id="restaurant">
				<td class="field-name">Website URL :</td>
				<td class="field-value"><input type="text" size="50"
					required="required" placeholder="Ex.: www.example.com" class="inputs"></td>
			</tr>
			<tr>
				<td class="field-name">Email :</td>
				<td class="field-value"><input type="text" size="30"
					required="required" placeholder="Ex.: jenny@gmail.com"
					class="inputs"><br> <i>(This will be your username
						for login)</i></td>
			</tr>
			<tr>
				<td class="field-name">Password :</td>
				<td class="field-value"><input type="text" size="30"
					required="required" placeholder="Password" class="inputs"></td>
			</tr>
			<tr>
				<td class="field-name">Confirm Password :</td>
				<td class="field-value"><input type="text" size="30"
					required="required" placeholder="Re-enter Password" class="inputs"></td>
			</tr>
			<tr>
				<td class="field-name">Contact Phone :</td>
				<td class="field-value"><input type="text" size="30"
					required="required" placeholder="xxx-xxx-xxxx" class="inputs"></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;"><br>Address</td>
			</tr>
			<tr>
				<td class="field-name">Street 1 :</td>
				<td class="field-value"><input type="text" size="30"
					required="required" placeholder="Line 1" class="inputs"></td>
			</tr>
			<tr>
				<td class="field-name">Street 2 :</td>
				<td class="field-value"><input type="text" size="30"
					required="required" placeholder="Line 2" class="inputs"></td>
			</tr>
			<tr>
				<td class="field-name">City :</td>
				<td class="field-value"><input type="text" size="30"
					required="required" placeholder="City" class="inputs"></td>
			</tr>
			<tr>
				<td class="field-name">State :</td>
				<td class="field-value"><input type="text" size="2"
					required="required" placeholder="State" class="inputs"></td>
			</tr>
			<tr>
				<td class="field-name">Zip :</td>
				<td class="field-value"><input type="text" size="10"
					required="required" placeholder="Ex.: xxxxx-xxxx" class="inputs"></td>
			</tr>
			<tr>
				<td></td>
				<td><button type="submit" class="button">Register</button></td>
			</tr>
		</table>
	</form>
</div>