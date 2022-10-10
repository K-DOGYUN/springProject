package web.shoppingmall.mapper;

import web.shoppingmall.domain.ProductVO;

public interface ProductMapper {
	public void productReg(ProductVO productVO);
	public ProductVO productInform(String productNo);
}
