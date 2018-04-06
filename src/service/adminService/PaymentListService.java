package service.adminService;

import java.util.List;

import dto.Payment;
import dto.adminDto.PaymentManage;
import util.Paging;

public interface PaymentListService {

	List<Payment> getPaymentList(Paging paging, PaymentManage pm);

}
