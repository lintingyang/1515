package tw.com.softleader.e5e5.controller;

import java.util.List;

import javax.persistence.Entity;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.sym.Name;

import tw.com.softleader.e5e5.entity.Chat;
import tw.com.softleader.e5e5.entity.Product;
import tw.com.softleader.e5e5.entity.User;
import tw.com.softleader.e5e5.service.ProductService;

@Controller
@RequestMapping(value = "/products")

@Service
public class ProductController {

	@Autowired
	public ProductService productService;

	@RequestMapping(value = "/list") // ** /products/list
	public String list(Model model) {
		List<Product> products = productService.getAllProducts();
		model.addAttribute("products", products);
		return "/product/list";
	}

	@RequestMapping(value = "/query")
	public String query(Model model, @RequestParam("pKeywords") String name) {
		List<Product> products = productService.getAllByKeywords(name);
		model.addAttribute("products", products);
		return "/product/list";
	}

	// @RequestMapping(value = "/query")
	// public String query(@ModelAttribute User user,Model model) {
	// chatService.postChat(user.getId(), "messages_no");
	// List<Chat> chats = chatService.getLastThreeChats();
	// model.addAttribute("beans", chats);
	// return "/chat/list";
	// }

	@RequestMapping(value = "/delete")
	public String delete(Model model) {
		return "/product/list";
	}

	@RequestMapping(value = "/add")
	public String add(Model model) {
		return "/product/add";
	}

	@RequestMapping(value = "/insert")
	public String insert(Model model) {
		return "/product/add";
	}

	@RequestMapping(value = "/edit")
	public String edit(Model model, @RequestParam("pId") Integer id) {
		Product products = productService.getOneById(id);
		model.addAttribute("p", products);
		return "/product/edit";
	}

	@RequestMapping(value = "/update")
	public String update(Model model, @RequestParam("pId") Integer id, @RequestParam("pPS") char postStatus) {
		Product products = productService.update(id, postStatus);
		model.addAttribute("p", products);
		return "/product/edit";
	}

}
