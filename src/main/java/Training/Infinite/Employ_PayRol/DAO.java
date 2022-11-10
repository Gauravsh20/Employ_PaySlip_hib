package Training.Infinite.Employ_PayRol;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
public class DAO {
	SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	public List<Employ> showEmploy() {
		sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
		return session.createQuery("from Employ").list();
	}
	
	public double hra(double salary) {
		return (salary * 2)/100;
	}
	
	public double da(double salary) {
		return (salary * 1.25)/100;
	}
	
	public double ta(double salary) {
		return (salary * 0.95)/100;
	}
	
	public double tax(double salary) {
		return (salary * 2.3)/100;
	}
	
	public double pf(double salary) {
		return (salary * 3)/100;
	}

	public double gross(double salary) {
		return salary + hra(salary) + da(salary) + ta(salary);
	}
	
	public double netPay(double salary) {
		return gross(salary) - ta(salary) - pf(salary);
	}
	
	public String addEmploy(Employ employ) {
		sessionFactory =SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
		
		employ.setHra(hra(employ.getSalary()));
		employ.setDa(da(employ.getSalary()));
		employ.setTa(ta(employ.getSalary()));
		employ.setTax(tax(employ.getSalary()));
		employ.setPf(pf(employ.getSalary()));
		employ.setGross(gross(employ.getSalary()));
		employ.setNetPay(netPay(employ.getSalary()));
		employ.setLeaveAvailable(16);
		session.save(employ);
		session.beginTransaction().commit();
		session.close();
		
		return "Employee added.";
	}
	
	
	
}
