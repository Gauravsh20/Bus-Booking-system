package com.infinite.bus;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="bus_details")
public class Bus {
	
	@Id
	@Column(name="bus_id")
	private String busId;
	
	@Column(name="bus_no")
	private String busNo;
	
    @Column(name="user_id")
	private int userId;
	
	@Enumerated(EnumType.STRING)
	@Column(name="type_of_bus")
	private BusType busType;
	
	@Enumerated(EnumType.STRING)
	@Column(name="type_of_servies")
	private ServiesType serviesType;
	
	@Column(name="no_of_seat")
	private int noOfSeats;

	public String getBusId() {
		return busId;
	}

	public void setBusId(String busId) {
		this.busId = busId;
	}

	public String getBusNo() {
		return busNo;
	}

	public void setBusNo(String busNo) {
		this.busNo = busNo;
	}

	public BusType getBusType() {
		return busType;
	}

	public void setBusType(BusType busType) {
		this.busType = busType;
	}

	public ServiesType getServiesType() {
		return serviesType;
	}

	public void setServiesType(ServiesType serviesType) {
		this.serviesType = serviesType;
	}

	public int getNoOfSeats() {
		return noOfSeats;
	}

	public void setNoOfSeats(int noOfSeats) {
		this.noOfSeats = noOfSeats;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}
	
		
}
