(function($){
	var COOKIE_NAME = "softleader-harvard-mes-signin";
	
	$.fn.cookieMe = function() {
		var $root = $(this);
		if(!!!$root.attr("id")) {
			alert('cookie DOM must declare id');
		} else {
			var value = JSON.stringify(form2js($root.attr("id"), '.', true, null, true));
			$.cookie(COOKIE_NAME, value, {
				 json:true
			});
		}
	};
	
	$.fn.loadMyCookie = function(){
		var $root = $(this);
		if(!!!$root.attr("id")) {
			alert('cookie DOM must declare id');
		} else {
			try {
				var cookie = $.cookie(COOKIE_NAME);
				if(!$.isEmptyObject(cookie)) {
					JSON.parse(cookie, function(key, value) {
						if (!!key){
							var $el = $root.find('[name="'+key+'"]');
							if (!!$el && $el.length>0) {
								if ($el.attr('type') == 'checkbox') {
									$el.attr('checked', value == 'on' ? true : false);
								} else {
									$el.val(value);
								}
							}
						}
					});
				}
			} catch(e) {
				$.cookie(COOKIE_NAME, null);
			}
		}
	}
	
	$.fn.removeMyCookie = function() {
		$.cookie(COOKIE_NAME, null);
	}
})(jQuery);