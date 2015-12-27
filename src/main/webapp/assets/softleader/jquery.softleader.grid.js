;
(function($) {

	var $sortpic = $('<span class="glyphicon glyphicon-sort"></span>');
	var $ascpic = $('<span class="glyphicon glyphicon-sort-by-attributes"></span>').addClass('sort-asc');
	var $descpic = $('<span class="glyphicon glyphicon-sort-by-attributes-alt"></span>').addClass('sort-desc');
	var delimiter = ',';

	$.fn.extend({
		setGridParam: function(newParams) {
			return this.each(function() {
				$(this).trigger('setGridParam', newParams);
			});
		},
		getGridParam: function(key) {
			var param = {};
			param['key'] = key;
			$(this).trigger('getGridParam', param);
			return param.value;
		},
		slGrid: function(options) {
			var p;
			var $grid;
			var infinitePage;
			
			p = $.extend({
				url: "",
				dataFormId: "",
				page: 0,
				rowNum: 10,
				colModel: [],
				colNames: [],
				datatype: "json",
				mtype: "GET",
				jsonReader: {
					rows: "data",
					page: "pageAt",
					total: "totalPages",
					records: "totalElements",
					cell: "cell",
					id: "id"
				},
				sortorder: "ASC",
				sortname: 'id',
				loadBeforeSend: null,
				loadComplete: null,
				loadError: null,
				prmNames: {
					page: "page",
					rows: "size",
					sort: "sort",
					order: "sort.dir",
					totalrows: "totalrows"
				},
				emptyrecords: "",
				pager: "",
				scroll: ""
			}, options);

			$grid = $(this).empty();
			
			function drawHeader($grid, p) {
				var $thead = $('<thead></thead>');
				var $tr = $('<tr></tr>');
				for ( var idx in p.colNames) {
					var $th = $('<th></th>').append(p.colNames[idx]).append('&nbsp;');
					var col = p.colModel[idx];
					var index = (!!col.index) ? col.index : col.name;
					$th.append($('<div class="hide sortinfo"></div>').append(index + delimiter + p.sortorder));

					if (!!col.sortable) {
						$th.append($sortpic.clone());

						$th.click(function() {
							resetHeaderSortPic($grid);
							var $sortinfo = $(this).find('.sortinfo');
							var sortname = $sortinfo.html().split(delimiter)[0];
							var sortorder = ('DESC' == $sortinfo.html().split(delimiter)[1]) ? 'ASC' : 'DESC';
							populate($grid, p, 0, sortname, sortorder, true);
						}).hover(function() {
							$(this).css('cursor', 'pointer');
						});
					}

					if (col.hidden) {
						$th.attr('hidden', true);
					}
					if (!!col.width) {
						$th.css('width', col.width);
					}
					$tr.append($th);
				}
				$thead.append($tr);
				$grid.append($thead);
			}

			function reloadBody($grid, p, data, cleanBeforeReload) {
				var cleanBeforeReload = (typeof cleanBeforeReload == 'undefined') ? true : cleanBeforeReload;
				if (cleanBeforeReload && $grid.find('tbody').length > 0) {
					$grid.find('tbody').empty();
					infinitePage = 0;
				}

				if ($grid.find('tbody').length <= 0) {
					$grid.append($("<tbody></tbody>"));
				} 

				var jreader = p.jsonReader;
				var $tbody = $grid.find('tbody');
				var rows = eval('data.' + jreader.rows);
				var rows = eval('data.' + jreader.rows);
				if (rows.length > 0) {
					for ( var rIdx in rows) {
						var row = rows[rIdx];
						row['idx'] = rIdx;
						$tbody.append(renderTr(row));
					}
				}
			}
			
			function renderEmptyTrIfBodyEmpty($grid) {
				if ($grid.find('tbody').length <= 0) {
					$grid.append($("<tbody></tbody>"));
				}
				var $tbody = $grid.find('tbody');
				if ($tbody.find('td').length <= 0) {
					var $td = $('<td></td>').append((p.emptyrecords)?p.emptyrecords:'...');
					$td.attr('colspan', p.colNames.filter(function(col) {return !col.hidden}).length);
					$td.attr('align', 'center');
					$td.css('style', 'color:red');
					$tbody.append($('<tr></tr>').append($td));
				}
			}
			
			function renderTr(row) {
				var $tr = $('<tr></tr>');
				for ( var cIdx in p.colModel) {
					var $td = $('<td></td>');
					var col = p.colModel[cIdx];
					var value = row[col.name];
					if (!!col.formatter && $.isFunction(col.formatter)) {
						value = col.formatter.call($td, value, row);
					}
					if (!!col.number) {
						value = $.number(value);
					}
					$td.append(value);
					if (col.hidden) {
						$td.attr('hidden', true);
					}
					if (!!col.align) {
						$td.attr('align', col.align);
					}
					if (!!col.cellattr && $.isFunction(col.cellattr)) {
						var celp = col.cellattr.call($td, value, row);
						// assume is JSON object
						if(!!celp && typeof celp === "object") {
							$.each(celp, function(k, v) {
								$td.attr(k, v);
							});
						}
					}
					$tr.append($td);
				}
				return $tr;
			}

			function drawPager($grid, p, data, $pager) {
				$pager.empty();
				$pager.parent().find("#currentOfTotal").remove();
				var totalPages = eval('data.' + p.jsonReader.total);
				if (totalPages > 0) {
					var currentPage = eval('data.' + p.jsonReader.page) + 1;
					$pager.bootstrapPaginator({
						bootstrapMajorVersion: 3,
						numberOfPages: 10,
						currentPage: currentPage,
						totalPages: totalPages,
						tooltipTitles: function(type, page, current) {
							switch (type) {
							case "first":
								return "First Page";
							case "prev":
								return "Previous page";
							case "next":
								return "Next page";
							case "last":
								return "Last Page";
							case "page":
								return "Page " + page;
							}
						},
						onPageChanged: function(event, oldPage, newPage) {
							var sortname = null;
							var sortorder = null;
							var $sorted = $grid.find('thead').find('.sort-asc,.sort-desc');
							if ($sorted.length > 0) {
								var $sortinfo = $sorted.parent().find('.sortinfo');
								sortname = $sortinfo.html().split(delimiter)[0];
								sortorder = $sortinfo.html().split(delimiter)[1];
							}
							// you should modify here to suitable pagination request in server side
							populate($grid, p, newPage - 1, sortname, sortorder);
						}
					});
					$pager.parent().append($("<div id='currentOfTotal'></div>").append("Page " + currentPage + " of " +totalPages));
				}
			}

			function populate($grid, p, page, sortname, sortorder, cleanBeforeReload) {
				var cleanBeforeReload = (typeof cleanBeforeReload == 'undefined') ? true : cleanBeforeReload;
				var data = (!!jQuery.trim(p.dataFormId)) ? form2js(jQuery("#" + p.dataFormId).attr("id"), '.', true, null, true) : {};
				if (jQuery.type(page) !== "number") {
					page = p.page;
				}
				if (!!!sortname) {
					sortname = p.sortname;
				}
				if (!!!sortorder) {
					sortorder = p.sortorder;
				}
				changeSortPicTo($grid, sortname, sortorder)
				// you should modify here to suitable pagination request in server side
				data[p.prmNames.page] = page;
				data[p.prmNames.rows] = p.rowNum;
				data[p.prmNames.sort] = sortname + delimiter + sortorder;
				// data[p.prmNames.order] = sortorder;.
				
				var accessURL = p.url;
				if(accessURL.indexOf('?') > 0 ) {
					accessURL = accessURL + "&rd="+Math.random();
				} else {
					accessURL = accessURL + "?rd="+Math.random();
				}
				
				$.ajax({
					type: p.mtype,
					dataType: p.datatype,
					contentType: 'application/json; charset=utf-8',
					url: accessURL,
					beforeSend: function(jqXHR, settings) {
						if (!!p.loadBeforeSend && $.isFunction(p.loadBeforeSend)) {
							return p.loadBeforeSend.call(null, jqXHR, settings, data);
						}
						return true;
					},
					data: ((p.mtype.toUpperCase() == 'GET') ? data : JSON.stringify(data))
				}).success(function(data, textStatus, jqXHR) {
					reloadBody($grid, p, data, cleanBeforeReload);
					var $pager = $("#" + p.pager);
					if ($pager.length > 0) {
						drawPager($grid, p, data, $pager);
					}
				}).error(function(jqXHR, textStatus, errorThrown) {
					if (!!p.loadError && $.isFunction(p.loadError)) {
						p.loadError.call(null);
					}
				}).complete(function(jqXHR, textStatus) {
					renderEmptyTrIfBodyEmpty($grid);
					p.page = page+1;
					if (!!p.loadComplete && $.isFunction(p.loadComplete)) {
						p.loadComplete.call(null);
					}
				});
			}

			function changeSortPicTo($grid, changeSortname, changeToSortorder) {
				$grid.find('thead').find('.sortinfo').each(function() {
					var $sortinfo = $(this);
					var sortname = $sortinfo.html().split(delimiter)[0];
					if (sortname == changeSortname) {
						var $th = $sortinfo.parent();
						$th.find('.glyphicon').remove();
						$th.append(('DESC' == changeToSortorder) ? $descpic.clone() : $ascpic.clone());
						$sortinfo.html(sortname + delimiter + changeToSortorder);
					}
				});
			}

			function resetHeaderSortPic($grid) {
				$grid.find('thead').find('.sort-asc,.sort-desc').each(function() {
					var $th = $(this).parent();
					$(this).remove();
					$th.append($sortpic.clone());
				});
			}

			function bindEvents($grid, p) {
				$grid.bind('reloadGrid', function() {
					// resetHeaderSortPic($grid);
					var sortname = p.sortname;
					var sortorder = p.sortorder;
					var $sorted = $grid.find('thead').find('.sort-asc,.sort-desc');
					if ($sorted.length > 0) {
						var $sortinfo = $sorted.parent().find('.sortinfo');
						sortname = $sortinfo.html().split(delimiter)[0];
						sortorder = $sortinfo.html().split(delimiter)[1];
					}
					// (p.page)?p.page-1:0
					populate($grid, p, 0, sortname, sortorder);
				});
				
				$grid.bind('setGridParam', function(event, newParams) {
					if ($grid && typeof newParams === 'object') {
						$.extend(true, p, newParams);
					}
				});
				
				$grid.bind('getGridParam', function(event, param) {
					if (param.key) {
						param['value'] = p[param.key];
					}
				});
			}

			// 無限下拉, 類似facebook一直往下捲的模式, 每卷一次就讀取下一次的分頁
			function bindInfiniteScroll($grid, p) {

				var func = debounce(function() {
					var height_of_browser_viewport = $(window).height();
					var height_of_HTML_document = $(document).height();
					var current_scroll_bar_position = $(window).scrollTop();
					var scroll_bar_bottom_buffer = 10;
					// console.log("current_scroll_bar_position:" + current_scroll_bar_position + " + scroll_bar_bottom_buffer:" + scroll_bar_bottom_buffer +
					// " = " + (current_scroll_bar_position + scroll_bar_bottom_buffer));
					// console.log("height_of_HTML_document:" + height_of_HTML_document + " - height_of_browser_viewport:" + height_of_browser_viewport + " =
					// " + (height_of_HTML_document - height_of_browser_viewport));

					if (current_scroll_bar_position + scroll_bar_bottom_buffer >= height_of_HTML_document - height_of_browser_viewport) {
						var sortname = p.sortname;
						var sortorder = p.sortorder;
						var $sorted = $grid.find('thead').find('.sort-asc,.sort-desc');
						if ($sorted.length > 0) {
							var $sortinfo = $sorted.parent().find('.sortinfo');
							sortname = $sortinfo.html().split(delimiter)[0];
							sortorder = $sortinfo.html().split(delimiter)[1];
						}
						populate($grid, p, ++infinitePage, sortname, sortorder, false);
					}
				}, 100);

				$(window).scroll(func);
			}

			function debounce(func, wait, immediate) {
				var timeout;
				return function() {
					var context = this, args = arguments;
					clearTimeout(timeout);
					timeout = setTimeout(function() {
						timeout = null;
						if (!immediate) func.apply(context, args);
					}, wait);
					if (immediate && !timeout) func.apply(context, args);
				};
			}
			
			return this.each(function() {
				if (p.colModel.length != p.colNames.length) {
					alert('colModel數目跟colNames數目不合');
					return;
				}
				drawHeader($grid, p);
				populate($grid, p);
				bindEvents($grid, p);
				
				if (!!$.trim(p.scroll)) {
					infinitePage = p.page;
					bindInfiniteScroll($grid, p);
				}
			});
		}
	});

})(jQuery);