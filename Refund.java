package com.infinite.bus;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="refund")
public class Refund {
	
	@Id
	@Column(name="refunt_id")
	private int refundId;
	
	@Column(name="payment_id")
	private String paymentId;
	
	@Column(name="user_id")
	private String userId;
	
	@Column(name="wallet_id")
	private String walletId;
	
	@Column(name="amount")
	private float amount;
	
	@Column(name="refund_date")
	private Date refundDate;
	
	@Enumerated(EnumType.STRING)
	@Column(name="refund_status")
	private RefundStatus refundStatus;

	public int getRefundId() {
		return refundId;
	}

	public void setRefundId(int refundId) {
		this.refundId = refundId;
	}

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

	public float getAmount() {
		return amount;
	}

	public void setAmount(float amount) {
		this.amount = amount;
	}

	public Date getRefundDate() {
		return refundDate;
	}

	public void setRefundDate(Date refundDate) {
		this.refundDate = refundDate;
	}

	public RefundStatus getRefundStatus() {
		return refundStatus;
	}

	public void setRefundStatus(RefundStatus refundStatus) {
		this.refundStatus = refundStatus;
	}
	
	

}
