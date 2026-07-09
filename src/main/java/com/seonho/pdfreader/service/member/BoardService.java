package com.seonho.pdfreader.service.member;

import org.springframework.web.multipart.MultipartFile;

import com.seonho.pdfreader.vo.BoardVO;
import com.seonho.pdfreader.vo.PageVO;

public interface BoardService {
    public PageVO<BoardVO> pageList(int page);

    public Long saveBoard(BoardVO boardVO, MultipartFile[] attachFiles);

    public BoardVO getBoardVO(Long boardNo);
}
