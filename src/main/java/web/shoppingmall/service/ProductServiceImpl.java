package web.shoppingmall.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import web.shoppingmall.domain.ProductVO;
import web.shoppingmall.mapper.ImageMapper;
import web.shoppingmall.mapper.OptionMapper;
import web.shoppingmall.mapper.ProductMapper;

@Service
public class ProductServiceImpl implements ProductService {
	@Autowired
	private ProductMapper pMapper;
	@Autowired
	private OptionMapper oMapper;
	@Autowired
	private ImageMapper iMapper;

	@Override
	public void productReg(ProductVO productVO) {
		productVO.setProductStat(1);
		System.out.println("productReg : " + productVO);
		pMapper.productReg(productVO);
		
		if(productVO.getOptionList() != null) {	
			productVO.getOptionList().forEach(optn -> {
				if(optn.getOptionName() != null) {
					optn.setProductNo(productVO.getProductNo());
					System.out.println("optionReg : " + optn);
					oMapper.optionReg(optn);
				}
			});
		}
		if(productVO.getImgList() != null) {
			productVO.getImgList().forEach(img -> {
				if(img.getImgName() != null	) {
					img.setParentNo(productVO.getProductNo());
					System.out.println("imageReg : " + img);
					iMapper.imageRegister(img);
				}
			});
		}
	}

	@Override
	public ProductVO productInform(String productNo) {
		System.out.println("productInform : " + productNo);
		ProductVO vo = pMapper.productInform(productNo);
		vo.getImgList().forEach(img ->{
			img.setImgPath(img.getImgPath().replace("\\", "/"));
			System.out.println(img.getImgPath());
		});
		return vo;
	}

}
