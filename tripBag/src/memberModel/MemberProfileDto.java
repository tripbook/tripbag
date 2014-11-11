package memberModel;

public class MemberProfileDto {
	private int pic_num;
	private String id;
	private String pic_name;
	private String pic_path;
	private long pic_size;
	public int getPic_num() {
		return pic_num;
	}
	public void setPic_num(int pic_num) {
		this.pic_num = pic_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPic_name() {
		return pic_name;
	}
	public void setPic_name(String pic_name) {
		this.pic_name = pic_name;
	}
	public String getPic_path() {
		return pic_path;
	}
	public void setPic_path(String pic_path) {
		this.pic_path = pic_path;
	}
	public long getPic_size() {
		return pic_size;
	}
	public void setPic_size(long pic_size) {
		this.pic_size = pic_size;
	}
	
}
