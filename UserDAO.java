package com.infinite.hib;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class UserDAO {
	
	SessionFactory sessionFactory;
	
	public String generateUserId() {
		 sessionFactory = SessionHelper.getConnection();
		 Session session = sessionFactory.openSession();
		 Criteria cr = session.createCriteria(User.class);
		 List<User> userList = cr.list();
		 if(userList.size()==0) {
		 return "U001";
	}
		 session.close();
		 String id = userList.get(userList.size()-1).getUserid();
		 int id1 = Integer.parseInt(id.substring(1));
		 id1++;
		 String id2 = String.format("U%03d",id1);
		 return id2;

   }

	public UserDAO() {}
	
	public String Adduser(User user){
		 String userid = generateUserId();
		 user.setUserid(userid);
		 sessionFactory = SessionHelper.getConnection();
	     Session session = sessionFactory.openSession();
	     Criteria cr = session.createCriteria(User.class);
	     Transaction trans = session.beginTransaction();
	     session.save(user);
	     trans.commit();
		return "User Details added Successfully";
		
	}
}
