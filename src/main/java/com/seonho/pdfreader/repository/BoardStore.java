package com.seonho.pdfreader.repository;

import java.time.LocalDateTime;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.seonho.pdfreader.vo.BoardVO;

@Repository
public class BoardStore {

    private final Map<Long, BoardVO> boardMap = new HashMap<>();
    private long boardNo = 1L;

    // 게시물 저장 메서드
    public Long save(BoardVO boardVO){

        boardVO.setBoardNo(boardNo++);
        boardVO.setBoardRegDate(LocalDateTime.now());
        boardMap.put(boardVO.getBoardNo(),boardVO);

        return boardVO.getBoardNo();
    }

    // 모든 게시물 가져오는 메서드
    public List<BoardVO> getList(){
        
        return boardMap.values().stream()
                .sorted(Comparator.comparing(BoardVO::getBoardNo).reversed()).toList();
    }

    // Comparator 를 override 할 경우
    // public class BoardNoDescComparator implements Comparator<BoardVO>{

    //     @Override
    //     public int compare(BoardVO o1, BoardVO o2) {
            
    //         return o2.getBoardNo().compareTo(o1.getBoardNo());
    //     }
    // }

    //특정 게시물 가져오는 메서드
    public BoardVO getBoard(Long boardNo){

        return boardMap.get(boardNo);
    }
}