package web.shoppingmall.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
public class CategoryVO {
	private int category_number;
	private String large_category;
	private String medium_category;
	private String small_category;
	private String detail_category;
}
