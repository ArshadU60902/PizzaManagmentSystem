package com.pizza.entity;

public class AlPizza {
	private  long AlPizzaId;
	private int totalSeats;
	private int availableSeats;
	public AlPizza() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AlPizza(long alPizzaId, int totalSeats, int availableSeats) {
		super();
		AlPizzaId = alPizzaId;
		this.totalSeats = totalSeats;
		this.availableSeats = availableSeats;
	}
	public long getAlPizzaId() {
		return AlPizzaId;
	}
	public void setAlPizzaId(long alPizzaId) {
		AlPizzaId = alPizzaId;
	}
	public int getTotalSeats() {
		return totalSeats;
	}
	public void setTotalSeats(int totalSeats) {
		this.totalSeats = totalSeats;
	}
	public int getAvailableSeats() {
		return availableSeats;
	}
	public void setAvailableSeats(int availableSeats) {
		this.availableSeats = availableSeats;
	}
	@Override
	public String toString() {
		return "AlPizza [AlPizzaId=" + AlPizzaId + ", totalSeats=" + totalSeats + ", availableSeats=" + availableSeats
				+ "]";
	}
	

}
