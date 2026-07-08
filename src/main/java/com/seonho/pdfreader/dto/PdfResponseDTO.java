package com.seonho.pdfreader.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PdfResponseDTO {

    private String fileName;
    private String originalFileName;
    private String text;

    public PdfResponseDTO(String fileName, String originalFileName, String text) {
        this.fileName = fileName;
        this.originalFileName = originalFileName;
        this.text = text;
    }
}
