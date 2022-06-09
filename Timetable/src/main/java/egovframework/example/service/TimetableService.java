package egovframework.example.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.dao.TimetableDAO;

@Service
public class TimetableService{

	@Resource
    private TimetableDAO timetableDAO;
    
    public List<Map> getSemester() {  // 학기 테이블
    	return timetableDAO.getSemester();
    }

	public List<Map> getWeek() {  // 요일 테이블
		return timetableDAO.getWeek();
	}

	public List<Map> getTime() {  // 시간 테이블
		return timetableDAO.getTime();
	}
	
	public List<Map> getSubject() {  // 과목 테이블
		return timetableDAO.getSubject();
	}
}
