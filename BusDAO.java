package com.infinite.bus;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;


public class BusDAO {
	
	SessionFactory sessionFactory;
	
	public List<Bus> showBus(String bus){
		sessionFactory = SessionHelper.getConnection();
		Session session=sessionFactory.openSession();
		Query query = session.createQuery("from Bus");
		Criteria cr = session.createCriteria(Bus.class);
		List<Bus> busList=query.list();
		return busList;
		
	}
	
	public List<Refund> showRefund(String refund){
		sessionFactory = SessionHelper.getConnection();
		Session session=sessionFactory.openSession();
		Query query = session.createQuery("from Refund");
		Criteria cr = session.createCriteria(Refund.class);
		List<Refund> refundList=query.list();
		return refundList;
		
	}
	
	public String generateBusId(){
		 sessionFactory = SessionHelper.getConnection();
		 Session session = sessionFactory.openSession();
		 Criteria cr = session.createCriteria(Bus.class);
		 List<Bus> busList = cr.list();
		 if(busList.size()==0){
			 return "B001";
		 }
		 session.close();
		 String id = busList.get(busList.size()-1).getBusId();
		 int id1 = Integer.parseInt(id.substring(1));
		 id1++;
		 String id2 = String.format("B%03d", id1);
		return id2;
		 
		}
   
	public String addBus(Bus bus){
		String busId=generateBusId();
		 bus.setBusId(busId);
		 bus.setUserId(3);
		sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
		Criteria cr = session.createCriteria(Bus.class);
		Transaction trans = session.beginTransaction();
		session.save(bus);
		trans.commit();
		return "Bus Added Successfully...";
		
	}
	
	
	
	public java.sql.Date ConvertDate(String dt) throws ParseException {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		Date d1 =  sdf.parse(dt);
		return new java.sql.Date(d1.getTime()) ;
		
	}
	
	public String addRefund(Refund refund){
//		String refundId= generateRefundId();
//		refund.setRefundId(refundId);
		refund.setRefundStatus(RefundStatus.PENDING);
		java.sql.Date sqlDate=new java.sql.Date(refund.getRefundDate().getTime());
		refund.setRefundDate(sqlDate);
		sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
		Criteria cr = session.createCriteria(Refund.class);
		Transaction trans = session.beginTransaction();
		session.save(refund);
		trans.commit();
		return "Refund Added Successfully...";
	}

}
