package tw.com.softleader.e5e5.web.controller;

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
import tw.com.softleader.e5e5.entity.User;
import tw.com.softleader.e5e5.service.UserService;

@Controller
@RequestMapping(value = "/admin/users")
public class UserManageController {

	private Logger log = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private UserService userService;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String listPage() {
		return "/e715/back/userManList";
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public String editPage(@PathVariable("id") final int id, final Model model) {

		User oneUser = userService.getOne(id);
		model.addAttribute("entity", oneUser);

		return "/e715/back/userManEdit";
	}
	
	@RequestMapping(method = RequestMethod.GET)
	@ResponseBody
	public GridResponse<User> query(final Model model, final User user, final Pageable pageable) {
		Page<User> page;

		try {
			final List<CommonCriterion> criterions = new ArrayList<CommonCriterion>();

			 if (StringUtils.isNotEmpty(user.getAccount())) {
			 criterions.add(new CommonCriterion(QueryOpType.LIKE, "account", "%"
			 + user.getAccount() + "%"));
			 }

			page = userService.getByCondition(criterions, pageable);

		} catch (final Exception e) {
			return new GridResponse<User>(e);
		}

		return new GridResponse<User>(page);
	}
	@RequestMapping(method = RequestMethod.PUT)
	@ResponseBody
	public AjaxResponse<User> update(final Model model, @RequestBody final User form) {
		final AjaxResponse<User> response = new AjaxResponse<User>();

		try {

			if (response.isMessagesEmpty()) {
				final User updateResult = userService.updateIsolated(form.getId(), form.getIsolated());
				response.setData(updateResult);
			}
		} catch (final Exception e) {
			response.addException(e);
		}
		return response;
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
	@ResponseBody
	public AjaxResponse<User> delete(@PathVariable(value = "id") final int id) {
		log.debug("{}", id);
		final AjaxResponse<User> response = new AjaxResponse<User>();

		try {
			if (response.isMessagesEmpty()) {
				userService.delete(id);
			}
		} catch (final Exception e) {
			return new AjaxResponse<>(e);
		}
		return response;
	}

}
