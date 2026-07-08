package com.seonho.pdfreader.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PdfVO {
    private String fileName;
    private String originalFileName;
    private Long fileNo;
    private String filePath;
    private String text;
}
