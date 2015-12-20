package tw.com.softleader.e5e5.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import tw.com.softleader.e5e5.entity.BoardCategoria;
import tw.com.softleader.e5e5.service.BoardCategoriaService;

@Controller
@RequestMapping(value = "/boardCategorias")
public class BoardCategoriaController {

	@Autowired
	private BoardCategoriaService boardCategoriaService;

	@RequestMapping(value = "/list")
	public String list(Model model) {
		List<BoardCategoria> models = boardCategoriaService.getAll();
		model.addAttribute("beans", models);
		return "/boardCategoria/list";
	}

	@RequestMapping(value = "/query")
	public String query(@ModelAttribute BoardCategoria boardCategoria, Model model) {
		return "/boardCategoria/list";
	}

	@RequestMapping(value = "/delete")
	public String delete(Model model) {
		return "/boardCategoria/list.jsp";
	}

	@RequestMapping(value = "/add")
	public String add(Model model) {
		return "/boardCategoria/add.jsp";
	}

	@RequestMapping(value = "/insert")
	public String insert(Model model) {
		return "/boardCategoria/add.jsp";
	}

	@RequestMapping(value = "/edit")
	public String edit(Model model) {
		return "/boardCategoria/edit.jsp";
	}

	@RequestMapping(value = "/update")
	public String update(Model model) {
		return "/boardCategoria/add.jsp";
	}

}
