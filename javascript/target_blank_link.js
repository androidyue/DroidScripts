$(document).bind('DOMNodeInserted', function(event) {
	$('a[href^="http"]').each(
        function(){
			if (!$(this).attr('target')) {
				$(this).attr('target', '_blank')
			}   
        }
    );
});
