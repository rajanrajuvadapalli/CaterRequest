package com.cater.hibernate;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.apache.log4j.Logger;
import org.hibernate.SessionFactory;
import org.hibernate.StaleObjectStateException;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

/** 
 * Description: 
 * @since Jan 28, 2015
 * @author Hari Samala
 * 
 * @see <a href="http://stackoverflow.com/questions/6722158/best-way-to-handle-hibernate-sessions-in-a-layered-spring-mvc-web-application">stackoverflow</a>
 * @see <a href="https://developer.jboss.org/wiki/OpenSessionInView">Example</a>
 * @see <a href="http://docs.spring.io/spring/docs/3.0.x/javadoc-api/org/springframework/orm/hibernate3/support/OpenSessionInViewFilter.html">OpenSessionInViewFilter</a>
 */
public class HibernateSessionRequestFilter implements Filter {
	private static final Logger log = Logger
			.getLogger(HibernateSessionRequestFilter.class);
	private SessionFactory sf;

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/* (non-Javadoc)
	 * @see javax.servlet.Filter#doFilter(javax.servlet.ServletRequest, javax.servlet.ServletResponse, javax.servlet.FilterChain)
	 */
	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		try {
			log.debug("Starting a database transaction");
			sf.getCurrentSession().beginTransaction();
			// Call the next filter (continue request processing)  
			chain.doFilter(request, response);
			// Commit and cleanup  
			log.debug("Committing the database transaction");
			sf.getCurrentSession().getTransaction().commit();
		}
		catch (StaleObjectStateException staleEx) {
			log.error("This interceptor does not implement optimistic concurrency control!");
			log.error("Your application will not work until you add compensation actions!");
			// Rollback, close everything, possibly compensate for any permanent changes  
			// during the conversation, and finally restart business conversation. Maybe  
			// give the user of the application a chance to merge some of his work with  
			// fresh data... what you do here depends on your applications design.  
			throw staleEx;
		}
		catch (Throwable ex) {
			// Rollback only  
			ex.printStackTrace();
			try {
				if (sf.getCurrentSession().getTransaction().isActive()) {
					log.debug("Trying to rollback database transaction after exception");
					sf.getCurrentSession().getTransaction().rollback();
				}
			}
			catch (Throwable rbEx) {
				log.error("Could not rollback transaction after exception!",
						rbEx);
			}
			// Let others handle it... maybe another interceptor for exceptions?  
			throw new ServletException(ex);
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		log.debug("Initializing filter...");
		WebApplicationContext webApplicationContext = ContextLoader
				.getCurrentWebApplicationContext();
		sf = webApplicationContext.getBean(SessionFactory.class);
	}
}
