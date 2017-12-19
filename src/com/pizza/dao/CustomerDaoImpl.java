package com.pizza.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.pizza.entity.Customer;
import com.pizza.ifaces.GenericDao;

@Repository
public class CustomerDaoImpl implements GenericDao<Customer> {

	 @Autowired
		private HibernateTemplate template;
	     @Autowired
	     private Customer customer;
	@Override
	public Customer Add(Customer customer) {
		// TODO Auto-generated method stub
		long key=(long)template.save(customer);
		Customer customerDetails=null;
		if(key>0)
		{
			customerDetails=customer;
		}
		
		return customerDetails;
	}

	@Override
	public Customer update(Customer t) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Customer> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Customer findById(long key) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(Customer t) {
		// TODO Auto-generated method stub
		
	}
	public Customer checkLogin(String userName,String passWord)
	{
		List<Customer> customerList=(List<Customer>)template.find("from Customer where userName='"+userName+"'and PassWord='"+passWord+"'");
		Customer customer=null;
		for(Customer c:customerList){
		customer=c;
		}
		
		return customer;
	}

}
