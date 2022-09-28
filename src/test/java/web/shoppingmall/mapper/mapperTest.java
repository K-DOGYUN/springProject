package web.shoppingmall.mapper;

import java.time.LocalDateTime;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import web.shoppingmall.domain.CategoryVO;
import web.shoppingmall.domain.ImageDTO;
import web.shoppingmall.domain.ProductVO;
import web.shoppingmall.service.IncludesService;

@RunWith(SpringRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class mapperTest {
	@Autowired
	private IncludesMapper mapper;
	@Autowired
 	private ProductMapper pMapper;
	@Autowired
 	private ImageMapper iMapper;
	
	@Test
	public void testMapper() {
		CategoryVO vo = new CategoryVO();
		ProductVO productVO = new ProductVO();
		productVO.setCategory_num(2491);
		productVO.setDeliv_fee(2000);
		productVO.setManufac_num("m333");
		productVO.setP_name("book");
		productVO.setP_price(12000);
		productVO.setP_stat("일반");
		productVO.setP_stock(300);
		productVO.setS_num("s300");
		productVO.setUp_date(LocalDateTime.now());
		productVO.setReg_date(LocalDateTime.now());
		
		ImageDTO imageDTO = new ImageDTO();
		imageDTO.setImg_name("imageName");
		imageDTO.setImg_path("imagePath");
		imageDTO.setImg_UUID("imageUUID");
		imageDTO.setParent_num("imageParent");
		imageDTO.setParent_type("p");
				
//		mapper.readCategory().forEach(i->System.out.println(i));
//		mapper.readLargeCategory().forEach(i->System.out.println(i));
//		mapper.readMediumCategory(1).forEach(i->System.out.println(i));
//		mapper.readSmallCategory(32).forEach(i->System.out.println(i));
//		mapper.readDetailCategory(228).forEach(i->System.out.println(i));
//		System.out.println(productVO);
//		pMapper.productRegister(productVO);
//		System.out.println(productVO.getP_num());
//		iMapper.imageRegister(imageDTO);
//		pMapper.productDisplay("p202209260021");
		iMapper.imageDisplay("p202209260021").forEach(i->System.out.println(i.getImg_path().replace("\\", "/")));
	}
}
