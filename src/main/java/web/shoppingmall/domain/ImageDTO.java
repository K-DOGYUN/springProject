package web.shoppingmall.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ImageDTO {
	private String imgNo;
	private String imgName;
	private String imgPath;
	private String imgUuid;
	private String parentNo;
	private Date imgReg;
	private Date imgUpdate;
}
