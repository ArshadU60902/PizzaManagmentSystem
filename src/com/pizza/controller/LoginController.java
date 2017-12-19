package com.pizza.controller;

import java.util.ArrayList;
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
import com.pizza.dao.PizzaDao;
import com.pizza.dao.PizzaOrderDao;
import com.pizza.dao.ToppingDao;
import com.pizza.entity.CartItem;
import com.pizza.entity.Customer;
import com.pizza.entity.Pizza;
import com.pizza.entity.Toppings;



@Controller
public class LoginController {


	
	@Autowired
	private PizzaDao pDao;

	 @Autowired
		private ModelAndView mdlView;
	 @Autowired
		private  Customer customer;
	 @Autowired
	 private CustomerDaoImpl dao;
	 @Autowired
		private PizzaOrderDao poDao;
	 @Autowired
		private CartItem item;
	 

		@Autowired
		private ToppingDao tDao;
	 
	 @RequestMapping("/")
	 public ModelAndView init(){
	 	mdlView.addObject("modelData","PIZZA REGISTRATION");
	 	mdlView.setViewName("NewFile");
	 	return mdlView;
	 }
	 @RequestMapping(value="/register")
	 public ModelAndView initCustomerForm()
	 {
		 mdlView.addObject("error","");
	 	mdlView.addObject("command",customer);
	 	mdlView.setViewName("addCustomer");
	 	
	 	
	 	return mdlView;
	 }
	 @RequestMapping(value="/register", method=RequestMethod.POST)
	 public ModelAndView submit(@ModelAttribute("fromJsp") Customer obj){
	 	Customer cust= dao.Add(obj);
	 	if(cust==null)
	 	{
	 		mdlView.addObject("error","Registration Failed !!!");
	 		mdlView.setViewName("addCustomer");
	 	}
	 	else{
	 		mdlView.addObject("command",customer);
		 	mdlView.setViewName("NewFile");
		 	
	 	}
	return mdlView;
	 	}
	 
	 @RequestMapping(value="/login",method=RequestMethod.POST)
	 public ModelAndView login(@RequestParam("userName") String userName,@RequestParam("passWord") String passWord, HttpSession session)
	 {
		 
		 Customer customerDetails=dao.checkLogin(userName,passWord);
		 if(customerDetails==null)
		 {
			 mdlView.addObject("error","Invalid Username or Password");
			 mdlView.setViewName("NewFile");
		 }
		 else
		 {
			 session.setAttribute("customer",customerDetails);
			System.out.println(customerDetails);
			 
			 
				List<Pizza> pizzas=pDao.getPizzas();
				List<Toppings> toppings=tDao.getToppings();
//				List<String> sizes=poDao.getSizes();
				
				session.setAttribute("pizzas", pizzas);
				session.setAttribute("toppings", toppings);
			//	session.setAttribute("sizes", sizes);
			 
				mdlView.addObject("command", item);
				mdlView.setViewName("home");
				 HashMap<Customer,List<CartItem>> items=new HashMap<Customer,List<CartItem>>();
					List<CartItem> list=new ArrayList<CartItem>();
					items.put(customerDetails, list);
					session.setAttribute("items", items);
			
		 }
		 return mdlView;
	 }
	 @RequestMapping(value="/viewMenu",method=RequestMethod.GET)
	 public ModelAndView toViewMenu(HttpSession session)
	 {

	 List<Pizza> pizzas=pDao.findAll();
	 List<Toppings> toppings=tDao.findAll();
	 session.setAttribute("pizzas", pizzas);
	 session.setAttribute("toppings", toppings);
	 mdlView.setViewName("welcome");
	 return mdlView;

	 }
	 @RequestMapping(value="/myn",method=RequestMethod.GET)
	 public ModelAndView toMenu(HttpSession session)
	 {
		 mdlView.setViewName("intermediate");

		 return mdlView;
	 }
	 @RequestMapping("/logout")
	 public ModelAndView onLogout(HttpSession session)
	 {
	 session.invalidate();
	 mdlView.addObject("success", ""); 
	 mdlView.addObject("loginError", "");
	 mdlView.setViewName("NewFile");
	 return mdlView;
	 }
}
