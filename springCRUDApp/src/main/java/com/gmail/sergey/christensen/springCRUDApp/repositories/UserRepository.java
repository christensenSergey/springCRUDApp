package com.gmail.sergey.christensen.springCRUDApp.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.gmail.sergey.christensen.springCRUDApp.entities.User;

public interface UserRepository extends JpaRepository<User, Long> {

}
