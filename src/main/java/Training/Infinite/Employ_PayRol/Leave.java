package Training.Infinite.Employ_PayRol;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="leave_tabel")
public class Leave {
	@Id
	@Column(name="leaveid")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int leaveId;
	
	@Column(name="Empno")
	private int empno;
	
	@Column(name="LeaveStartDate")
	private Date startDate;
	
	@Column(name="LeaveEndDate")
	private Date endDate;
	
	@Column(name="NoOfDays")
	private int noOfDays;
	
	@Column(name="LeaveReason")
	private String leaveReason;
	
	@Column(name="lossOfPay")
	private double lossOfPay;
	

	public int getLeaveId() {
		return leaveId;
	}

	public void setLeaveId(int leaveId) {
		this.leaveId = leaveId;
	}

	public int getEmpno() {
		return empno;
	}

	public void setEmpno(int empno) {
		this.empno = empno;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public int getNoOfDays() {
		return noOfDays;
	}

	public void setNoOfDays(int noOfDays) {
		this.noOfDays = noOfDays;
	}

	public String getLeaveReason() {
		return leaveReason;
	}

	public void setLeaveReason(String leaveReason) {
		this.leaveReason = leaveReason;
	}

	public double getLossOfPay() {
		return lossOfPay;
	}

	public void setLossOfPay(double lossOfPay) {
		this.lossOfPay = lossOfPay;
	}
}
