package com.seonho.pdfreader.vo;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardVO {
    private Long boardNo;
    private String boardTitle;
    private String boardWriter;
    private String boardContent;
    private LocalDateTime boardRegDate;
    private LocalDateTime boardUpdDate;
    private List<PdfVO> boardPdfList = new ArrayList<>();
}
