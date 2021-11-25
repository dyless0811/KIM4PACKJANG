package semi.vo;

public class PopularItemVo {
	private int rank;
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	private String itemName;
	private int count;
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public PopularItemVo() {
		super();
		// TODO 자동 생성된 생성자 스텁
	}
	
}
