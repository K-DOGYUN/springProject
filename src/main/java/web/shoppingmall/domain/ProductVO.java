package web.shoppingmall.domain;

import java.time.LocalDateTime;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductVO {
	private String p_num;
	private String p_name;
	private String p_stat;
	private int p_stock;
	private int p_price;
	private int deliv_fee;
	private String s_num;
	private String manufac_num;
	private int category_num;
	private LocalDateTime reg_date;
	private LocalDateTime up_date;
	
	private List<ImageDTO> imgList;
}
