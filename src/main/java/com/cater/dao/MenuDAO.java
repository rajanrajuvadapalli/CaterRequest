package com.cater.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.hibernate.sql.JoinType;
import org.springframework.stereotype.Component;

import com.cater.model.Menu;

/**
 * The Class MenuDAO.
 */
@Component
public class MenuDAO extends DataAccessObject {
	/** The Constant logger. */
	private static final Logger logger = Logger.getLogger(MenuDAO.class);

	/**
	 * Save or update.
	 *
	 * @param menu the menu
	 * @return true, if successful
	 */
	public boolean saveOrUpdate(Menu menu) {
		if (menu == null) {
			logger.error("Cannot save null value for Menu.");
			return false;
		}
		else {
			if (menu.getId() == null) {
				return super.save(Menu.class, menu);
			}
			else {
				return super.update(Menu.class, menu);
			}
		}
	}

	/**
	 * Find by id.
	 *
	 * @param id the id
	 * @return the menu
	 */
	public Menu findById(Integer id) {
		return super.findById(Menu.class, id);
	}

	/**
	 * Find menus with event id.
	 *
	 * @param eventID the event id
	 * @return the list
	 */
	@SuppressWarnings("unchecked")
	public List<Menu> findMenusWithEventId(Integer eventID) {
		if (eventID == null) {
			return null;
		}
		logger.debug("Finding menus with event ID: " + eventID);
		try {
			Session session = getSessionFactory().getCurrentSession();
			List<Menu> list = (List<Menu>) session
					.createCriteria(Menu.class, "menu")
					.createAlias("menu.event", "event",
							JoinType.LEFT_OUTER_JOIN)
					.add(Restrictions.eq("event.id", eventID)).list();
			return list;
		}
		catch (HibernateException he) {
			logger.error(
					"Exception occurred while Finding menus with event ID: "
							+ eventID, he);
			throw he;
		}
	}
}
