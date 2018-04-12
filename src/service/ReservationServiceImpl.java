package service;

import java.util.List;

import dao.ReservationDao;
import dao.ReservationDaoImpl;
import dto.Reservation;
import dto.Car;
import dto.Coupon;
import dto.Damage;
import dto.Etc;

public class ReservationServiceImpl implements ReservationService{

	//DAO 와 Service 연결
	private ReservationDao reservation = new ReservationDaoImpl();
	
	@Override
	public List car_list() {
		return reservation.car_list();		
	}
	
	@Override
	public Car carselect(String car) {
		return reservation.carselect(car);
	}
	

	@Override
	public List damage_list() {
		return reservation.damage_list();
	}
	
	@Override
	public Damage damageselcet(String damage) {
		return reservation.damageselect(damage);
	}
	
	@Override
	public List etc_list() {
		return reservation.etc_list();		
	}
	
	@Override
	public Etc etcselect(String etc) {
		return reservation.etcselect(etc);
	}
	
	@Override
	public List coupon_list() {
		return reservation.coupon_list();
	}
	
	@Override
	public Coupon couponselect(String coupon) {
		return reservation.couponselect(coupon);
	}
	
	
	@Override
	public void insertRES(Reservation res) {
		//ServiceImpl res 출력
		System.out.println("reservationServiceImpl res 출력" + res.getMemId());
		reservation.insertRES(res);
	}


}
