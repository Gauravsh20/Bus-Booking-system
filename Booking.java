package vijaypc.BusBooking;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="booking")
public class Booking {

	@Id
	@Column(name="booking_id")
	private String bookingId;
	
	@Column(name="schedule_id")
	private String scheduleId;
	
	@Column(name="user_id")
	private String userId;
	
	@Column(name="seat_no")
	private int seatNo;
	
	@Column(name="fare_amount")
	private float fareAmount;
	
	@Column(name="total_amount")
	private float totalAmount;
	
	@Column(name="dateofbooking")
	private Date dateofBooking;
	
	@Enumerated(EnumType.STRING)
	@Column(name="booking_status")
	private BookingStatus bookingStatus;

	public BookingStatus getBookingStatus() {
		return bookingStatus;
	}

	public void setBookingStatus(BookingStatus bookingStatus) {
		this.bookingStatus = bookingStatus;
	}

	public String getBookingId() {
		return bookingId;
	}

	public void setBookingId(String bookingId) {
		this.bookingId = bookingId;
		
	}

	public String getScheduleId() {
		return scheduleId;
	}

	public void setScheduleId(String scheduleId) {
		this.scheduleId = scheduleId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getSeatNo() {
		return seatNo;
	}

	public void setSeatNo(int seatNo) {
		this.seatNo = seatNo;
	}

	public float getFareAmount() {
		return fareAmount;
	}

	public void setFareAmount(float fareAmount) {
		this.fareAmount = fareAmount;
	}

	public float getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(float totalAmount) {
		this.totalAmount = totalAmount;
	}

	public Date getDateofBooking() {
		return dateofBooking;
	}

	public void setDateofBooking(Date dateofBooking) {
		this.dateofBooking = dateofBooking;
	}
	
	
}
