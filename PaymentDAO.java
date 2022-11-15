package vijaypc.BusBooking;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class PaymentDAO {
SessionFactory sessionFactory;
Session session;
	
	public String paymentId() {
		sessionFactory=SessionHelper.getConnection();
		Session session;
		session=sessionFactory.openSession();
		Criteria cr=session.createCriteria(PaymentDetail.class);
		List<PaymentDetail> plst=cr.list();
		if (plst.size()==0) {
			return "P001";
		}
		String ScheduleIds=plst.get(plst.size() - 1).getPaymentId();
		int ids = Integer.parseInt(ScheduleIds.substring(1));
		String bid=String.format("P%03d",++ids);
		return bid;
		}
	
	public String addPayment(PaymentDetail paymentDetail){
		 String pId = paymentId();
			paymentDetail.setPaymentId(pId);
			if(sessionFactory == null){
			sessionFactory=SessionHelper.getConnection();
			}
//			User usr = new User();
//			String usrID = usr.getUserid();
//			paymentDetail.setUserId(usrID);
//			Booking bk = new Booking();
//			String bid = bk.getBookingId();
//			System.out.println(bid);
//			paymentDetail.setBookingId(bid);
//			 String bookId = generateBookingId();
//			 paymentDetail.setBookingId(bookId);
			session=sessionFactory.openSession();
			Transaction tr = session.beginTransaction();
			session.save(paymentDetail);
			tr.commit();
			return "Payment Details Added";
			
	 }
	public Date convertDate(String strDate) throws ParseException{
		java.util.Date test = new SimpleDateFormat("yyyy-MM-dd").parse(strDate);
		java.sql.Date sqlDate=new java.sql.Date(test.getTime());
		return sqlDate;
	   }
}
