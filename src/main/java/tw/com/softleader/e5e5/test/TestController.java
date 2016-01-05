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
@RequestMapping(value = "/test/chat")
public class TestController {

	private Logger log = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private ChatService chatService;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String listPage() {
		return "/test/testList";
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String addPage() {
		return "/test/testAdd";
	}

	// @RequestMapping(value = "/insert")
	// @ResponseBody
	// public AjaxResponse<Chat> insert(final Model model, @RequestParam("id")
	// Integer id,
	// @RequestParam("message") String message) {
	//
	// final AjaxResponse<Chat> response = new AjaxResponse<Chat>();
	// log.debug("^^^^^^^^^^^^^^^^^^^^^^^^^^" + id);
	// try {
	// if (response.isMessagesEmpty()) {
	// Chat chat = chatService.postChat(id, message);
	// response.setData(chat);
	// }
	// } catch (final Exception e) {
	// response.addException(e);
	// }
	// return response;
	// }

	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public String editPage(@PathVariable("id") final int id, final Model model) {

		Chat role = chatService.getOne(id);
		model.addAttribute("entity", role);

		return "/test/testEdit";
	}

	@RequestMapping(method = RequestMethod.GET)
	@ResponseBody
	public GridResponse<Chat> query(final Model model, final Chat chat, final Pageable pageable) {

		Page<Chat> page;
		if (chat != null) {
			log.debug("********chat=" + chat.getMessages());
			// log.debug("********chat=" + chat.getUser());
		}
		try {
			final List<CommonCriterion> criterions = new ArrayList<CommonCriterion>();

			if (StringUtils.isNotEmpty(chat.getMessages())) {
				criterions.add(new CommonCriterion(QueryOpType.LIKE, "messages", "%" + chat.getMessages() + "%"));
			}

			// if (StringUtils.isNotEmpty(form.getName())) {
			// criterions.add(new CommonCriterion(QueryOpType.LIKE, "name", "%"
			// + form.getName() + "%"));
			// }

			page = chatService.getByCondition(criterions, pageable);

		} catch (final Exception e) {
			return new GridResponse<Chat>(e);
		}

		return new GridResponse<Chat>(page);
	}

	@RequestMapping(method = RequestMethod.POST)
	@ResponseBody
	public AjaxResponse<Chat> insert(final Model model, @RequestBody final Chat form) {

		final AjaxResponse<Chat> response = new AjaxResponse<Chat>();

		try {

			 if (StringUtils.isEmpty(form.getMessages())) {
			 response.addMessage("messages", "訊息不得空白");
			 }
			
			 if (form != null && form.getUser() == null) {
			 log.debug("testestestestestset");
				 response.addMessage("user.id", "名稱不得空白");
			 }

			if (response.isMessagesEmpty()) {

				final Chat insertResult = chatService.insert(form);
				response.setData(insertResult);
			}
		} catch (final Exception e) {
			response.addException(e);
		}
		return response;
	}

	// @RequestMapping(method = RequestMethod.PUT)
	// @ResponseBody
	// public AjaxResponse<Chat> update(final Model model, @RequestParam("id")
	// Integer id, @RequestParam("message") String message) {
	//
	// final AjaxResponse<Chat> response = new AjaxResponse<Chat>();
	//
	// try {
	//// if (StringUtils.isEmpty(form.getName())) {
	//// response.addMessage("name", "名稱不得空白");
	//// }
	//
	//
	// if (response.isMessagesEmpty()) {
	// final Chat updateResult = chatService.update(id,message);
	// response.setData(updateResult);
	// }
	// } catch (final Exception e) {
	// response.addException(e);
	// }
	// return response;
	// }

	@RequestMapping(method = RequestMethod.PUT)
	@ResponseBody
	public AjaxResponse<Chat> update(final Model model, @RequestBody final Chat form) {
		final AjaxResponse<Chat> response = new AjaxResponse<Chat>();

		try {
			// if (StringUtils.isEmpty(form.getName())) {
			// response.addMessage("name", "名稱不得空白");
			// }

			if (response.isMessagesEmpty()) {
				final Chat updateResult = chatService.update(form);
				response.setData(updateResult);
			}
		} catch (final Exception e) {
			response.addException(e);
		}
		return response;
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
	@ResponseBody
	public AjaxResponse<Chat> delete(@PathVariable(value = "id") final int id) {
		log.debug("{}", id);
		final AjaxResponse<Chat> response = new AjaxResponse<Chat>();

		try {
			if (response.isMessagesEmpty()) {
				chatService.delete(id);
			}
		} catch (final Exception e) {
			return new AjaxResponse<>(e);
		}
		return response;
	}

}
