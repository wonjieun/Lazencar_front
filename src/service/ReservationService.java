package service;

import java.util.List;

import dto.Reservation;
import dto.Car;
import dto.Coupon;
import dto.Damage;
import dto.Etc;

public interface ReservationService {
		public List car_list();
		public List coupon_list();
		public List damage_list();
		public List etc_list();
		public Car carselect(String car);
		public Coupon couponselect(String coupon);
		public Damage damageselcet(String damage);
		public Etc etcselect(String etc);
		
		void insertRES(Reservation res);
}
