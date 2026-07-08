package com.seonho.pdfreader.service.member;

import java.util.Optional;

import com.seonho.pdfreader.vo.MemberVO;

public interface MemberService {
    
    public boolean existsByUserId(String userId);

    public boolean saveUser(MemberVO memberDto);

    public Optional<MemberVO> login(String userId, String userPassword);
}
