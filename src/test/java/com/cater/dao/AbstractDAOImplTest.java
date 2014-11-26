package com.cater.dao;

import org.hibernate.SessionFactory;
import org.junit.Before;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * Description: 
 * Created: Nov 23, 2014
 * @author Hari 
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:test-applicationContext-hibernate.xml" })
@Component
public abstract class AbstractDAOImplTest {
	@Autowired
	private SessionFactory sessionFactory;

	@Before
	public void setUp() throws Exception {
		DAOTestHelper.clearTables(sessionFactory);
	}

	protected SessionFactory getSessionFactory() {
		return sessionFactory;
	}
}