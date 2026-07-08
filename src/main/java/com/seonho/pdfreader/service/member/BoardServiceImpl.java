package com.seonho.pdfreader.service.member;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.server.ResponseStatusException;

import com.seonho.pdfreader.repository.BoardStore;
import com.seonho.pdfreader.vo.BoardVO;
import com.seonho.pdfreader.vo.PageVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService {

    private final BoardStore boardStore;


    @Override
    public PageVO<BoardVO> pageList(int currentPage) {
        
        List<BoardVO> allList = boardStore.getList();

        PageVO<BoardVO> pageVO = new PageVO<>();
        pageVO.calculate(currentPage, allList.size());

        List<BoardVO> pageList = List.of();

        if(!allList.isEmpty()){
            pageList = allList.subList(
                pageVO.getStartIndex()
                ,pageVO.getEndIndex()
            );
        }
        
        pageVO.setItemList(pageList);

        return pageVO;
    }


    @Override
    public Long saveBoard(
        BoardVO boardVO
        , MultipartFile[] boardPdfList
    ) {

        return boardStore.save(boardVO);
    }

    @Override
    public BoardVO getBoardVO(Long boardNo) {

        BoardVO boardVO = boardStore.getBoard(boardNo);

        if(boardVO == null){
            throw new ResponseStatusException(
                HttpStatus.NOT_FOUND,
                "존재하지 않는 게시글 입니다."
            );
        }

        return boardVO;
    }

}
