
package tw.com.softleader.e5e5.web.controller;

import java.time.LocalDateTime;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.com.softleader.e5e5.entity.QuestionAndAnswer;
import tw.com.softleader.e5e5.entity.User;
import tw.com.softleader.e5e5.entity.enums.TrueFalse;
import tw.com.softleader.e5e5.service.ProductService;
import tw.com.softleader.e5e5.service.QuestionAndAnswerService;

@Controller
@RequestMapping(value = "/qanda")
@Service
public class QandAController {
	Logger log = Logger.getLogger(this.getClass());
	@Autowired
	public QuestionAndAnswerService qandaservice;
	
	@Autowired
	public ProductService productservice;
	
	@RequestMapping(value = "/getqanda")
	@ResponseBody
	public List<QuestionAndAnswer> select(@RequestParam("id") Integer id, Model model){
		List<QuestionAndAnswer> qandas = qandaservice.findByProductId(id);
		return qandas;
	}

	//inner class for postquestion
	public static class Question{
		private int productid;
		private String question;
		public int getProductid() {
			return productid;
		}
		public void setProductid(int productid) {
			this.productid = productid;
		}
		public String getQuestion() {
			return question;
		}
		public void setQuestion(String question) {
			this.question = question;
		}
	}//end of inner class
	
	@RequestMapping(value= "/question", method = RequestMethod.POST)
	public String postquestion(@RequestBody Question question, HttpSession session, Model model){
		QuestionAndAnswer newquestion = new QuestionAndAnswer();
		//取得提問者的id
		User user = (User)session.getAttribute("user");
		newquestion.setProduct(productservice.getOneById(question.getProductid()));
		newquestion.setQuestion(question.getQuestion());
		newquestion.setQuestionerId(user);
		newquestion.setQuestionTime(LocalDateTime.now());
		newquestion.setIsPublic(TrueFalse.TRUE);
		qandaservice.insert(newquestion);
		return "/e715/product/product";
	}
	
}
