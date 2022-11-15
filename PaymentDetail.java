package vijaypc.BusBooking;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="payment_detail")
public class PaymentDetail {

	@Id
	@Column(name="payment_id")
	private String paymentId;
	
	@Column(name="user_id")
	private String userId;
	
	@Column(name="wallet_id")
	private String walletId;
	
	@Column(name="booking_id")
	private String bookingId;
	
	@Column(name="amount")
	private float amount;
	
	@Column(name="paymate_date")
	private Date paymentDate;
	
	@Enumerated(EnumType.STRING)
	@Column(name="payment_status")
	private PaymentStatus paymentStatus;


	public String getPaymentId() {
		return paymentId;
	}

	public void setPaymentId(String paymentId) {
		this.paymentId = paymentId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}



	public String getWalletId() {
		return walletId;
	}

	public void setWalletId(String walletId) {
		this.walletId = walletId;
	}

	public String getBookingId() {
		return bookingId;
	}

	public void setBookingId(String bookingId) {
		this.bookingId = bookingId;
	}

	public float getAmount() {
		return amount;
	}

	public void setAmount(float amount) {
		this.amount = amount;
	}

	public Date getPaymentDate() {
		return paymentDate;
	}

	public void setPaymentDate(Date paymentDate) {
		this.paymentDate = paymentDate;
	}

	public PaymentStatus getPaymentStatus() {
		return paymentStatus;
	}

	public void setPaymentStatus(PaymentStatus paymentStatus) {
		this.paymentStatus = paymentStatus;
	}
	
	
}


