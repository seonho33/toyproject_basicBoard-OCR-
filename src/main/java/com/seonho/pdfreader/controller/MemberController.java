package com.seonho.pdfreader.controller;

import java.util.Optional;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.seonho.pdfreader.service.member.MemberServiceImpl;
import com.seonho.pdfreader.vo.MemberVO;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@Controller
@RequiredArgsConstructor
@RequestMapping("/member")
@Slf4j
public class MemberController {
    
    private final MemberServiceImpl memberService;

    @GetMapping("/login")
    public String loginForm() {
        return "member/login";
    }

    @PostMapping("/login")
    public String login(@RequestParam String userId,
                        @RequestParam String userPassword,
                        HttpSession session,
                        RedirectAttributes redirectAttributes){
        log.info("login 메서드 실행##");
        Optional<MemberVO> member = memberService.login(userId, userPassword);
        
        // 로그인 실패
        if(member.isEmpty()){
            redirectAttributes.addFlashAttribute("errorMessage","아이디 혹은 비밀번호가 일치하지 않습니다.");
            return "redirect:/member/login";
        }
        // 로그인 성공
        else{
            session.setAttribute("member", member.get());
            return "redirect:/board/main";
        }
    }

    @GetMapping("/register")
    public String register(){
        return "member/register";
    }

    @PostMapping("/register")
    @ResponseBody
    public ResponseEntity<String> register(MemberVO memberDTO) {

        try{
            if(!memberService.saveUser(memberDTO)){
                return ResponseEntity
                        .badRequest()
                        .body("이미 사용중인 아이디입니다.");
            };

            return ResponseEntity.ok("회원가입이 완료되었습니다.");

        } catch (Exception e){
            e.printStackTrace();

            return ResponseEntity
                    .internalServerError()
                    .body("회원가입 처리 중 서버 오류가 발생했습니다.");
        }
    }

    @GetMapping("/checkedId")
    @ResponseBody
    public boolean checkedId(@RequestParam String userId){
        return memberService.existsByUserId(userId);
    } 

}
