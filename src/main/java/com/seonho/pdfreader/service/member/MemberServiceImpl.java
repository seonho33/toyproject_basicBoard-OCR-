package com.seonho.pdfreader.service.member;

import java.util.Optional;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.seonho.pdfreader.repository.MemberStore;
import com.seonho.pdfreader.vo.MemberVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {
    
    private final MemberStore memberStore;

    //회원가입
    @Override
    public boolean saveUser(MemberVO memberDto) {

        if(memberStore.existsByUserId(memberDto.getUserId())
            || !StringUtils.hasText(memberDto.getUserId())
            || !StringUtils.hasText(memberDto.getUserPassword())){
            return false;
        }

        return memberStore.save(memberDto);
    }

    //아이디 중복확인
    @Override
    public boolean existsByUserId(String userId) {
        return memberStore.existsByUserId(userId);
    }

    //로그인
    @Override
    public Optional<MemberVO> login(String userId, String userPassword) {
        
        return memberStore.findByUserId(userId)
                .filter(member -> member.getUserPassword().equals(userPassword));
    
    }

}
