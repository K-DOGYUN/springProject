package web.shoppingmall.domain;

import lombok.Data;

@Data
public class ImageDTO {
	private String imageName;
	private String imagePath;
	private String imageUUID;
	private String imageParent;
	private String ParentType;
}
