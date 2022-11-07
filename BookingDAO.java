package vijaypc.BusBooking;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class BookingDAO {
	SessionFactory sessionFactory;
	Session session;

	
	
		 public String generateBookingId(){
		 sessionFactory = SessionHelper.getConnection();
		 Session session = sessionFactory.openSession();
		 Criteria cr = session.createCriteria(Booking.class);
		 List<Booking> bookingList = cr.list();
		 if(bookingList.size()==0){
			 return "B001";
		 }
		 session.close();
		 String id = bookingList.get(bookingList.size()-1).getBookingId();
		 int id1 = Integer.parseInt(id.substring(1));
		 id1++;
		 String id2 = String.format("B%03d", id1);
		return id2;
	}
		 
		 
		 public String addBooking(Booking booking){
			 sessionFactory = SessionHelper.getConnection();
			 Session session = sessionFactory.openSession();
			 String bookId = generateBookingId();

			 booking.setBookingStatus(BookingStatus.APPROVED);
			 booking.setBookingId(bookId);
			 Transaction t = session.beginTransaction();
			 session.save(booking);
			 t.commit();
			 return "Added Booking Details";
		}
		 
		 public List<Booking> showBooking(String booking){
			 sessionFactory = SessionHelper.getConnection();
			 Session session = sessionFactory.openSession();
			 Query query = session.createQuery("from Booking");
			 Criteria cr = session.createCriteria(Booking.class);
			 List<Booking> bookingLst = query.list();
			 return bookingLst;
		 }
		 
		 
}
