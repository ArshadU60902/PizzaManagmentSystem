package com.pizza.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.pizza.dao.ReservationDaoImpl;
import com.pizza.entity.Customer;
import com.pizza.entity.Reservation;

@Controller
public class ReservationController {

	@Autowired
	private  ModelAndView mdlView;
	@Autowired
	private Customer customer;
	@Autowired
	private Reservation reserve;
	
	@Autowired
	private ReservationDaoImpl dao;
	
	@RequestMapping(value="/reserve", method=RequestMethod.GET)
	public ModelAndView reserveForm()
	{
		mdlView.addObject("errorReservation","");
		mdlView.addObject("command",reserve);
		mdlView.setViewName("reservation");
		return mdlView;
	}
	@ModelAttribute("numberOfSeats")
	public int[] seatsAvailable(){
		int[] availableSeats=dao.availableSeats();
	
 		return availableSeats;
	}
	@RequestMapping(value="/reserve",method=RequestMethod.POST)
	public ModelAndView reserveFormSubmit(@ModelAttribute("reserved")Reservation obj, HttpSession session)
	{
	System.out.println("in post of reserve");
	Customer customer=(Customer) session.getAttribute("customer");
	 
	long id=customer.getCustomerId();
	System.out.println(id);
	 
	Reservation reservedDetails=dao.addReservation(obj, id);
	if(reservedDetails==null)
	{
		int balanceSeats=dao.getBalanceSeats();
	mdlView.addObject("errorReservation","Available Seats: "+balanceSeats+" seats on "+obj.getDate());
	mdlView.setViewName("reservation");
	}
	else
	{
	mdlView.addObject("test","Booked Succesfully");
	Customer customerDetails=(Customer) session.getAttribute("customer");
	long customerId=customerDetails.getCustomerId();
	System.out.println(customerId);
	List<Reservation> reservationList=dao.findReservation(customerId);
	mdlView.addObject("customerReservation",reservationList);
	System.out.println("List is"+reservationList);
	mdlView.setViewName("success");
	}
	 
	return mdlView;
	 
	}
	
	@RequestMapping(value="/viewReserve",method=RequestMethod.GET)
	public ModelAndView initViewReserved(HttpSession session)
	{
	//mdlView.addObject("errorReservation", "");
	Customer customerDetails=(Customer) session.getAttribute("customer");
	long customerId=customerDetails.getCustomerId();
	System.out.println(customerId);
	List<Reservation> reservationList=dao.findReservation(customerId);
	mdlView.addObject("customerReservation",reservationList);
	System.out.println("List is"+reservationList);
	mdlView.setViewName("viewReserve");
	return mdlView;
	}
	
}
