package com.pizza.entity;

import java.sql.Date;

public class SeatStatus {
private long statusId;
private Date dateOfBooking;
private int availableSeats;
public SeatStatus() {
	super();
	// TODO Auto-generated constructor stub
}
public SeatStatus(long statusId, Date dateOfBooking, int availableSeats) {
	super();
	this.statusId = statusId;
	this.dateOfBooking = dateOfBooking;
	this.availableSeats = availableSeats;
}
public long getStatusId() {
	return statusId;
}
public void setStatusId(long statusId) {
	this.statusId = statusId;
}
public Date getDateOfBooking() {
	return dateOfBooking;
}
public void setDateOfBooking(Date dateOfBooking) {
	this.dateOfBooking = dateOfBooking;
}
public int getAvailableSeats() {
	return availableSeats;
}
public void setAvailableSeats(int availableSeats) {
	this.availableSeats = availableSeats;
}
@Override
public String toString() {
	return "SeatStatus [statusId=" + statusId + ", dateOfBooking=" + dateOfBooking + ", availableSeats="
			+ availableSeats + "]";
}

}
