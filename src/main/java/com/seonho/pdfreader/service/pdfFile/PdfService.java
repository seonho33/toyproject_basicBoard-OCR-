package com.seonho.pdfreader.service.pdfFile;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.server.ResponseStatusException;

import com.seonho.pdfreader.dto.PdfResponseDTO;

public interface PdfService {

    //PDF 파일에서 텍스트를 추출하는 메서드
    String extractText(MultipartFile pdfFile, String fileName);

    //받은 파일 이름을 안전하게 처리하는 메서드
    String resolveFileName(String fileName);

    //PDF 파일의 요청 유효성 검증메서드
    void validatePdfFile(MultipartFile[] pdfFile) throws ResponseStatusException;

    //PDF 파일 형식 검증 메서드
    void validatePdfFormat(MultipartFile pdfFile, String fileName) throws ResponseStatusException;

    //PDF 파일에서 텍스트를 추출하고 결과를 반환하는 메서드
    List<PdfResponseDTO> extractTextFromPdf(MultipartFile[] pdfFile) throws IOException, ResponseStatusException;

}