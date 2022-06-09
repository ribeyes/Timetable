package egovframework.example.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import egovframework.example.service.TimetableService;
import net.sf.json.JSONObject;


/* ModelAndView 데이터를 JSP에서 json 방식으로 받는다 */ 
@Controller
public class TestController {
	
	@Resource(name="timetableService")
	private TimetableService timetableService;
	 
	@RequestMapping(value="/test.do") 
	public String testPage() throws Exception { 
		return "test";
	}
	
	//json 표시 화면
	@RequestMapping(value="/json.do", method=RequestMethod.GET) 
	public ModelAndView inputStartPage() throws Exception { 
		ModelAndView mav = new ModelAndView("jsonView");
		List<Map> semesterModel = timetableService.getSemester(); //학기 테이블 semester 열 값
		List<Map> weekModel = timetableService.getWeek(); // 요일 테이블 값들
		List<Map> timeModel = timetableService.getTime(); // 시간 테이블 값들
		List<Map> subjectModel = timetableService.getSubject(); // 과목 테이블 값들
		
		//각 테이블 값들을 jsp에 표시하기 위해 객체들을 addObject에 넣는다.
		mav.addObject("semester", semesterModel);
		mav.addObject("week", weekModel);
		mav.addObject("time", timeModel);
		mav.addObject("subject", subjectModel);
		return mav;
	}
}
