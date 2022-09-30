package web.shoppingmall.domain;

import java.util.Date;

import lombok.Data;

@Data
public class AddressDTO {
	private String addrNo;
	private String mainAddr;
	private String detailAddr;
	private int zipNo;
	private String customerId;
	private Date regDate;
	private Date updateDate;
}
