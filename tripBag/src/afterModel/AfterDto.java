package afterModel;

import java.util.Date;

public class AfterDto {
	private int trip_after_num;
	private String id;
	private Date trip_start_date;
	private Date trip_end_date;
	private String trip_pub_scope;
	private String trip_con; //글내용
	private String trip_after_tit; //내용 후기 제목
	private String trip_x;
	private String trip_y;
	public int getTrip_after_num() {
		return trip_after_num;
	}
	public void setTrip_after_num(int trip_after_num) {
		this.trip_after_num = trip_after_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getTrip_start_date() {
		return trip_start_date;
	}
	public void setTrip_start_date(Date trip_start_date) {
		this.trip_start_date = trip_start_date;
	}
	public Date getTrip_end_date() {
		return trip_end_date;
	}
	public void setTrip_end_date(Date trip_end_date) {
		this.trip_end_date = trip_end_date;
	}
	public String getTrip_pub_scope() {
		return trip_pub_scope;
	}
	public void setTrip_pub_scope(String trip_pub_scope) {
		this.trip_pub_scope = trip_pub_scope;
	}
	public String getTrip_con() {
		return trip_con;
	}
	public void setTrip_con(String trip_con) {
		this.trip_con = trip_con;
	}
	public String getTrip_after_tit() {
		return trip_after_tit;
	}
	public void setTrip_after_tit(String trip_after_tit) {
		this.trip_after_tit = trip_after_tit;
	}
	public String getTrip_x() {
		return trip_x;
	}
	public void setTrip_x(String trip_x) {
		this.trip_x = trip_x;
	}
	public String getTrip_y() {
		return trip_y;
	}
	public void setTrip_y(String trip_y) {
		this.trip_y = trip_y;
	}
	
	
	
}
