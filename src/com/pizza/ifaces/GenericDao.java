package com.pizza.ifaces;

import java.util.List;

public interface GenericDao<T> {

	public T Add(T t);
	public T update(T t);
	public List<T> findAll();
	public T findById(long key);
	public void delete(T t);
	
}
