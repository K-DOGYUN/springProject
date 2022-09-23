package web.shoppingmall.service;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import web.shoppingmall.domain.ProductVO;
import web.shoppingmall.mapper.ProductMapper;

@Service
@AllArgsConstructor
public class ProductServiceImpl implements ProductService{
	private ProductMapper mapper;

	@Override
	public void pRegister(ProductVO productVO) {
		System.out.println("p_register");
		System.out.println(productVO);
		mapper.productRegister(productVO);		
	}
	
	
}
