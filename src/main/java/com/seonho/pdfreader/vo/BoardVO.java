package com.seonho.pdfreader.vo;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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
    private List<AttachFileVO> boardFileList = new ArrayList<>();

    public String getFormattedRegDate(){
        
        if(boardRegDate == null){
            return "";
        }

        LocalDate toDay = LocalDate.now();
        if(toDay.equals(boardRegDate.toLocalDate())){
            return boardRegDate.format(
                DateTimeFormatter.ofPattern("HH:mm")
            );
        }

        return boardRegDate.format(
            DateTimeFormatter.ofPattern("yy.MM.dd")
        );
    }
}
