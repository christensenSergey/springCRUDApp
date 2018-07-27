package com.gmail.sergey.christensen.springCRUDApp.service.interfaces;

import java.util.List;

import com.gmail.sergey.christensen.springCRUDApp.entities.User;

public interface UserService {
	public List<User> findAll();

	public void saveUser(User user);

	public void deleteUserById(Long id);

	public User getOne(Long id);

}
