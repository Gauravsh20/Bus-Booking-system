package infinite.BusBooking;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;

public class UserDAO {

	SessionFactory sessionFactory;
	
	public int checkUsers(String user, String psswd){
		sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
		Criteria cr = session.createCriteria(User.class);
		cr.add(Restrictions.eq("username", user));
		cr.add(Restrictions.eq("password", psswd));
		List<User> usrLst = cr.list();
		return usrLst.size();
		
	}
}
