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
import tw.com.softleader.e5e5.entity.Reply;
import tw.com.softleader.e5e5.entity.Thread;
import tw.com.softleader.e5e5.entity.User;
import tw.com.softleader.e5e5.service.BoardCategoriaService;
import tw.com.softleader.e5e5.service.BoardService;
import tw.com.softleader.e5e5.service.ReplyService;
import tw.com.softleader.e5e5.service.ThreadService;
import tw.com.softleader.e5e5.service.UserService;

@Controller
@RequestMapping(value = "/threads")
public class ThreadController {

	// @Autowired
	// private UserService userService;
	@Autowired
	private BoardService boardService;
	@Autowired
	private ThreadService threadService;
	@Autowired
	private ReplyService replyService;
	@Autowired
	private BoardCategoriaService boardCategoriaService;

	@RequestMapping(value = "/admin/list")
	public String list(Model model) {
		List<Thread> list = threadService.getThreadById();
		model.addAttribute("beans", list);
		return "/thread/list";
	}

	@RequestMapping(value = "/list2")
	public String list2(Model model) {
		List<Thread> list = threadService.getThreadByCreatedTime();
		model.addAttribute("beans", list);
		return "/thread/list";
	}

	@RequestMapping(value = "/query")
	public String list(@RequestParam("id") Integer id, Model model) {
		Thread td = threadService.getThreadById(id);
		if (td != null) {
			List<Reply> models = replyService.getReplyByThread(td);
			model.addAttribute("beans", models);
		}
		return "/reply/list";
	}

	@RequestMapping(value = "/add")
	public String add(Model model) {
		List<BoardCategoria> modelbc = boardCategoriaService.getAll();
		model.addAttribute("beans", modelbc);
		List<Board> models = boardService.getBoardByName();
		model.addAttribute("boards", models);
		return "/thread/add";
	}
	// @RequestMapping(value = "/add2")
	// public String add2(Model model) {
	// BoardCategoria bc = new BoardCategoria();
	// List<Board> models = boardService.getBoardByBoardCategoria(bc);
	// model.addAttribute("boards", models);
	// return "/thread/add";
	// }

//	@RequestMapping(value = "/insert")
//	public String insert(Model model, @ModelAttribute Thread thread , Board board ,Thread thread) {
//		int result = threadService.createThread(board,user,thread){
//		if (result == 1) {
//			model.addAttribute("message", "新增成功");
//		} else {
//			model.addAttribute("message", "新增失敗");
//		}
//		return "/thread/add";
//	}
}
