package web.shoppingmall.mapper;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import web.shoppingmall.domain.ImageDTO;
import web.shoppingmall.domain.OptionDTO;
import web.shoppingmall.domain.ProductVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"
})
public class ProductMapperTest {
	@Autowired
 	private ProductMapper pMapper;
	@Autowired
	private OptionMapper oMapper;
	@Autowired
	private ImageMapper iMapper;
	
	@Test
	public void testMapper() {
		ProductVO productVO = new ProductVO();
		OptionDTO optionDTO = new OptionDTO();
		ImageDTO imageDTO = new ImageDTO();
		
		productVO.setProductName("상품8");
		productVO.setManufacName("제조사");
		productVO.setProductStat(1);
		productVO.setProductStock(100);
		productVO.setProductPrice(100);
		productVO.setDelivFee(100);
		productVO.setSellerNo("seller001@naver.com");
		productVO.setCategoryNo(1880102);
		
		optionDTO.setOptionName("옵션");
		optionDTO.setOptionDetail("옵션상세");
		optionDTO.setOptionStock(100);
		optionDTO.setOptionPrice(100);
		
		imageDTO.setImgName("이미지");
		imageDTO.setImgPath("이미지");
		imageDTO.setImgUuid("이미지");
		
		List<OptionDTO> oList = new ArrayList<OptionDTO>();
		oList.add(optionDTO);
		
		List<ImageDTO> iList = new ArrayList<ImageDTO>();
		iList.add(imageDTO);
		
		productVO.setOptionList(oList);
		productVO.setImgList(iList);
		
//		pMapper.productReg(productVO);
//		
//		productVO.getOptionList().forEach(optn -> {
//			optn.setProductNo(productVO.getProductNo());
//			oMapper.optionReg(optn);
//		});
//		
//		productVO.getImgList().forEach(img -> {
//			img.setParentNo(productVO.getProductNo());
//			iMapper.imageRegister(img);
//		});
		pMapper.productInform("p202210110021");

	}
}
