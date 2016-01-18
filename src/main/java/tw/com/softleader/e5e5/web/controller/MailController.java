package tw.com.softleader.e5e5.web.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import tw.com.softleader.e5e5.entity.LogMail;
import tw.com.softleader.e5e5.entity.Mail;
import tw.com.softleader.e5e5.entity.enums.TrueFalse;
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
	
	@RequestMapping("/deletemail")
	@ResponseStatus(value = HttpStatus.OK)
	public void deletemail(@RequestParam("deletemail")String deletemail){
		log.error(deletemail);

		if(deletemail.substring(0, 1).equals("m")){
			int id = Integer.parseInt(deletemail.substring(4));
			mailService.deleteMail(id);
			
		}if(deletemail.substring(0, 1).equals("l")){
			int id = Integer.parseInt(deletemail.substring(4));
			logMailService.deleteLogMail(id);
		}
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
	@RequestMapping("/getbackup")
	@ResponseBody
	public List<LogMail> getbackup(@RequestParam("id")int senderId){
		List<LogMail> backup =logMailService.getAllBackBySender(senderId);
		return backup;
	}
	
	@RequestMapping("/important")
	@ResponseStatus(value = HttpStatus.OK)
	public void updateImportant(@RequestParam("id")int id, @RequestParam("isImportant")String isImportant){
		mailService.updateIsImportant(id, isImportant);
	}
	
	@RequestMapping("/newmail")
	public String newMail(@RequestParam("senderId")int senderId,@RequestParam("receiverAccount")String receiverAccount,
			@RequestParam("title")String title,@RequestParam("article")String article,@RequestParam("saveAsLog")String saveAsLog,
			@RequestParam("logmailid")int logMailId){
		mailService.sendNewMail(senderId, receiverAccount, title, article, saveAsLog,logMailId);
		
		
		return "redirect:/mail/list";
	}
	@RequestMapping("/savedraft")
	public String saveDraft(@RequestParam("senderId")int senderId,@RequestParam("receiverAccount")String receiverAccount,
			@RequestParam("title")String title,@RequestParam("article")String article){
		logMailService.saveDraft(senderId, receiverAccount, title, article);
		return "redirect:/mail/list";
	}
	
	@RequestMapping("/updatedraft")
	public String updatedraft(@RequestParam("senderId")int senderId,@RequestParam("receiverAccount")String receiverAccount,
			@RequestParam("title")String title,@RequestParam("article")String article,
			@RequestParam("logmailid")int logMailId){
		logMailService.updatedraft(senderId, receiverAccount, title, article, logMailId);
		return "redirect:/mail/list";
	}
	
	
}
