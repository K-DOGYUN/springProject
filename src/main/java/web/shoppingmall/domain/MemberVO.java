package web.shoppingmall.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class MemberVO {
	private String memberId;
	private String memberPw;
	private String memberName;
	private String memberPhone;
	private String auth;
	private int memberState;
	private int businessNo;
	private int employeeNo;
	private Date memberReg;
	private Date memberUpdate;
	
	private List<AddressDTO> addrList;
}
