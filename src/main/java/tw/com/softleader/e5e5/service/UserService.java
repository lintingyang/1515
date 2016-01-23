package tw.com.softleader.e5e5.service;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Properties;

import javax.imageio.ImageIO;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import tw.com.softleader.e5e5.common.dao.OurDao;
import tw.com.softleader.e5e5.common.service.OurService;
import tw.com.softleader.e5e5.dao.UserDao;
import tw.com.softleader.e5e5.entity.User;
import tw.com.softleader.e5e5.entity.enums.Sex;
import tw.com.softleader.e5e5.entity.enums.TrueFalse;

@Service
public class UserService extends OurService<User> {

	@Autowired
	private UserDao userDao;

	@Transactional
	public User findByAccount(String account) {
		User user = userDao.findByAccount(account);
		return user;
	}
	
	@Transactional
	public User login(String account,String password){
		User user = userDao.findByAccount(account);
		if(user == null){
			log.error("user為null , 請確定帳號是否正確");
		}else if(user != null){
			if(user.getPassword().equals(password)){
//				log.error("帳號正確，user = "+user.getAccount());
				return user;
			}
		}
		return null;
	}

	@Transactional
	public List<User> findAll() {
		List<User> allUser = userDao.findAll();
		return allUser;
	}
	
	
	
	public boolean findBySchoolEmail(String schoolEmail){
		boolean result = false;
		User user =userDao.findBySchoolEmail(schoolEmail);
		//確定學校信箱是否有申請過
		if(user!=null){
			result = true;
		}
		return result;
	}
	
	public User loginBySchoolEmail(String schoolEmail){
		User user =userDao.findBySchoolEmail(schoolEmail);
		return user;
	}
	

	//新增school-email
	@Transactional
	public int sendVerificationCode(String schoolEmail){
		//確認學校信箱有無進資料庫
		User user =  userDao.findBySchoolEmail(schoolEmail);
		if(user==null){
			user = new User();
		}
			user.setSchoolEmail(schoolEmail);
		//發送驗證碼
		String host = "smtp.gmail.com";  
        int port = 587;  
        //本網站專用的電子信箱
        final String username = "e715number01@gmail.com";  
        final String password = "EEIT82DB";  
        final Integer newVerificationCode = (int)(Math.random()*9999);
        Properties props = new Properties();  
        props.put("mail.smtp.host", host);  
        props.put("mail.smtp.auth", "true");  
        props.put("mail.smtp.starttls.enable", "true");  
        props.put("mail.smtp.port", port);  
          
        Session session = Session.getInstance(props,new Authenticator(){  
              protected PasswordAuthentication getPasswordAuthentication() {  
                  return new PasswordAuthentication(username, password);  
              }} );  
           
        try {  
  
        Message message = new MimeMessage(session);  
        message.setFrom(new InternetAddress("e715number01@gmail.com"));  
        message.setRecipients(Message.RecipientType.TO,   
                        InternetAddress.parse(schoolEmail));  
        message.setSubject("E715學校信箱確認信(請勿回信)");  
        message.setText("親愛的E715用戶您好，\r\n感謝您的註冊，為了您的權益，我們必須確認您的身分，\r\n"
        		+ "以下為您的驗證碼 :"+newVerificationCode+"\r\n請將此填入驗證碼欄位中並按下送出，便可執行下個步驟，\r\n"
        				+ "再次感謝您的使用。\r\n\r\nE715製作團隊敬上");  
        
        
  
        Transport transport = session.getTransport("smtp");  
        transport.connect(host, port, username, password);  
  
        Transport.send(message);  
  
        System.out.println("Done");  
  
        } catch (MessagingException e) {  
            throw new RuntimeException(e);  
        }
		user.setVerificationCode(newVerificationCode);
		userDao.save(user);
		if (userDao.findBySchoolEmail(schoolEmail)!=null){
			return 1;
		}else{
		return 0;
		}
		}
		
	
	@Transactional
	public boolean checkVerificationCode(String schoolEmail ,Integer verificationCode){
		boolean result = false;
		User userCheck = userDao.findBySchoolEmail(schoolEmail);
		if(userCheck!=null){
		Integer check =  userCheck.getVerificationCode();
		boolean temp = (check.equals(verificationCode));
			if(temp){
				result = true;
			}
		}
		return result;
	}
	
	
	
	
	
//	@Transactional
//	public String[] findRangeScore(Integer score){
//		
//		List<User> temp = userDao.findByGameScoreGreaterThanEqualOrderByGameScoreDesc(score);
//		if(temp!=null){
//		String[] result = null;
//		int i =0;
//		for(User user : temp){
//			result[i] = user.getAccount();
//			i++;
//		}	
//		return result;}
//		else{
//			return null;
//		}
//	}

