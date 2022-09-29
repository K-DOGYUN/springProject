package web.shoppingmall.mapper;

import web.shoppingmall.domain.ProductVO;

public interface ProductMapper {
	public void productRegister(ProductVO productVO);
	public ProductVO productDisplay(String p_num);
}
