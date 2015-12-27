/**
 * 此plugin只支援最多一層的bootstrap下拉(即最多一個ul)
 * 所有a link應該被li包覆起來, active的class會加在li上
 * 
 * ASSUME: 傳入的path『應包含』contextPat，但『不包含』query string
 * >>>>> 如果想讓此plugin更精準的判斷path (如不被query string等其他因素影響)
 * >>>>> 則專案只需額外再放入purl jquery plugin (https://github.com/allmarkedup/purl) MIT LICENSE
 * 
 * 此plugin針對crud有預設的新增或修改頁特別處理:
 * 任何結尾為'add'(預期為新增頁), 或數字(預期為修改頁的ID)的path, 都會改為'list'(預期為列表頁,且預期navbar在crud都是先轉列表頁)來做判斷
 * 
 * 如果想要overwrite上述default的處理方式, 則可以在呼叫navActive時給第二個參數: 傳入一個function且有一個input為path, output為處理過的string
 * 範例: 
 * 	var path = window.location.pathname;
 * 	$(".nav").navActive(path, function(path) {
 * 		// return handled path	
 * 	});
 */
;
(function($) {
	
	$.fn.extend({
		navActive: function(path, pathConverter) {
			var $nav = $(this);
			path = normalize(path);
			
			if (pathConverter) {
				path = pathConverter.call($nav[0], path);
			} else {
				var lastUrl = segment(path, -1);
				if (lastUrl === 'add' || !isNaN(parseInt(lastUrl))) {
					path = path.substr(0, path.length - lastUrl.length) + 'list';
				} 
			}
			
			return this.each(function() {
				$nav.find(".active").removeClass("active");
				
				$nav.find("li > a").filter(function() {
					return path === normalize($(this).attr("href"));
				}).parent().addClass("active");
				
				$nav.find("ul").filter(function() {
					return $(this).find(".active").length > 0;
				}).parent().addClass("active");
			});
		}
		,navBreadcrumb: function($breadcrumb) {
			if ($breadcrumb.length <= 0) return this;
			return this.each(function() {
				$(this).find(".active > a:nth-child(1)").each(function() {
					var $func = $(this).text();
					if ($(this).attr('href') !== '#') { // 如果active的a有設url, 則$breadcrumb的功能名稱也改為a link
						$func = $('<a></a>').append($(this).text()).attr('href', $(this).attr('href'));
					}
					$breadcrumb.append($("<li></li>").append($func).append("&nbsp;"));
				});
				$breadcrumb.find("li").last().addClass("active");
			});
		}
	});
	
	function segment(path, idx) {
		try {
			return $.url(path).segment(idx);
		} catch(ex) {
			var segments = path.split('/');
			if (idx < 0) {
				idx = segments.length+idx;
			}
			return segments[idx];
		}
	}
	
	function normalize(path) {
		try {
			return $.url(path).attr('path');
		} catch(ex) {
			return path;
		}
	}

})(jQuery);