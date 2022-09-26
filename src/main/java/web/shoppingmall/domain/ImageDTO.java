package web.shoppingmall.domain;

import lombok.Data;

@Data
public class ImageDTO {
	private String img_num;
	private String img_name;
	private String img_path;
	private String img_UUID;
	private String parent_num;
	private String parent_type;
}
