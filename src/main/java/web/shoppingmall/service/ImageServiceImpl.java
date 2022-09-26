package web.shoppingmall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.shoppingmall.domain.ImageDTO;
import web.shoppingmall.mapper.ImageMapper;

@Service
public class ImageServiceImpl implements ImageService{
	@Autowired
	private ImageMapper mapper;
	
	@Override
	public void imageRegister(ImageDTO imageDTO) {
		System.out.println(imageDTO);
		mapper.imageRegister(imageDTO);
	}

	@Override
	public List<ImageDTO> imageDisplay(String parent_num) {
		return mapper.imageDisplay(parent_num);
	}
	
}
