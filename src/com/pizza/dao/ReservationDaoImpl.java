package com.pizza.dao;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.pizza.entity.AlPizza;
import com.pizza.entity.Reservation;
import com.pizza.entity.SeatStatus;
import com.pizza.ifaces.GenericDao;

@Repository
public class ReservationDaoImpl implements GenericDao<Reservation> {
	@Autowired
	private HibernateTemplate template;
	private int balanceSeats;

	public int[] availableSeats() {
		List<AlPizza> seats = (List<AlPizza>) template.find("from AlPizza");
		int number = 0;

		for (AlPizza eachPizza : seats) {
			number = eachPizza.getAvailableSeats();

		}
		int[] availableSeats = new int[number];
		for (int i = 0; i < number; i++) {
			availableSeats[i] = i + 1;
		}
		return availableSeats;
	}

	public Reservation addReservation(Reservation reservation, long customerId) {
		List<AlPizza> availSeats = (List<AlPizza>) template.find("from AlPizza");
		int eachTotalSeat = 0;
		for (AlPizza eachPizzaObject : availSeats) {
			eachTotalSeat = eachPizzaObject.getAvailableSeats();
		}
		int availableSeat = reservation.getNumberOfSeats();
		Date dateOfReservation = reservation.getDate();
		SeatStatus status = new SeatStatus();
		long reservationKey = 0;
		List<SeatStatus> availSeatsEachDay = (List<SeatStatus>) template
				.find("from SeatStatus where dateOfBooking='" + dateOfReservation + "'");
		Reservation newReservation = null;
		if (availSeatsEachDay.size() == 0) {
			int updatedSeatList = eachTotalSeat - availableSeat;
			balanceSeats = updatedSeatList;
			status.setAvailableSeats(updatedSeatList);
			status.setDateOfBooking(dateOfReservation);
			reservation.setCustomerId(customerId);
			reservationKey = (long) template.save(reservation);
			long statusKey = (long) template.save(status);
			if (reservationKey > 0) {
				newReservation = reservation;
			}
		} else {
			int availSeat = 0;
			long statusId = 0;
			for (SeatStatus seatObject : availSeatsEachDay) {
				availSeat = seatObject.getAvailableSeats();
				dateOfReservation = seatObject.getDateOfBooking();
				statusId = seatObject.getStatusId();
			}
			int updatedSeat = availSeat - availableSeat;
			if (updatedSeat >= 0) {
				balanceSeats = updatedSeat;
				status.setAvailableSeats(updatedSeat);
				status.setDateOfBooking(dateOfReservation);
				status.setStatusId(statusId);
				reservation.setCustomerId(customerId);
				reservationKey = (long) template.save(reservation);
				if (reservationKey > 0) {
					newReservation = reservation;
				}
				template.saveOrUpdate(status);
			}
		}
		return newReservation;
	}

	@Override
	public Reservation Add(Reservation t) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Reservation update(Reservation t) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Reservation> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Reservation findById(long key) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(Reservation t) {
		// TODO Auto-generated method stub

	}

	public int getBalanceSeats() {
		return balanceSeats;
	}

	public List<Reservation> findReservation(long customerId) {

		List<Reservation> availReservation = (List<Reservation>) template
				.find("from Reservation where customerId=" + customerId);
		System.out.println(availReservation);
		return availReservation;
	}
}
