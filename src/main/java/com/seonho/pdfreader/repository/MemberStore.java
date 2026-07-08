package com.seonho.pdfreader.repository;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

import org.springframework.stereotype.Repository;

import com.seonho.pdfreader.vo.MemberVO;

@Repository
public class MemberStore {
    
    private final Map<String,MemberVO> memberList = new HashMap<>();
    private long sequenceId = 1L;

    // 유저 저장 메서드
    public boolean save(MemberVO memberDTO){
        
        memberDTO.setSequenceId(sequenceId++);
        memberList.put(memberDTO.getUserId(), memberDTO);

        return true;
    }

    // 중복 id 체크
    public boolean existsByUserId(String userId){

        return memberList.containsKey(userId);
    }

    // userId로 회원정보 가져오기
    public Optional<MemberVO> findByUserId(String userId){
        
        return Optional.ofNullable(memberList.get(userId));
    }

    // sequenceId로 회원정보 가져오기
    public Optional<MemberVO> findBySequenceId(Long sequenceId){

        return memberList.values()
                .stream()
                .filter(member -> member.getSequenceId().equals(sequenceId))
                .findFirst();
    }

}
