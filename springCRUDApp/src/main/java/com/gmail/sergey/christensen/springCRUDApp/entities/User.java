package com.gmail.sergey.christensen.springCRUDApp.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import com.gmail.sergey.christensen.springCRUDApp.utils.GenderTypes;

/**
 * Simple JavaBean object that represents Users
 * 
 * @author Sergey Christensen
 */

@Entity
@Table(name = "users")
public class User {

	public User() {
	}

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "userId", updatable = false, nullable = false)
	private Long userId;

	@NotNull
	@Column(name = "firstName")
	private String firstName;

	@NotNull
	@Column(name = "lastName")
	private String lastName;

	@NotNull
	@Column(name = "birthDay")
	private String birthDay;

	@Enumerated(EnumType.STRING)
	@Column(name = "gender", nullable = false)
	private GenderTypes gender;

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getBirthDay() {
		return birthDay;
	}

	public void setBirthDay(String birthDay) {
		this.birthDay = birthDay;
	}

	public GenderTypes getGender() {
		return gender;
	}

	public void setGender(GenderTypes gender) {
		this.gender = gender;
	}

}
