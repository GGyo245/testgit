package kr.co.fifa.Controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.fifa.DAO.UserDAO;
import kr.co.fifa.VO.UserVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping(value="/user")
public class UserController {
	
	@Autowired
	UserDAO dao;
	
	@RequestMapping(value="/joinForm", method = RequestMethod.GET)
	public String joinForm() {
		log.info("move to joinForm");
		
		return "join";
	}
	
	@RequestMapping(value="/join", method = RequestMethod.POST)
	public String join(UserVO user) {
		
		log.info("join 요청");
		
		int fg = dao.insertUser(user);
		
		if(fg != 0) {
			log.info("join 요청 성공");
			return "redirect:/user/loginForm";
		}else {
			log.info("join 요청 실패");
			return "redirect:/user/joinForm";
		}
		
	}
	@RequestMapping(value = "/loginForm", method = RequestMethod.GET)
	public String loginForm() {
		log.info("move to loginForm");
		
		return "login";
	}
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(Model model, UserVO user, HttpSession session) {
		
		log.info("login 요청");
		log.info("입력받은 이메일 : "+user.getEmail());
		log.info("입력받은 비밀번호 : "+user.getPw());
		
		UserVO userdb = dao.selectUserOne(user);
		String errMsg = "이메일 또는 비밀번호를 다시 확인해주세요.";
		
		
		if(userdb != null) {
			log.info("일치하는 ID 확인");
			if(userdb.getPw().equals(user.getPw())) {
				log.info("비밀번호 일치 로그인 성공");
				session.setAttribute("loginId", userdb.getEmail());
				session.setAttribute("loginNick", userdb.getNick());
				
				return "redirect:/";
			}else {
				log.info("비밀번호 불일치 로그인 실패");
			}
		}else {
			log.info("DB에 존재하지 않는 ID");
			
		}
		model.addAttribute("errMsg", errMsg);
		return "login";
	}
	@GetMapping("logout")
	public String logout(HttpSession session) {
		log.info("logout 요청");
		session.removeAttribute("loginId");
		session.removeAttribute("loginNick");
		return "home";
	}
	@GetMapping("myPage")
	public String myPage(Model model, HttpSession session) {
		
		log.info("move to mypage");
		
		String email = (String) session.getAttribute("loginId");
		UserVO user = new UserVO();
		user = dao.selectUserBasic(email);
		
		model.addAttribute("user", user);
		
		return "/user/mypage";
	}
	@RequestMapping(value="/updateUser", method=RequestMethod.POST)
	public String updateUser(UserVO user, HttpSession session) {
		
		log.info("userUpdate 실행");
		
		int fg = dao.updateUser(user);
		
		if(fg != 0) {
			session.removeAttribute("loginNick");
			session.setAttribute("loginNick", user.getNick());
			log.info("userUpdate 실행 성공");
			return "redirect:/";
		}else {
			log.info("userUpdate 실행 실패");
			return "/user/mypage";
		}
		
	}
	@GetMapping("/deleteUserCheck")
	public String deleteUserCheck() {
		
		log.info("move to deleteUser");
		
		return "/user/deleteUser";
	}
	@RequestMapping(value="/deleteUser", method=RequestMethod.POST)
	@ResponseBody
	public boolean deleteUser(UserVO user, HttpSession session) {
		
		UserVO userCk = dao.selectUserOne(user);
		
		if(userCk != null) {
			log.info("일치하는 ID 확인");
			if(userCk.getPw().equals(user.getPw())) {
				log.info("PW 일치 확인! 탈퇴를 시작합니다.");
				session.removeAttribute("loginId");
				session.removeAttribute("loginNick");
				dao.deleteUser(user);
				
				return true;
			}else {
				log.info("PW 불일치! 요청실패");
			}
		}else {
			log.info("DB에 존재하지 않는 ID 잘못된 접근");
		}
		
		return false; 
	}
}






