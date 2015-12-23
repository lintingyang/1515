package tw.com.softleader.e5e5.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import tw.com.softleader.e5e5.entity.Board;
import tw.com.softleader.e5e5.entity.BoardCategoria;
import tw.com.softleader.e5e5.service.BoardCategoriaService;
import tw.com.softleader.e5e5.service.BoardService;

@Controller
@RequestMapping(value = "/boardCategorias")
public class BoardCategoriaController {

	@Autowired
	private BoardCategoriaService boardCategoriaService;
	@Autowired
	private BoardService boardService;

	@RequestMapping(value = "/list")
	public String list(Model model) {
		List<BoardCategoria> models = boardCategoriaService.getAll();
		model.addAttribute("beans", models);
		return "/boardCategoria/list";
	}

	@RequestMapping(value = "/query")
	public String query(@RequestParam("id") Integer id, Model model) {
		if (id != null) {
			BoardCategoria bc = boardCategoriaService.findById(id);
			if (bc != null) {
				List<Board> models = boardService.getBoardByBoardCategoria(bc);
				model.addAttribute("beans", models);
			}
			return "/board/list";
		}
		return "/boardCategoria/list";
	}

	@RequestMapping(value = "/delete")
	public String delete(Model model) {
		return "/boardCategoria/list";
	}

	@RequestMapping(value = "/add")
	public String add(Model model) {
		return "/boardCategoria/add";
	}

	@RequestMapping(value = "/insert")
	public String insert(Model model, @ModelAttribute BoardCategoria boardCategoria) {
		int result = boardCategoriaService.createBoardCategoria(boardCategoria.getName());
		if (result == 1) {
			model.addAttribute("message", "新增成功");
		} else {
			model.addAttribute("message", "新增失敗");
		}
		return "/boardCategoria/add";
	}

	@RequestMapping(value = "/edit")
	public String edit(Model model,BoardCategoria boardCategoria) {
		BoardCategoria bc = boardCategoriaService.findById(boardCategoria.getId());
		model.addAttribute("boardCategorias", bc);
		return "/boardCategoria/edit";
	}

	@RequestMapping(value = "/update")
	public String update(@ModelAttribute BoardCategoria boardCategoria,  Model model) {
		int result = boardCategoriaService.updateCategoria(boardCategoria.getId(), boardCategoria.getName());
		if (result == 1) {
			model.addAttribute("message", "修改成功");
		} else {
			model.addAttribute("message", "修改失敗");
		}
		return "/boardCategoria/edit";
	}

}
