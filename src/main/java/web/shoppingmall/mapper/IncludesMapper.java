package web.shoppingmall.mapper;

import java.util.List;

import web.shoppingmall.domain.CategoryVO;

public interface IncludesMapper {
	public List<CategoryVO> readLargeCategory();
	public List<CategoryVO> readMediumCategory(int parentNumber);
	public List<CategoryVO> readSmallCategory(int parentNumber);
	public List<CategoryVO> readDetailCategory(int parentNumber);
	public List<CategoryVO> readCategory();
}
