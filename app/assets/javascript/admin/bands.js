$(document).ready(function() {

	$("#addField").on('click',function(event){
		var addFields = $('.addField'),
			fieldsLen = addFields.length;
		$(addFields[fieldsLen - 1]).after(
			"<p class='addField'>" +
				"<label for='band_band_images_attributes_"+fieldsLen+"_image'>Image File</label>" +
				"<input type='file' name='band[band_images_attributes]["+ fieldsLen +
					"][image]' id='band_band_images_attributes_"+fieldsLen+"_image'>" +
			"</p>"
		);
	})
})
