package service.adminService;

import java.util.List;

import dao.adminDao.QnaListDao;
import dao.adminDao.QnaListDaoImpl;
import dto.Qna;
import dto.adminDto.QnaManage;
import util.Paging;

public class QnaListServiceImpl implements QnaListService {
	QnaListDao dao = new QnaListDaoImpl();
	
	@Override
	public List getQnaList(Paging paging, QnaManage qm) {
		return dao.getList(paging, qm);
	}

	@Override
	public void editQnaData(QnaManage qm) {
		if(qm.getEditQna().equals("updateQna")) {
			dao.updateQna(qm);
		}else if(qm.getEditQna().equals("deleteQna")) {
			dao.deleteQna(qm);
		}
	}

	@Override
	public List<Qna> getUserList(Paging paging, QnaManage qm, String mem_id) {
		
		return dao.getUserList(paging, qm, mem_id);
	}
	
	

}
