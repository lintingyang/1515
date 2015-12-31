package tw.com.softleader.e5e5.test;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.imageio.ImageIO;

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
import org.springframework.web.multipart.MultipartFile;

import tw.com.softleader.e5e5.common.ajax.AjaxResponse;
import tw.com.softleader.e5e5.common.ajax.GridResponse;
import tw.com.softleader.e5e5.common.dao.CommonCriterion;
import tw.com.softleader.e5e5.common.dao.QueryOpType;
import tw.com.softleader.e5e5.entity.Chat;
import tw.com.softleader.e5e5.security.entity.SecRole;
import tw.com.softleader.e5e5.security.service.SecRoleService;
import tw.com.softleader.e5e5.service.ChatService;

@Controller
@RequestMapping(value="/test/chat")
public class TestController {
	
	private Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private ChatService chatService;
	
	@RequestMapping(value="/list",  method = RequestMethod.GET)
	public String listPage() {
		return "/test/testList";
	}
	
	@RequestMapping(value="/add",  method = RequestMethod.GET)
	public String addPage() {
		return "/test/testAdd";
	}
	
	@RequestMapping(value = "/insert")
	@ResponseBody
	public AjaxResponse<Chat> insert(final Model model,@RequestParam("id") Integer id, @RequestParam("message") String message) {
		
		final AjaxResponse<Chat> response = new AjaxResponse<Chat>();
		log.debug("^^^^^^^^^^^^^^^^^^^^^^^^^^"+id);
		try {
			if (response.isMessagesEmpty()) {
				Chat chat = chatService.postChat(id, message);
				response.setData(chat);
			}
		} catch (final Exception e) {
			response.addException(e);
		}
		return response;
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
	@RequestMapping(method = RequestMethod.GET)
	@ResponseBody
	public GridResponse<Chat> query(final Model model, final Chat chat, final Pageable pageable) {
		
		Page<Chat> page;

		try {
			final List<CommonCriterion> criterions = new ArrayList<CommonCriterion>();

//			if (StringUtils.isNotEmpty(form.getCode())) {
//				criterions.add(new CommonCriterion(QueryOpType.LIKE, "code", "%" + form.getCode() + "%"));
//			}
//			
//			if (StringUtils.isNotEmpty(form.getName())) {
//				criterions.add(new CommonCriterion(QueryOpType.LIKE, "name", "%" + form.getName() + "%"));
//			}


			page = chatService.getAll(pageable);

		} catch (final Exception e) {
			return new GridResponse<>(e);
		}

		return new GridResponse<>(page);
	}
//	
//	@RequestMapping(method = RequestMethod.POST)
//	@ResponseBody
//	public AjaxResponse<SecRole> insert(final Model model, @RequestBody final SecRole form) {
//		log.debug("{}", form);
//		final AjaxResponse<SecRole> response = new AjaxResponse<SecRole>();
//
//		try {
//			
//			if (StringUtils.isEmpty(form.getName())) {
//				response.addMessage("code", "代碼不得空白");
//			}
//			
//			if (StringUtils.isEmpty(form.getName())) {
//				response.addMessage("name", "名稱不得空白");
//			}
//
//
//			if (response.isMessagesEmpty()) {
//				
//				final SecRole insertResult = secRoleService.insert(form);
//				response.setData(insertResult);
//			}
//		} catch (final Exception e) {
//			response.addException(e);
//		}
//		return response;
//	}
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
