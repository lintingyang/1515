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
import tw.com.softleader.e5e5.entity.Product;
import tw.com.softleader.e5e5.service.ProductService;

@Controller
@RequestMapping(value = "/admin/products")
public class ProductManageController {

	private Logger log = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private ProductService productService;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String listPage() {
		return "/product/proManList";
	}


	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public String editPage(@PathVariable("id") final int id, final Model model) {

		Product oneProduct = productService.getOne(id);
		model.addAttribute("entity", oneProduct);

		return "/product/proManEdit";
	}

	@RequestMapping(method = RequestMethod.GET)
	@ResponseBody
	public GridResponse<Product> query(final Model model, final Product product, final Pageable pageable) {
		Page<Product> page;
		try {
			final List<CommonCriterion> criterions = new ArrayList<CommonCriterion>();
//			if (StringUtils.isNotEmpty(product.getId())) {
//				log.debug("============================" );
//				criterions.add(new CommonCriterion(QueryOpType.EQ, "id", product.getId()));
//			}
			if (StringUtils.isNotEmpty(product.getName())) {
				criterions.add(new CommonCriterion(QueryOpType.LIKE, "name", "%" + product.getName() + "%"));
			}

			page = productService.getByCondition(criterions, pageable);

		} catch (final Exception e) {
			return new GridResponse<Product>(e);
		}

		return new GridResponse<Product>(page);
	}



	@RequestMapping(method = RequestMethod.PUT)
	@ResponseBody
	public AjaxResponse<Product> update(final Model model, @RequestBody final Product form) {
		final AjaxResponse<Product> response = new AjaxResponse<Product>();

		try {

			if (response.isMessagesEmpty()) {
				final Product updateResult = productService.updateBackPostStatus(form.getId(), form.getPostStatus());
				response.setData(updateResult);
			}
		} catch (final Exception e) {
			response.addException(e);
		}
		return response;
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
	@ResponseBody
	public AjaxResponse<Product> delete(@PathVariable(value = "id") final int id) {
		log.debug("{}", id);
		final AjaxResponse<Product> response = new AjaxResponse<Product>();

		try {
			if (response.isMessagesEmpty()) {
				productService.delete(id);
			}
		} catch (final Exception e) {
			return new AjaxResponse<>(e);
		}
		return response;
	}

}
