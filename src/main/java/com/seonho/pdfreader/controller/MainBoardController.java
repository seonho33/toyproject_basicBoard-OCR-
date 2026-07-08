package com.seonho.pdfreader.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.seonho.pdfreader.service.member.BoardService;
import com.seonho.pdfreader.vo.BoardVO;
import com.seonho.pdfreader.vo.MemberVO;
import com.seonho.pdfreader.vo.PageVO;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;



@Controller
@RequestMapping("/board")
@RequiredArgsConstructor
public class MainBoardController {

    private final BoardService boardService;

    @GetMapping("/main")
    public String BoardMain(
        @RequestParam(defaultValue = "1") int currentPage
        , Model model
    ) {

        PageVO<BoardVO> pageVO = boardService.pageList(currentPage);

        model.addAttribute("pageVO",pageVO);

        return "main";
    }
    
    @GetMapping("/list")
    @ResponseBody
    public PageVO<BoardVO> boardList(
        @RequestParam(defaultValue = "1") int currentPage
    ){ 
        return boardService.pageList(currentPage);
    }

    @GetMapping("/write")
    public String getMethodName() {
        return "board/boardRegist";
    }

    @PostMapping("/write")
    public String wirteBoard(
        BoardVO boardVO
        , HttpSession session
        , MultipartFile[] boardPdfList
    ) {
        
        MemberVO member = (MemberVO)session.getAttribute("member");
        if(member==null){
            return "redirect:/board/list";
        }

        
        boardVO.setBoardWriter(member.getUserId());

        boardService.saveBoard(boardVO,boardPdfList);
        
        return "redirect:/board/detail/"+boardVO.getBoardNo();
    }

    @GetMapping("/detail/{boardNo}")
    public String boardDetail(
        @PathVariable Long boardNo
        , Model model
    ) {
        BoardVO boardVO = boardService.getBoardVO(boardNo);

        model.addAttribute("boardVO",boardVO);

        return "board/detail";
    }
    
    
}