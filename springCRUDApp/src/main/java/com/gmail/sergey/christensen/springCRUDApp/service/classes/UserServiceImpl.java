package com.gmail.sergey.christensen.springCRUDApp.service.classes;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gmail.sergey.christensen.springCRUDApp.entities.User;
import com.gmail.sergey.christensen.springCRUDApp.repositories.UserRepository;
import com.gmail.sergey.christensen.springCRUDApp.service.interfaces.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserRepository userRepository;

	@Override
	public List<User> findAll() {
		return userRepository.findAll();
	}

	@Override
	public void saveUser(User user) {
		userRepository.save(user);
	}

	@Override
	public void deleteUserById(Long id) {
		userRepository.deleteById(id);
	}

	@Override
	public User getOne(Long id) {
		return userRepository.getOne(id);
	}

}
