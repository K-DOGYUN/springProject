package web.shoppingmall.service;

import java.util.List;

import web.shoppingmall.domain.ImageDTO;

public interface ImageService {
	public void imageRegister(ImageDTO imageDTO);
	public List<ImageDTO> imageDisplay(String parent_num);
}
