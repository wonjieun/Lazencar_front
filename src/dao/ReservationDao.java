package dao;

import java.util.List;

import dto.Reservation;
import dto.Car;
import dto.Coupon;

public interface ReservationDao {
	public List car_list();
	public List coupon_list();
	public Coupon couponselect(String coupon);
	public Car carselect(String car);
	public void insertRES(Reservation res, Coupon cou); 
	
}
