package egovframework.example.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.mapper.Mapper;


@Mapper("boardMapper")
@Repository
public class TimetableDAO{
	
	@Autowired
	@Resource(name="sqlSession")
	private SqlSession query;
	
	
	public List<Map> getSemester() { // 학기 테이블에서 학기(sem) 열 데이터 조회
		return query.selectList("getSemester");
	}

	public List<Map> getWeek() { // 요일 테이블에서 요일(day_kr) 열 데이터 조회
		return query.selectList("getWeek");
	}
	
	public List<Map> getTime() { // 시간 테이블에서 시간(time_nm) 열 데이터 조회
		return query.selectList("getTime");
	}

	public List<Map> getSubject() { // 과목 테이블에서 과목(sbjt_nm) 열 데이터 조회
		return query.selectList("getSubject");
	}
	
}
