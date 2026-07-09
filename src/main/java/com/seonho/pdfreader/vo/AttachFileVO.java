package com.seonho.pdfreader.vo;

import java.time.LocalDateTime;

import lombok.Getter;
import lombok.Setter;

/**
 * AttachFileVO
 */
@Getter
@Setter
public class AttachFileVO {

    private String fileNo;
    private String fileName;
    private String originalFileName;
    private String savePath;
    private LocalDateTime regDate;
}