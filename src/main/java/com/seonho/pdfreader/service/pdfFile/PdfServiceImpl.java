package com.seonho.pdfreader.service.pdfFile;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.apache.pdfbox.Loader;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.text.PDFTextStripper;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.server.ResponseStatusException;

import com.seonho.pdfreader.dto.PdfResponseDTO;
import com.seonho.pdfreader.vo.PdfVO;

@Service
public class PdfServiceImpl implements PdfService{


    @Override
    public List<PdfResponseDTO> extractTextFromPdf(MultipartFile[] pdfFile)
        throws IOException, ResponseStatusException {
            
            // 요청 유효성 검증 메서드
            validatePdfFile(pdfFile);
            
            List<PdfResponseDTO> result = new ArrayList<>();
            for (MultipartFile file : pdfFile){
                String originalFileName = resolveFileName(file.getOriginalFilename());

                validatePdfFormat(file,originalFileName);
                String text = extractText(file,originalFileName);

                String fileName = UUID.randomUUID().toString() + ".pdf";

                result.add(new PdfResponseDTO(fileName, originalFileName, text));
            }


            return result;
    }   


    /**
     * PDF 파일에서 텍스트를 추출하는 메서드
     * @param pdfFile PDF 파일
     * @param fileName 파일 이름
     * @return 추출된 텍스트
     */
@Override
public String extractText(MultipartFile pdfFile, String fileName) {

    try {
        File tempFile = File.createTempFile("upload-", ".pdf");

        pdfFile.transferTo(tempFile);

        try (PDDocument document = Loader.loadPDF(tempFile)) {
            PDFTextStripper textStripper = new PDFTextStripper();

            textStripper.setStartPage(1);
            textStripper.setEndPage(1);

            return textStripper.getText(document);
        } finally {
            tempFile.delete();
        }

    } catch (IOException e) {
        throw new ResponseStatusException(
                HttpStatus.BAD_REQUEST,
                fileName + " 파일에서 텍스트를 추출하는 중 오류가 발생했습니다."
        );
    }
}

    /**
     * 받은 파일 이름을 안전하게 처리하는 메서드
     * @param fileName 파일 이름
     * @return 안전한 파일 이름
     */
    @Override
    public String resolveFileName(String fileName) {

        String newFileName = fileName;

        // 파일 이름이 ".."를 포함하는 경우, 경로 탐색 공격을 방지하기 위해 예외를 발생시킵니다.
        if (fileName.contains("..")){
            newFileName = fileName.replace("..","");
        }

        // 파일 이름이 null이거나 비어있는 경우 unNamed.pdf로 설정합니다.
        if (newFileName == null || newFileName.isEmpty()){
            newFileName = "unNamed.pdf";
        }

        String safeFileName = StringUtils.cleanPath(newFileName);

        return safeFileName;
    }

    /**
     * PDF 요청 유효성을 검증하는 메서드
     * @param pdfFile PDF 파일 배열
     * @throws ResponseStatusException 유효성 검증 실패 시 발생
     */
    @Override
    public void validatePdfFile(MultipartFile[] pdfFile) throws ResponseStatusException {
        
         if (pdfFile == null || pdfFile.length == 0) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "PDF 파일이 업로드되지 않았습니다.");
         }
    }

    /**
     * PDF 파일 형식을 검증하는 메서드
     * @param pdfFile PDF 파일
     * @param fileName 파일 이름
     * @throws ResponseStatusException 형식 검증 실패 시 발생
     */
    @Override
    public void validatePdfFormat(MultipartFile pdfFile, String fileName) throws ResponseStatusException {
        
        if(!fileName.toLowerCase().endsWith(".pdf")){
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, fileName + " 파일이 pdf 형식이 아닙니다.");
        }

        String contentType = pdfFile.getContentType();

        if(contentType != null
            && !"application/pdf".equals(contentType)
            && !"application/octet-stream".equals(contentType)){
                throw new ResponseStatusException(HttpStatus.BAD_REQUEST, fileName + " 파일이 pdf 형식이 아닙니다.");
            }
    }

    public PdfVO saveAndExtractPdf(MultipartFile pdfFile) {
    String originalFileName = resolveFileName(pdfFile.getOriginalFilename());

    validatePdfFormat(pdfFile, originalFileName);

    String fileName = UUID.randomUUID() + ".pdf";

    File uploadDir = new File("C:/Dev/workspace/pdfreader/uploads");
    if (!uploadDir.exists()) {
        uploadDir.mkdirs();
    }

    File savedFile = new File(uploadDir, fileName);

    try {
        pdfFile.transferTo(savedFile);

        String text;
        try (PDDocument document = Loader.loadPDF(savedFile)) {
            PDFTextStripper textStripper = new PDFTextStripper();
            text = textStripper.getText(document);
        }

        PdfVO pdfVO = new PdfVO();
        pdfVO.setFileName(fileName);
        pdfVO.setOriginalFileName(originalFileName);
        pdfVO.setFilePath(savedFile.getAbsolutePath());
        pdfVO.setText(text);

        return pdfVO;

    } catch (IOException e) {
        throw new ResponseStatusException(
                HttpStatus.BAD_REQUEST,
                originalFileName + " 파일 처리 중 오류가 발생했습니다."
        );
    }
}



}