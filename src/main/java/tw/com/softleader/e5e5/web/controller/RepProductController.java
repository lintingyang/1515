package tw.com.softleader.e5e5.web.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.com.softleader.e5e5.common.ajax.AjaxResponse;
import tw.com.softleader.e5e5.common.ajax.GridResponse;
import tw.com.softleader.e5e5.common.dao.CommonCriterion;
import tw.com.softleader.e5e5.common.dao.QueryOpType;
import tw.com.softleader.e5e5.entity.Product;
import tw.com.softleader.e5e5.entity.Report;
import tw.com.softleader.e5e5.entity.User;
import tw.com.softleader.e5e5.security.entity.SecRole;
import tw.com.softleader.e5e5.security.service.SecRoleService;
import tw.com.softleader.e5e5.service.ReportService;
import tw.com.softleader.e5e5.service.UserService;

@Controller
@RequestMapping(value="/report/products")
public class RepProductController {
	
	private Logger log = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private ReportService reportService;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String listPage() {
		return "/e715/back/repProductList";
	}
	
	@RequestMapping(value = "/query")
	@ResponseBody
	public List<Report> query(Model model) {
		return reportService.findAll();
	}
	
	@RequestMapping(value = "/query/name")
	@ResponseBody
	public List<Report> queryName(@RequestParam("name") String name) {
		return reportService.findAllByName(name);
	}
	
	@RequestMapping(value = "/query/no")
	@ResponseBody
	public List<Report> queryNo() {
		return reportService.findAllUnread();
	}
	
	
	
	

//	@RequestMapping(method = RequestMethod.GET)
//	@ResponseBody
//	public GridResponse<Report> query(final Model model, final Report report, final Pageable pageable) {
//		Page<Report> page;
//		try {
//			final List<CommonCriterion> criterions = new ArrayList<CommonCriterion>();
////			 if (StringUtils.isNotEmpty(report.getProduct().getName())) {
////			 criterions.add(new CommonCriterion(QueryOpType.LIKE, "account", "%"
////			 + user.getAccount() + "%"));
////			 }
//			page = reportService.getByCondition(criterions, pageable);
//		} catch (final Exception e) {
//			return new GridResponse<Report>(e);
//		}
//		return new GridResponse<Report>(page);
//	}
}
