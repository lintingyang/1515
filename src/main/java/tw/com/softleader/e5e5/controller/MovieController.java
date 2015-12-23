package tw.com.softleader.e5e5.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.com.softleader.e5e5.entity.Movie;

@Controller
@RequestMapping("/movies")
public class MovieController {
	
	private Logger log = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value="/list")
	public String listPage() {
		return "/movie/movieList";
	}
	
	@RequestMapping(value="/add")
	public String addPage() {
		return "/movie/movieAdd";
	}
	
	@RequestMapping(value="/edit")
	public String editPage(Model model, @RequestParam Long id) {
		
		// service.findOne(id);
		Movie movie = new Movie();
		movie.setId(1L);
		movie.setName("飢餓遊戲");
		movie.setCategory("科幻片");
		
		
		model.addAttribute("entity", movie);
		
		return "/movie/movieEdit";
	}
	
	@ResponseBody
	@RequestMapping(value="/query")
	public List<Movie> query(@RequestBody Movie form) {
		
		log.debug("{}", form);
		
		List<Movie> movies = new ArrayList<Movie>();
		
		// 根據 form criteria 查詢
		Movie movie1 = new Movie();
		movie1.setId(1L);
		movie1.setName("飢餓遊戲");
		movie1.setCategory("科幻片");
		
		Movie movie2 = new Movie();
		movie2.setId(2L);
		movie2.setName("學舌鳥");
		movie2.setCategory("科幻片");
		
		movies.add(movie1);
		movies.add(movie2);
		
		
		return movies;
		
	}

}
