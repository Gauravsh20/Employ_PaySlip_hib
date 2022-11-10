package Training.Infinite.Employ_PayRol;

import java.sql.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

public class LeaveDAO {
	SessionFactory sessionFactory;
	
	
	 public String addLeave(Leave leave) {
	        sessionFactory=SessionHelper.getConnection();
	        Session session =sessionFactory.openSession();
	        Transaction tr=session.beginTransaction();
	        Employ employ =new Employ();
	        employ=searchById(leave.getEmpno());
	        double sal=employ.getSalary();
	        
	        
	        long ms = leave.getEndDate().getTime()-leave.getEndDate().getTime();
	       
	        int noOfDays=noOfDays(leave.getEndDate(),leave.getStartDate());
	        
	        leave.setNoOfDays(noOfDays);
	        double lossPay=lossOfPay(noOfDays,sal);
	        leave.setLossOfPay(lossPay);
	        session.save(leave);
	        tr.commit();
	        session.close();
	         
	        employ=searchById(leave.getEmpno());
	        if(noOfDays<=3) {
	        employ.setLeaveAvailable(employ.getLeaveAvailable()-noOfDays);}
	        else {
	        	employ.setLeaveAvailable(employ.getLeaveAvailable()-3);
	        }
	        session=sessionFactory.openSession();
	        tr=session.beginTransaction();
	        session.saveOrUpdate(employ);
	        tr.commit();
	        
	        return "Leave Applied";
	    }
	 
	 
	 
	 public Employ searchById(int empId) {
	        sessionFactory = SessionHelper.getConnection();
	          Session session = sessionFactory.openSession();
	          Criteria cr = session.createCriteria(Employ.class);
	          cr.add(Restrictions.eq("empno", empId));
	          List<Employ> empList = cr.list();
	          return empList.get(0);
	    }
	 
	 
	 
	 public int noOfDays(Date leaveEndDate,Date leaveStartDate) {
	        int days = 0;
	        

	         days=(int)((leaveEndDate.getTime()-leaveStartDate.getTime())/(1000*60*60*24));
	        days++;
	        return days;
	    }
	 
	 
	 private double lossOfPay(int noOfDay,double sal) {
	        double s=sal/30.46,lpay = 0;
	        int d;
	        if(noOfDay > 3) {
	            d=noOfDay-3;
	            lpay=d*s;
	        }
	        return lpay;
	    }
	 
	 
	 
	 public Date convertDate(java.util.Date d) {
	        Date sqlDate=new Date(d.getTime());
	        return sqlDate;
	    }
	 
	 
	    public Leave searchId(int empId) {
	        sessionFactory = SessionHelper.getConnection();
	          Session session = sessionFactory.openSession();
	          Criteria cr = session.createCriteria(Leave.class);
	          cr.add(Restrictions.eq("empno", empId));
	          List<Leave> empList = cr.list();
	          return empList.get(0);
	    }
	    
	    public double lossPay(int empno,int month) {

	         Leave leave=new Leave();
	         leave=searchId(empno);
	         int month1=leave.getStartDate().getMonth();
	         int month2=leave.getEndDate().getMonth();
	         Employ employ =new Employ();	            
	         employ=searchById(leave.getEmpno());
	         double sal=    employ.getSalary();
	         double s=sal/30.46,lpay = 0;long d;
	         sessionFactory = SessionHelper.getConnection();
	         Session session = sessionFactory.openSession();
	         Query query=session.createQuery("select sum(noOfDays) from Leave where empno=:empno AND (MONTH(leaveStartDate)=:month AND "
	                 + "MONTH(leaveEndDate)=:month)")
	                   .setParameter("empno", empno).setParameter("month",month);
	         List<Long> count=query.list();
	         long x =(Long)count.get(0);
	         if(x>=3) {
	             d=x-3;
	             lpay=d*s;
	         }
	         return lpay;
	     }	    
	     
	 

}
