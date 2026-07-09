package com.seonho.pdfreader.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.seonho.pdfreader.dto.PdfResponseDTO;
import com.seonho.pdfreader.service.pdfFile.PdfService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;



@Controller
@RequiredArgsConstructor
@Slf4j
public class PdfController {

    private final PdfService pdfService;

    @GetMapping("/")
    public String main(){
        return "redirect:/board/main";
    }

    @PostMapping("/pdf/upload")
    @ResponseBody
    public List<PdfResponseDTO> uploadPdf(@RequestParam("pdfFiles") MultipartFile[] pdfFiles) throws IOException {
        log.info("## file upload 실행 ##");

        List<PdfResponseDTO> responseList = pdfService.extractTextFromPdf(pdfFiles);

        return responseList;
    }
}