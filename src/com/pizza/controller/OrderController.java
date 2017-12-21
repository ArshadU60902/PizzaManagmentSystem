package com.pizza.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.pizza.dao.CustomerDaoImpl;
import com.pizza.dao.MyOrdersDao;
import com.pizza.dao.PizzaOrderDao;
import com.pizza.entity.CartItem;
import com.pizza.entity.Customer;
import com.pizza.entity.Order;
import com.pizza.entity.OrderedItems;

@Controller
public class OrderController {

	@Autowired
	private Customer customer;

	@Autowired
	private PizzaOrderDao pDao;

	@Autowired
	private CustomerDaoImpl cDao;

	@Autowired
	private ModelAndView mdlView;

	@Autowired
	private Order order;

	@Autowired
	private CartItem cartItem;

	@Autowired
	private MyOrdersDao myOrder;

	@RequestMapping(value = "/addToCart", method = RequestMethod.POST)
	public ModelAndView onAddToCart(@ModelAttribute("cart") CartItem item, HttpSession session) {

		Customer cust = (Customer) session.getAttribute("customer");

		HashMap<Customer, List<CartItem>> items = new HashMap<Customer, List<CartItem>>();

		items = (HashMap<Customer, List<CartItem>>) session.getAttribute("items");

		HashMap<Customer, List<CartItem>> newCartItems = pDao.addToCart(items, item, cust);

		session.setAttribute("items", newCartItems);

		System.out.println(newCartItems);

		mdlView.addObject("command", cartItem);
		mdlView.setViewName("home");
		return mdlView;
	}

	@RequestMapping(value = "/proceedToCheckOut", method = RequestMethod.GET)
	public ModelAndView onProceedToCheckOut(HttpSession session) {

		Customer cust = (Customer) session.getAttribute("customer");

		HashMap<Customer, List<CartItem>> items = (HashMap<Customer, List<CartItem>>) session.getAttribute("items");
		List<CartItem> allItems = items.get(cust);

		double gTotal = pDao.calculateTotal(items, cust);
		session.setAttribute("gTotal", gTotal);
		mdlView.addObject("savedOrder", "");
		mdlView.setViewName("checkOut");
		mdlView.addObject("allItems", allItems);
		return mdlView;
	}

	@RequestMapping(value = "/confirm", method = RequestMethod.POST)
	public ModelAndView proceed(HttpSession session) {

		Customer cust = (Customer) session.getAttribute("customer");

		HashMap<Customer, List<CartItem>> items = (HashMap<Customer, List<CartItem>>) session.getAttribute("items");
		List<CartItem> allItems = items.get(cust);
		double gTotal = (double) session.getAttribute("gTotal");

		boolean status = pDao.saveOrder(items, cust, gTotal);
		if (status) {
			mdlView.addObject("savedOrder", "Successfully Saved Your Order---");
			mdlView.setViewName("checkOut");
		}
		return mdlView;
	}

	@RequestMapping(value = "/showOrders", method = RequestMethod.GET)
	public ModelAndView showOrders(HttpSession session) {
		Customer orderedCustomer = (Customer) session.getAttribute("customer");
		List<OrderedItems> orderList = myOrder.findOrderByCustomer(orderedCustomer);
		mdlView.addObject("orderList", orderList);
		mdlView.setViewName("ViewOrders");
		return mdlView;
	}

	@RequestMapping(value = "/cancel", method = RequestMethod.POST)
	public ModelAndView CancelOrder(@RequestParam("getId") long id) {
		myOrder.orderDelete(id);
		mdlView.addObject("deletedMessege", "Order cancelled");
		mdlView.setViewName("home");
		return mdlView;
	}

}
