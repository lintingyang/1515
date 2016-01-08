package tw.com.softleader.e5e5.service;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import tw.com.softleader.e5e5.common.dao.OurDao;
import tw.com.softleader.e5e5.common.model.Message;
import tw.com.softleader.e5e5.common.service.OurService;
import tw.com.softleader.e5e5.dao.ProductDao;
import tw.com.softleader.e5e5.dao.ProductPictureDao;
import tw.com.softleader.e5e5.entity.Product;
import tw.com.softleader.e5e5.entity.ProductPicture;

@Service
public class ProductPictureService extends OurService<ProductPicture>{
	@Autowired
	private ProductPictureDao productPictureDao;

	@Autowired
	private ProductDao productDao;
	
	@Transactional
	public List<ProductPicture> getProductPictures(Product product) {
		List<ProductPicture> productPictures = productPictureDao.findByProduct(product);
		return productPictures;
	}
	
	//傳圖
	@Transactional
	public String upLoadImage(int id, ServletContext servletContext,MultipartFile file) {
		BufferedImage src = null;
		int counter=0;
		String path = "/resources/productPictures/";
		
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
			finalP=finalP.substring(cut+6);
			return finalP;
		} catch (IOException e) {
			e.printStackTrace();			
		}
		return null;
	}	
	
	//存圖
	@Transactional
	public int insertImage(Integer productId, String picture){
		ProductPicture productPicture = new ProductPicture();
		productPicture.setProduct(productDao.findOne(productId));
		productPicture.setPicture(picture);
		productPictureDao.save(productPicture);
		return 1;
	}
	
	
	@Override
	public OurDao<ProductPicture> getDao() {
		// TODO Auto-generated method stub
		return productPictureDao;
	}

	@Override
	protected List<Message> validateInsert(ProductPicture entity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	protected List<Message> validateUpdate(ProductPicture entity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	protected List<Message> validateDelete(int id) {
		// TODO Auto-generated method stub
		return null;
	}
	

	
}

	
