package com.pizza.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.pizza.entity.Pizza;
import com.pizza.entity.Toppings;
import com.pizza.ifaces.GenericDao;

@Repository
public class PizzaDao implements GenericDao<Pizza> {

	@Autowired
	private HibernateTemplate template;
	
	@Autowired
	private Pizza pizza;
	
	
	
	
	public List<Pizza> getPizzas(){
		
		List<Pizza> pizzas=null;
		pizzas=template.loadAll(Pizza.class);
		
		
		return pizzas;
		
	}




	@Override
	public Pizza Add(Pizza t) {
		// TODO Auto-generated method stub
		return null;
	}




	@Override
	public Pizza update(Pizza t) {
		// TODO Auto-generated method stub
		return null;
	}




	@Override
	public List<Pizza> findAll() {
		// TODO Auto-generated method stub
		List<Pizza> pizzas=null;
		pizzas=template.loadAll(Pizza.class);
		
		
		return pizzas;
	}




	@Override
	public Pizza findById(long key) {
		pizza=(Pizza) template.get(Pizza.class,key);
		return pizza;
	}




	@Override
	public void delete(Pizza t) {
		// TODO Auto-generated method stub
		
	}
	
}
