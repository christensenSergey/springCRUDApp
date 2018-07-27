package com.gmail.sergey.christensen.springCRUDApp.controllers;

import java.util.EnumSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.gmail.sergey.christensen.springCRUDApp.entities.User;
import com.gmail.sergey.christensen.springCRUDApp.service.interfaces.UserService;
import com.gmail.sergey.christensen.springCRUDApp.utils.GenderTypes;

@RestController
public class UserRestController {

	@Autowired
	private UserService userService;
	private Set<GenderTypes> genderTypes = EnumSet.allOf(GenderTypes.class);

	// Adding data to model for form on JSP
	@ModelAttribute
	public void addAttributes(Model model) {
		model.addAttribute("user", new User());
		model.addAttribute("genderTypes", genderTypes);
	}

	// Get all users
	@RequestMapping(value = "/", method = { RequestMethod.GET })
	public ModelAndView getAllUsers() {
		ModelAndView modelAndView = new ModelAndView("listOfUsers");
		modelAndView.addObject("userList", userService.findAll());
		return modelAndView;
	}

	// Create or update user
	@RequestMapping(value = "/", method = RequestMethod.POST, consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
	public @ResponseBody ModelAndView createOrUpdateUser(User user) {
		userService.saveUser(user);
		ModelAndView modelAndView = new ModelAndView("listOfUsers");
		modelAndView.addObject("userList", userService.findAll());
		modelAndView.addObject("user", new User());
		return modelAndView;
	}

	// Delete user
	@RequestMapping(value = "/delete", method = RequestMethod.POST, consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
	public @ResponseBody ModelAndView deleteUser(Long userId) {
		userService.deleteUserById(userId);
		ModelAndView modelAndView = new ModelAndView("listOfUsers");
		modelAndView.addObject("userList", userService.findAll());
		return modelAndView;
	}

	// Transfer user profile to update page
	@RequestMapping(value = "/update", method = RequestMethod.POST, consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
	public @ResponseBody ModelAndView updateUser(Long userId) {
		User userForUpdate = userService.getOne(userId);
		ModelAndView modelAndView = new ModelAndView("updateUser");
		modelAndView.addObject("userForUpdate", userForUpdate);
		return modelAndView;
	}

}
