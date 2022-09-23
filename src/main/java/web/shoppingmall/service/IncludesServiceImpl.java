package web.shoppingmall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import web.shoppingmall.domain.CategoryVO;
import web.shoppingmall.mapper.IncludesMapper;

@Service
@Log4j
public class IncludesServiceImpl implements IncludesService{
	@Setter(onMethod_ = @Autowired)
	private IncludesMapper mapper;

	@Override
	public List<CategoryVO> getLargeCategory() {
		System.out.println("getLargeCategory/serviceImpl");
		return mapper.readLargeCategory();
	}

	@Override
	public List<CategoryVO> getMediumCategory(int parentNumber) {
		System.out.println("getMediumCategory/serviceImpl"+parentNumber);
		return mapper.readMediumCategory(parentNumber);
	}

	@Override
	public List<CategoryVO> getSmallCategory(int parentNumber) {
		System.out.println("getSmallCategory/serviceImpl"+parentNumber);
		return mapper.readSmallCategory(parentNumber);
	}

	@Override
	public List<CategoryVO> getDetailCategory(int parentNumber) {
		System.out.println("getDetailCategory/serviceImpl"+parentNumber);
		return mapper.readDetailCategory(parentNumber);
	}

	@Override
	public List<CategoryVO> getCategory() {
		System.out.println("getCategory");
		return mapper.readCategory();
	}
	
}
