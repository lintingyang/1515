package tw.com.softleader.e5e5.controller;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.com.softleader.e5e5.common.ajax.AjaxResponse;
import tw.com.softleader.e5e5.common.ajax.GridResponse;
import tw.com.softleader.e5e5.common.dao.CommonCriterion;
import tw.com.softleader.e5e5.common.dao.QueryOpType;
import tw.com.softleader.e5e5.security.entity.SecRole;
import tw.com.softleader.e5e5.security.service.SecRoleService;

@Controller
@RequestMapping(value="/admin/products")
public class ProductManageController {
	
	private Logger log = LoggerFactory.getLogger(this.getClass());
	
//	@Autowired
//	private SecRoleService secRoleService;
	
	@RequestMapping(value="/list",  method = RequestMethod.GET)
	public String listPage() {
		return "/product/productManageList";
	}
	

}
