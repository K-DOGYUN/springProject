package web.shoppingmall.domain;

import java.util.Date;

import lombok.Data;

@Data
public class AddressDTO {
	private String addrNo;
	private String mainAddr;
	private String detailAddr;
	private int zipNo;
	private String memberId;
	private Date addrReg;
	private Date addrUpdate;
}
