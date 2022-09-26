package web.shoppingmall.mapper;

import java.util.List;

import web.shoppingmall.domain.ImageDTO;

public interface ImageMapper {
	public void imageRegister(ImageDTO imageDTO);
	public List<ImageDTO> imageDisplay(String parent_num);
}
