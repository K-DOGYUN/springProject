package web.shoppingmall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;
import web.shoppingmall.domain.CategoryVO;
import web.shoppingmall.mapper.IncludesMapper;

@Service
public class IncludesServiceImpl implements IncludesService{
	@Setter(onMethod_ = @Autowired)
	private IncludesMapper mapper;


	@Override
	public List<CategoryVO> getCategory() {
		System.out.println("getCategory");
		return mapper.readCategory();
	}
	
}
