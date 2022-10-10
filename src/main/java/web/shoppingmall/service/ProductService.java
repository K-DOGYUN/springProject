package web.shoppingmall.service;

import web.shoppingmall.domain.ProductVO;

public interface ProductService {
	public void productReg(ProductVO productVO);
	public ProductVO productInform(String productNo);
}
