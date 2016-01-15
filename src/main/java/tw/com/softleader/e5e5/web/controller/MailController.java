package tw.com.softleader.e5e5.web.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.com.softleader.e5e5.entity.LogMail;
import tw.com.softleader.e5e5.entity.Mail;
import tw.com.softleader.e5e5.service.LogMailService;
import tw.com.softleader.e5e5.service.MailService;

@Controller
@RequestMapping("/mail")
public class MailController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private MailService mailService;
	@Autowired
	private LogMailService logMailService;
	
	@RequestMapping("/list")
	public String maillist(){		
		return "/e715/mail/maillist";
	}
	
	@RequestMapping("/getmail")
	@ResponseBody
	public List<Mail> getmail(@RequestParam("id")int id){
		List<Mail> mails = mailService.getAllMailByReceiver(id);
		return mails;
	}
	@RequestMapping("/getdraft")
	@ResponseBody
	public List<LogMail> getdraft(@RequestParam("id")int senderId){
		List<LogMail> draft =logMailService.getAllDraftBySender(senderId);
		return draft;
	}
	
	
	@RequestMapping("/newmail")
	public String newMail(@RequestParam("senderId")int senderId,@RequestParam("receiverAccount")String receiverAccount,
			@RequestParam("title")String title,@RequestParam("article")String article,@RequestParam("saveAsLog")String saveAsLog){
		mailService.sendNewMail(senderId, receiverAccount, title, article, saveAsLog);
		log.error(saveAsLog);
		return "redirect:/mail/list";
	}
	@RequestMapping("/savedraft")
	public String saveDraft(@RequestParam("senderId")int senderId,@RequestParam("receiverAccount")String receiverAccount,
			@RequestParam("title")String title,@RequestParam("article")String article){
		logMailService.saveDraft(senderId, receiverAccount, title, article);
		return "redirect:/mail/list";
	}
	
}
