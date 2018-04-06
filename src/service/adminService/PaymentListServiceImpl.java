package service.adminService;

import java.util.List;

import dao.adminDao.PaymentListDao;
import dao.adminDao.PaymentListDaoImpl;
import dto.Payment;
import dto.adminDto.PaymentManage;
import util.Paging;

public class PaymentListServiceImpl implements PaymentListService{
	PaymentListDao dao = new PaymentListDaoImpl();
	@Override
	public List<Payment> getPaymentList(Paging paging, PaymentManage pm) {
		return dao.getList(paging, pm);
	}

}
