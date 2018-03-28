package dao.adminDao;

import dto.Car;
import dto.Reservation;
/*
 * 미 완 성
 */


public interface ReservManageDao {
	//쿼리를 실행할 때마다 view를 발생시켜서 처리해야 함...?
	//모르겠다 
	
	
	//조건의 갯수를 받아서 갯수별로 조건을 추가해서 처리해야할듯
	public int checkCount(Reservation rev);
	
	//정렬시 기준을 정할 때, 정렬의 기준을 불러와서 String으로 받아와서
	//쿼리문에 넣어주기 위해 String으로 반환.
	public String getOrderBase(String str);
	//시작날짜, end날짜 불러오기
	public String getStartDate(Reservation rev);
	public String getEndDate(Reservation rev);
	
	//회원 계정 불러오기
	public String getMemId(Reservation rev);
	
	//차량 번호 불러오기
	public String getCarNum(Reservation rev);
	
	//차량 종류 가져오기, 예약테이블에 없기 때문에 차량쪽에서 가져옴
	public String getCarCategory(Car car);
	
	//예약 상태와 결제상태 .. 보류

}
