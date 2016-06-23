
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>

	<title>Menu Editor</title>
	<meta charset="UTF-8">
	<link href="https://fonts.googleapis.com/css?family=Roboto:400,500,700,300&subset=latin,latin-ext" rel="stylesheet" type="text/css">
	<link href="/cater4party/resources/assets/me-css/styles.css" rel="stylesheet" type="text/css">

</head>
<body>

	<div id="main-wrapper">

		<div id="popup" class="hidden">
			<div class="wrapper">
				<div class="header">
					<span id="popup-title">Delete confirmation</span>
					<svg id="popup-close" class="close" x="0px" y="0px" width="20px" height="20px" viewBox="0 0 20 20" enable-background="new 0 0 20 20" xml:space="preserve">
						<polygon id="popup-close-icon" fill="#FFFFFF" points="16.364,17.777 10,11.414 3.636,17.778 2.222,16.364 8.586,10 2.222,3.636 3.636,2.222 10,8.586 16.364,2.222 17.778,3.636 11.414,10 17.778,16.363"/>
					</svg>
				</div>
				<div id="popup-message" class="body">Are you sure you want to delete this item?</div>
				<div class="footer">
					<div id="popup-yes" class="action-button yes">Yes</div><div id="popup-no" class="action-button">Cancel</div>
				</div>
			</div>
		</div>

		<header data-default="my-menu">
			<div id="main-menu" class="hidden">
				<span data-name="my-menu" class="item button">My Menu</span>
				<span class="item separator">|</span>
				<span data-name="my-ingredients" class="item button my-ingredients disabled">My Ingredients</span>
				<span class="item separator">|</span>
				<span data-name="current-menu" class="item button">Base Menu</span>
				<span class="item separator">|</span>
				<span data-name="edit-ingredients" class="item button">Base Ingredients</span>

				<span data-name="download" class="item button download disabled">Download</span>
			</div>
			<div id="loading-message" class="hidden">Please wait...</div>
		</header>

		<main>

			<!-- download -->
			<div id="download" class="hidden">

				<label class="tax">TAX</label>
				<input class="tax" type="text" maxlength="5">

				<label class="download-file-name">Please, insert a file name and click "Download"</label>
				<input class="download-file-name" type="text" maxlength="256">

				<div class="action-button download">Download</div><div class="action-button cleanup-download">Clean Up and Download</div>
				<div class="download-message"></div>

				<br>

				<div class="download-notice" class="hidden">
					<div class="warn-wrapper"></div>
				</div>

				<br>

				<div><b>Note:</b> By clicking "Clean Up and Download" the invalid data from My Menu structure will be removed. For example, categories without products.</div>
			</div>

			<!-- my-ingredients -->

			<div id="my-ingredients" class="hidden">
				<div id="my-ingredients-list">

					<div id="my-ingredients-list-new-ingredient" class="action-button add-ingredient">New Ingredient</div>
					<div id="my-ingredients-list-filter-wrapper">
						<input id="my-ingredients-list-filter" class="ingredients-filter" type="text" maxlength="100" placeholder="Filter"><div id="my-ingredients-list-reset-filter" class="action-button reset-filter">Reset Filter</div>
					</div>

					<div id="my-ingredients-list-wrapper"></div>
				</div>

				<div id="my-ingredients-edit" class="hidden">
					<div class="action-button back">Back</div><div class="action-button update">Save</div><div class="status-message"></div>

					<div class="section">
						<label class="ingredient-name">Ingredient Name</label>
						<input id="my-ingredients-edit-name" class="ingredient-name" type="text" maxlength="64">
					</div>

					<div class="section">
						<label class="ingredient-price">Ingredient Price</label>
						<input id="my-ingredients-edit-price" class="ingredient-price" type="text" maxlength="8">
					</div>
				</div>
			</div>

			<!-- edit-ingredients -->

			<div id="edit-ingredients" class="hidden">
				<div id="ingredients-list">

					<div id="ingredients-list-new-ingredient" class="action-button add-ingredient">New Ingredient</div>
					<div id="ingredients-list-filter-wrapper">
						<input id="ingredients-list-filter" class="ingredients-filter" type="text" maxlength="100" placeholder="Filter"><div id="ingredients-list-reset-filter" class="action-button reset-filter">Reset Filter</div>
					</div>

					<div id="ingredients-list-wrapper"></div>
				</div>

				<div id="ingredients-edit" class="hidden">
					<div class="action-button back">Back</div><div class="action-button update">Save</div><div class="status-message"></div>

					<div class="section">
						<label class="ingredient-name">Ingredient Name</label>
						<input id="ingredients-edit-name" class="ingredient-name" type="text" maxlength="64">
					</div>

					<div class="section">
						<label class="ingredient-price">Ingredient Price</label>
						<input id="ingredients-edit-price" class="ingredient-price" type="text" maxlength="8">
					</div>
				</div>
			</div>

			<!-- current-menu -->

			<div id="current-menu" class="hidden">
				<div class="category-list">

					<div class="category-list-new-category action-button add-category">New Category</div>

					<div class="category-list-wrapper"></div>
				</div>

				<div class="category-edit hidden">
					<div class="action-button back">Back</div><div class="action-button update">Save</div><div class="status-message"></div>

					<div class="section">
						<label class="category-name">Category Name</label>
						<input class="category-edit-name category-name" type="text" maxlength="32">
					</div>

					<div class="section">
						<label class="category-description">Category Description</label>
						<textarea class="category-edit-description category-description" maxlength="100"></textarea>
					</div>

					<div class="section">
						<label class="category-name">Products</label>

						<div class="category-edit-new-product action-button">New Product</div>

						<div class="category-products-wrapper"></div>
					</div>
				</div>

				<div class="product-edit hidden">
					<div class="action-button back">Back</div><div class="action-button update">Save</div><div class="status-message"></div>

					<div class="section">
						<label class="product-name">Product Name</label>
						<input class="product-edit-name product-name" type="text" maxlength="64">
					</div>

					<div class="section">
						<label class="product-price">Product Price</label>
						<input class="product-edit-price product-price" type="text" maxlength="8">
					</div>

					<div class="section">
						<label class="product-description">Product Description</label>
						<textarea class="product-edit-description product-description"></textarea>
					</div>

					<div class="section">
						<label class="product-min">Product Minimum Quantity <span class="info">(leave empty for no restriction)</span></label>
						<input class="product-edit-min product-min" type="text" maxlength="8" value="1">
					</div>

					<div class="section">
						<label class="product-max">Product Maximum Quantity <span class="info">(leave empty for no restriction)</span></label>
						<input class="product-edit-max product-max" type="text" maxlength="8">
					</div>

					<div class="section">
						<label class="product-instructions">Product Instructions</label>
						<textarea class="product-edit-instructions product-instructions" maxlength="100"></textarea>
					</div>

					<div class="section">
						<label class="product-instructions-ml">Product Instructions Maximum Characters Allowed <span class="info">(leave empty for no restriction)</span></label>
						<input class="product-edit-instructions-ml product-instructions-ml" type="text" maxlength="8" value="100">
					</div>

					<div class="section">
						<label class="product-price">Product additions</label>

						<div class="product-edit-new-addition action-button">New Addition</div><div class="product-edit-add-remove-existing-additions action-button">Add/Remove Existing Additions</div>

						<div class="product-additions-wrapper"></div>
					</div>
				</div>

				<div class="additions-add-remove-existing hidden">
					<div class="action-button back">Back</div>

					<div class="product-existing-additions-wrapper"></div>
				</div>

				<div class="addition-edit hidden">
					<div class="action-button back">Back</div><div class="action-button update">Save</div><div class="status-message"></div>

					<div class="section">
						<label class="addition-name">Addition Name</label>
						<input class="addition-edit-name addition-name" type="text" maxlength="64">
					</div>

					<div class="section">
						<label class="addition-min">Addition Minimum Quantity <span class="info">(leave empty for no restriction)</span></label>
						<input class="addition-edit-min addition-min" type="text" maxlength="8">
					</div>

					<div class="section">
						<label class="addition-max">Addition Maximum Quantity <span class="info">(leave empty for no restriction)</span></label>
						<input class="addition-edit-max addition-max" type="text" maxlength="8">
					</div>

					<div class="section">
						<label class="addition-type">Addition Type</label>

						<label class="addition-type-label"><input type="radio" name="addition-type" value="single"> Single Choice Allowed Only</label>

						<label class="addition-type-label"><input type="radio" name="addition-type" value="multiple" checked> Multiple Choices Allowed</label>

						<label class="addition-type-label"><input type="radio" name="addition-type" value="text"> Free Text</label>
					</div>

					<div class="section">
						<label class="addition-price-range">Price Range</label>
						<label class="addition-price-range-label"><input type="checkbox" name="addition-price-range"> Use this addition to calculate the product price range</label>
					</div>

					<div class="section">
						<label class="addition-ingredients">Addition Ingredients</label>

						<div class="addition-edit-ingredients section"></div>
					</div>
				</div>
			</div>

			<!-- my-menu -->

			<div id="my-menu" class="hidden">

				<div id="mm-select-source">
					<div id="mm-make-new-menu" class="action-button">Make new menu</div><div id="mm-use-current-menu" class="action-button">Use "Base Menu" as base source</div>

					<div class="title">or use your own menu source</div>
					<input id="mm-use-custom-source" type="file">

					<div id="mm-select-source-error"></div>
				</div>

				<div class="category-list hidden">
					<div class="action-button back">Back</div><div class="category-list-new-category action-button add-category">New Category</div>

					<div class="category-list-wrapper"></div>
				</div>

				<div class="category-edit hidden">
					<div class="action-button back">Back</div><div class="action-button update">Save</div><div class="status-message"></div>

					<div class="section">
						<label class="category-name">Category Name</label>
						<input class="category-edit-name category-name" type="text" maxlength="32">
					</div>

					<div class="section">
						<label class="category-description">Category Description</label>
						<textarea class="category-edit-description category-description" maxlength="100"></textarea>
					</div>

					<div class="section">
						<label class="category-name">Products</label>

						<div class="category-edit-new-product action-button">New Product</div>

						<div class="category-products-wrapper"></div>
					</div>
				</div>

				<div class="product-edit hidden">
					<div class="action-button back">Back</div><div class="action-button update">Save</div><div class="status-message"></div>

					<div class="section">
						<label class="product-name">Product Name</label>
						<input class="product-edit-name product-name" type="text" maxlength="64">
					</div>

					<div class="section">
						<label class="product-price">Product Price</label>
						<input class="product-edit-price product-price" type="text" maxlength="8">
					</div>

					<div class="section">
						<label class="product-description">Product Description</label>
						<textarea class="product-edit-description product-description"></textarea>
					</div>

					<div class="section">
						<label class="product-min">Product Minimum Quantity <span class="info">(leave empty for no restriction)</span></label>
						<input class="product-edit-min product-min" type="text" maxlength="8" value="1">
					</div>

					<div class="section">
						<label class="product-max">Product Maximum Quantity <span class="info">(leave empty for no restriction)</span></label>
						<input class="product-edit-max product-max" type="text" maxlength="8">
					</div>

					<div class="section">
						<label class="product-instructions">Product Instructions</label>
						<textarea class="product-edit-instructions product-instructions" maxlength="100"></textarea>
					</div>

					<div class="section">
						<label class="product-instructions-ml">Product Instructions Maximum Characters Allowed <span class="info">(leave empty for no restriction)</span></label>
						<input class="product-edit-instructions-ml product-instructions-ml" type="text" maxlength="8" value="100">
					</div>

					<div class="section">
						<label class="product-price">Product additions</label>

						<div class="product-edit-new-addition action-button">New Addition</div><div class="product-edit-add-remove-existing-additions action-button">Add/Remove Existing Additions</div>

						<div class="product-additions-wrapper"></div>
					</div>
				</div>

				<div class="additions-add-remove-existing hidden">
					<div class="action-button back">Back</div>

					<div class="product-existing-additions-wrapper"></div>
				</div>

				<div class="addition-edit hidden">
					<div class="action-button back">Back</div><div class="action-button update">Save</div><div class="status-message"></div>

					<div class="section">
						<label class="addition-name">Addition Name</label>
						<input class="addition-edit-name addition-name" type="text" maxlength="32">
					</div>

					<div class="section">
						<label class="addition-min">Addition Minimum Quantity <span class="info">(leave empty for no restriction)</span></label>
						<input class="addition-edit-min addition-min" type="text" maxlength="8">
					</div>

					<div class="section">
						<label class="addition-max">Addition Maximum Quantity <span class="info">(leave empty for no restriction)</span></label>
						<input class="addition-edit-max addition-max" type="text" maxlength="8">
					</div>

					<div class="section">
						<label class="addition-type">Addition Type</label>

						<label class="addition-type-label"><input type="radio" name="addition-type" value="single"> Single Choice Allowed Only</label>

						<label class="addition-type-label"><input type="radio" name="addition-type" value="multiple" checked> Multiple Choices Allowed</label>

						<label class="addition-type-label"><input type="radio" name="addition-type" value="text"> Free Text</label>
					</div>

					<div class="section">
						<label class="addition-price-range">Price Range</label>
						<label class="addition-price-range-label"><input type="checkbox" name="addition-price-range"> Use this addition to calculate the product price range</label>
					</div>

					<div class="section">
						<label class="addition-ingredients">Addition Ingredients</label>

						<div class="addition-edit-ingredients section"></div>
					</div>
				</div>

			</div>

		</main>

		<footer></footer>

	</div>

	<!-- JavaScript -->
	<script src="/cater4party/resources/assets/me-js/jquery.js" type="text/javascript"></script>
	<script src="/cater4party/resources/assets/me-js/filesaver.js" type="text/javascript"></script>
	<script src="/cater4party/resources/assets/me-js/app.js?v5" type="text/javascript"></script>

</body>
</html>
