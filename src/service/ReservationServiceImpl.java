package service;

import java.util.List;

import dao.ReservationDao;
import dao.ReservationDaoImpl;
import dto.Reservation;
import dto.Car;
import dto.Coupon;

public class ReservationServiceImpl implements ReservationService{

	//DAO 와 Service 연결
	private ReservationDao reservation = new ReservationDaoImpl();
	
	@Override
	public List car_list() {
		return reservation.car_list();		
	}

	@Override
	public void insertRES(Reservation res, Coupon cou) {
		reservation.insertRES(res, cou);
	}
	
	@Override
	public Car carselect(String car) {
		return reservation.carselect(car);
	}

	@Override
	public List coupon_list() {
		return reservation.coupon_list();
	}

}
