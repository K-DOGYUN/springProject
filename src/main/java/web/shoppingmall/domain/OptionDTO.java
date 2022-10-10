package web.shoppingmall.domain;

import java.util.Date;

import lombok.Data;

@Data
public class OptionDTO {
	private String optionNo;
	private String optionName;
	private String optionDetail;
	private int optionStock;
	private int optionPrice;
	private String productNo;
	private Date optionReg;
	private Date optionUpdate;
}
