package com.cts.transport.interfaces;

import org.springframework.stereotype.Repository;

import com.cts.transport.model.loginCredentials;

import org.springframework.data.jpa.repository.JpaRepository;

@Repository
public interface loginCredentialsInterface extends JpaRepository<loginCredentials,String>{
	
}
