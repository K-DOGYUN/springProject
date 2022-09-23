package web.shoppingmall.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CategoryVO {
	private int category_number;
	private String category_name;
	private int category_level;
	private String parent_category;
	private int parent_number;
}
