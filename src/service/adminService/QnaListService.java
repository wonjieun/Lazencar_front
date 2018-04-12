package service.adminService;

import java.util.List;

import dto.Qna;
import dto.adminDto.QnaManage;
import util.Paging;

public interface QnaListService {

	public List<Qna> getQnaList(Paging paging, QnaManage qm);

	public void editQnaData(QnaManage qm);
}

