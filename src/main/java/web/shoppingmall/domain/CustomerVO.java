package web.shoppingmall.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class CustomerVO {
	private String customerId;
	private String customerPw;
	private String customerName;
	private String customerPhone;
	private int customerState;
	private Date regDate;
	private Date updateDate;
	private String auth;
	private int businessNo;
	
	private List<AddressDTO> addrList;
}
