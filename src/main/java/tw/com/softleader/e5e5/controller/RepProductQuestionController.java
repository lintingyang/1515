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
@RequestMapping(value="/report/products/questions")
public class RepProductQuestionController {
	
	private Logger log = LoggerFactory.getLogger(this.getClass());
	
//	@Autowired
//	private SecRoleService secRoleService;
	
	@RequestMapping(value="/list",  method = RequestMethod.GET)
	public String listPage() {
		return "/report/repProductQuestionList";
	}
	
//	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
//	public String editPage(@PathVariable("id") final long id, final Model model) {
//		
//		SecRole role = secRoleService.getOne(id);
//		
//		model.addAttribute("entity", role);
//		
//		return "/security/roleEdit";
//	}
//	
//	
//	@RequestMapping(method = RequestMethod.GET)
//	@ResponseBody
//	public GridResponse<SecRole> query(final Model model, final SecRole form, final Pageable pageable) {
//		log.debug("{}", form);
//		Page<SecRole> page;
//
//		try {
//			final List<CommonCriterion> criterions = new ArrayList<CommonCriterion>();
//
//			if (StringUtils.isNotEmpty(form.getCode())) {
//				criterions.add(new CommonCriterion(QueryOpType.LIKE, "code", "%" + form.getCode() + "%"));
//			}
//			
//			if (StringUtils.isNotEmpty(form.getName())) {
//				criterions.add(new CommonCriterion(QueryOpType.LIKE, "name", "%" + form.getName() + "%"));
//			}
//
//
//			page = secRoleService.getByCondition(criterions, pageable);
//
//		} catch (final Exception e) {
//			return new GridResponse<>(e);
//		}
//
//		return new GridResponse<>(page);
//	}
//	
//
//	@RequestMapping(method = RequestMethod.PUT)
//	@ResponseBody
//	public AjaxResponse<SecRole> update(final Model model, @RequestBody final SecRole form) {
//		log.debug("{}", form);
//		final AjaxResponse<SecRole> response = new AjaxResponse<SecRole>();
//
//		try {
//			if (StringUtils.isEmpty(form.getName())) {
//				response.addMessage("name", "名稱不得空白");
//			}
//
//
//			if (response.isMessagesEmpty()) {
//				final SecRole updateResult = secRoleService.update(form);
//				response.setData(updateResult);
//			}
//		} catch (final Exception e) {
//			response.addException(e);
//		}
//		return response;
//	}
//
//	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
//	@ResponseBody
//	public AjaxResponse<SecRole> delete(@PathVariable(value = "id") final long id) {
//		log.debug("{}", id);
//		final AjaxResponse<SecRole> response = new AjaxResponse<SecRole>();
//
//		try {
//			if (response.isMessagesEmpty()) {
//				secRoleService.delete(id);
//			}
//		} catch (final Exception e) {
//			return new AjaxResponse<>(e);
//		}
//		return response;
//	}	

}
