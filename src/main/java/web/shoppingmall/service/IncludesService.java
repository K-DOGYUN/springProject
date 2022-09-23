package web.shoppingmall.service;

import java.util.List;

import org.springframework.stereotype.Service;

import web.shoppingmall.domain.CategoryVO;

public interface IncludesService {
	public List<CategoryVO> getLargeCategory();
	public List<CategoryVO> getMediumCategory(int parentNumber);
	public List<CategoryVO> getSmallCategory(int parentNumber);
	public List<CategoryVO> getDetailCategory(int parentNumber);
	public List<CategoryVO> getCategory();
}
