package com.cater.dao;

import org.springframework.stereotype.Component;

import com.cater.model.Login;

@Component
public class LoginDAOImpl extends AbstractDAOImpl implements LoginDAO {
	//private static final Logger logger = Logger.getLogger(LoginDAOImpl.class);
	@Override
	public boolean save(Login login) {
		return super.save(Login.class, login);
	}

	@Override
	public Login findById(int id) {
		return super.findById(Login.class, id);
	}
}
