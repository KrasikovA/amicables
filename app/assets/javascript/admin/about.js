$(document).ready(
	function(){
		var elements = document.getElementById('editable'),
	    	editor = new MediumEditor(elements),
	    	$submit = $("[type=submit]");
	    $submit.on('click',sendDescription);


		function sendDescription(event){
			var desc = editor.serialize().editable.value,
				$hidden = $("#about_page_description");
			$hidden.val(desc);
		}	
	}
)