	@Transactional
	public int insert(String password, String name, String nickname, String account, Integer age, Sex sex,
			LocalDateTime birthday, String address, String phone, String cellphone, String email, String picture,
			String schoolEmail, Integer onlineDatetime, String schoolName, TrueFalse emailCheck) {
		TrueFalse temp1 = TrueFalse.TRUE;
		if (userDao.findBySchoolEmail(schoolEmail) == null) {
			if (temp1.equals(emailCheck)) {
				if (account != null && password != null && account.length() >= 5 && userDao.findByAccount(account) == null
						&& password.length() >= 8 && (cellphone != null || phone != null)) {
					User user = new User();
					user.setName(name);
					user.setAccount(account);
					user.setPassword(password);
					user.setNickname(nickname);
					user.setAge(age);
					user.setSex(sex);
					user.setBirthday(birthday);
					user.setAddress(address);
					user.setPhone(phone);
					user.setCellphone(cellphone);
					user.setEmail(email);
					user.setPicture(picture);
					user.setSchoolEmail(schoolEmail);
					user.setOnlineDatetime(onlineDatetime);
					user.setSchoolName(schoolName);
					user.setEmailCheck(emailCheck);
					user.setEcoin(50);
					user.setIsolated(TrueFalse.FALSE);
					userDao.save(user);
					return 1;
				}
			}
		}

		return 0;
	}

	@Transactional
	public int drewScores(String account, Integer ecoin) {
		User user = userDao.findByAccount(account);
		if (user != null) {
			user.setEcoin(ecoin);
			return 1;
		}
		return 0;

	}

	@Transactional
	public int updataIsolated(String account, TrueFalse isolated) {
		User temp = userDao.findByAccount(account);
		if (temp != null) {
			User temp2 = new User();
			temp2.setId(temp.getId());
			temp2.setAccount(temp.getAccount());
			temp2.setAddress(temp.getAddress());
			temp2.setAge(temp.getAge());
			temp2.setBirthday(temp.getBirthday());
			temp2.setCellphone(temp.getCellphone());
			temp2.setEmail(temp.getEmail());
			// temp2.setEmailCheck(temp.getEmailCheck());
			temp2.setFocusItemList(temp.getFocusItemList());
			temp2.setEcoin(temp.getEcoin());
			temp2.setName(temp.getName());
			temp2.setNickname(temp.getNickname());
			temp2.setOnlineDatetime(temp.getOnlineDatetime());
			temp2.setPassword(temp.getPassword());
			temp2.setPhone(temp.getPhone());
			temp2.setPicture(temp.getPicture());
			temp2.setSchoolEmail(temp.getSchoolEmail());
			temp2.setSchoolName(temp.getSchoolName());
			// temp2.setSex(temp.getSex());
			// temp2.setIsolated(isolated);
			userDao.save(temp2);
			return 1;
		}
		return 0;
	}

	@Transactional
	public int updataPwd(String account, String oldPassWord, String newPasswWrd) {
		User user = userDao.findByAccount(account);
		if (user != null) {
			user.setPassword(newPasswWrd);
			userDao.save(user);
			return 1;
		}
		return 0;
	}
	@Transactional
	public String upLoadImage(int id, ServletContext servletContext,MultipartFile file) {
		BufferedImage src = null;
		int counter=0;
		String path = "/resources/userimgs/";
		path = servletContext.getRealPath(path);
		File destination = null;
		try {
			src = ImageIO.read(new ByteArrayInputStream(file.getBytes()));
			if (!(new File(path)).exists()) {
				(new File(path)).mkdir();
			}

			destination = new File(path + String.valueOf(id)+"_"+file.getOriginalFilename());
			while(destination.exists()){
				counter++;
				destination = new File(path+ String.valueOf(id)+"_"+counter+"_"+file.getOriginalFilename());
			}
			ImageIO.write(src, "png", destination);
			String finalP= destination.getAbsolutePath().replace('\\', '/');
			int cut=finalP.indexOf("webapp");
			finalP=finalP.substring(cut+7);
			return finalP;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@Transactional
	public boolean deleteImage(int id, ServletContext servletContext) {
		User user = userDao.findById(id);
		String userPathDB = user.getPicture();
		int cut=userPathDB.indexOf("E715");
		log.error("cut" +cut);
		String userPath = userPathDB.substring(cut+4);
		log.error("userPath " + userPath);
		if(userPath!=null){
		String path = servletContext.getRealPath(userPath).replace('/' , '\\');
		log.error("path " + path);
		File destination = null;
		destination = new File(path);
		
		try {
			destination.delete();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		}else{
			return false;
		}
	}
	
	
	
	@Transactional
	public int updataInfo(User user) {
		User temp = userDao.findByAccount(user.getAccount());
		if (temp != null) {
			userDao.save(user);
			return 1;
		}
		return 0;
	}
	
	@Transactional
	public int updateEmail(String account, String schoolEmail) {
		User temp = userDao.findByAccount(account);
		if (temp != null) {
			User temp2 = new User();
			temp2.setAccount(temp.getAccount());
			temp2.setId(temp.getId());
			temp2.setSchoolEmail(schoolEmail);
			userDao.save(temp2);
			return 1;
		}
		return 0;
	}
	
	//後台更新狀態isolated
	@Transactional
	public User updateIsolated(Integer id, TrueFalse updateResult) {
		User user = userDao.findOne(id);
		user.setIsolated(updateResult);
		user = userDao.save(user);
		return user;
	}
	
	
	@Override
	public OurDao<User> getDao() {
		// TODO Auto-generated method stub
		return userDao;
	}

	@Override
	protected List<tw.com.softleader.e5e5.common.model.Message> validateInsert(User entity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	protected List<tw.com.softleader.e5e5.common.model.Message> validateUpdate(User entity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	protected List<tw.com.softleader.e5e5.common.model.Message> validateDelete(int id) {
		// TODO Auto-generated method stub
		return null;
	}



}
