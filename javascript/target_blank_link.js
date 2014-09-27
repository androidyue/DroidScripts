/*To use the  DOMNodeInserted event listening, jquery is required*/
$(document).bind('DOMNodeInserted', function(event) {
	$('a[href^="http"]').each(
        function(){
			if (!$(this).attr('target')) {
				$(this).attr('target', '_blank')
			}   
        }
    );
});
