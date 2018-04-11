package service;

import java.util.List;

import dto.Reservation;
import dto.Car;
import dto.Coupon;

public interface ReservationService {
		public List car_list();
		public List coupon_list();
		public Car carselect(String car);
		void insertRES(Reservation res, Coupon cou);
}
