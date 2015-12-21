package tw.com.softleader.e5e5.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import tw.com.softleader.e5e5.entity.Board;
import tw.com.softleader.e5e5.service.BoardService;

@Controller
@RequestMapping(value = "/boards")
public class BoardController {

	@Autowired
	private BoardService boardService;

	@RequestMapping(value = "/list")
	public String list(Model model) {
		List<Board> list = boardService.getBoardById();
		model.addAttribute("beans", list);
		return "/board/list";
	}

	@RequestMapping(value = "/list2")
	public String list2(Model model) {
		List<Board> list = boardService.getBoardByName();
		model.addAttribute("beans", list);
		return "/board/list";
	}

	@RequestMapping(value = "/query")
	public String query(@RequestParam("name") String name, Model model) {
		Board board =boardService.getBoardByName(name);
		model.addAttribute("beans", board);
		return "/board/list";
	}
}
