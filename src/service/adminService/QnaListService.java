package service.adminService;

import java.util.List;

import dto.Qna;
import dto.adminDto.QnaManage;
import util.Paging;

public interface QnaListService {

	public List<Qna> getQnaList(Paging paging, QnaManage qm);
	
	public List<Qna> getUserList(Paging paging, QnaManage qm, String mem_id);

	public void editQnaData(QnaManage qm);

}

