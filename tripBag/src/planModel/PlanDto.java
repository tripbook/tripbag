package planModel;

import java.util.Date;

public class PlanDto {

	private int plan_con_num; //계회글번호
	private String id;
	
	private Date trip_start_date;
	private Date trip_end_date;
	private String pub_scope; //공개범위
	private String memo;
	private String plan_x; // 계획글 x좌표
	private String plan_y; // 계획글 Y좌표
	public int getPlan_con_num() {
		return plan_con_num;
	}
	public void setPlan_con_num(int plan_con_num) {
		this.plan_con_num = plan_con_num;
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
	public String getPub_scope() {
		return pub_scope;
	}
	public void setPub_scope(String pub_scope) {
		this.pub_scope = pub_scope;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getPlan_x() {
		return plan_x;
	}
	public void setPlan_x(String plan_x) {
		this.plan_x = plan_x;
	}
	public String getPlan_y() {
		return plan_y;
	}
	public void setPlan_y(String plan_y) {
		this.plan_y = plan_y;
	}
	

}
