package com.pizza.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.pizza.entity.Toppings;
import com.pizza.ifaces.GenericDao;

@Repository
public class ToppingDao implements GenericDao<Toppings> {

	@Autowired
	private HibernateTemplate template;

	@Autowired
	private Toppings topping;

	public List<Toppings> getToppings() {

		List<Toppings> toppings = null;
		toppings = template.loadAll(Toppings.class);
		return toppings;
	}

	@Override
	public Toppings Add(Toppings t) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Toppings update(Toppings t) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Toppings> findAll() {
		// TODO Auto-generated method stub
		List<Toppings> toppings = null;
		toppings = template.loadAll(Toppings.class);
		return toppings;
	}

	@Override
	public Toppings findById(long key) {
		// TODO Auto-generated method stub
		topping = (Toppings) template.get(Toppings.class, key);
		return topping;
	}

	@Override
	public void delete(Toppings t) {
		// TODO Auto-generated method stub

	}

}
