package dao;

import java.util.List;
import dto.Reservation;
import dto.Car;
import dto.Coupon;
import dto.Damage;
import dto.Etc;

public interface ReservationDao {
	public List car_list();
	public List coupon_list();
	public List damage_list();
	public List etc_list();
	public Car carselect(String car);
	public Coupon couponselect(String coupon);
	public Damage damageselect(String damage);
	public Etc etcselect(String etc);
	
	public void insertRES(Reservation res); 
	
	
}
