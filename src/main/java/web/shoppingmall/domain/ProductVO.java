package web.shoppingmall.domain;

import java.util.Date;
import java.util.List;
import lombok.Data;


@Data
public class ProductVO {
	private String productNo;
	private String productName;
	private String manufacName;
	private int productStat;
	private int productStock;
	private int productPrice;
	private int delivFee;

	private String sellerNo;
	private int categoryNo;

	private Date productReg;
	private Date productUpdate;
	
	private List<ImageDTO> imgList;
	private List<OptionDTO> optionList;
}
