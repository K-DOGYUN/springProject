package web.shoppingmall.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CustomerVO {
	private String customerId;
	private String customerPw;
	private String customerName;
	private String customerPhone;
	private String customerState;
	private Date regDate;
	private Date updateDate;
	private String auth;
}
