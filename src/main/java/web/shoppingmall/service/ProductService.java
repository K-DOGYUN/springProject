package web.shoppingmall.service;

import web.shoppingmall.domain.ProductVO;

public interface ProductService {
	public void pRegister(ProductVO productVO);
	public ProductVO pDisplay(String p_num);
}
