<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>PDF Reader</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f5f6f8;
            margin: 0;
            padding: 40px;
        }

        .container {
            width: 700px;
            margin: 0 auto;
            background: white;
            padding: 30px;
            border: 1px solid #ddd;
            border-radius: 8px;
        }

        h1 {
            margin-top: 0;
            text-align: center;
        }

        .upload-box {
            border: 1px solid #ccc;
            padding: 20px;
            margin-bottom: 25px;
        }

        .file-name {
            margin-top: 10px;
            color: #555;
            font-size: 14px;
        }

        button {
            margin-top: 15px;
            padding: 10px 20px;
            cursor: pointer;
        }

        textarea {
            width: 100%;
            height: 300px;
            resize: vertical;
            padding: 10px;
            box-sizing: border-box;
        }

        .label {
            font-weight: bold;
            margin-bottom: 8px;
            display: block;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>PDF Reader</h1>

    <div class="upload-box">
        <label class="label">PDF 업로드</label>

        <input type="file" id="pdfFile" accept=".pdf" multiple>

        <div class="file-name" id="fileName">
            선택된 파일 없음
        </div>

        <button type="button" id="uploadBtn">
            업로드
        </button>
    </div>

    <div style="margin-bottom:10px;">
        <button type="button" id="prevBtn">← 이전</button>
        <span id="pdfIndex">0 / 0</span>
        <button type="button" id="nextBtn">다음 →</button>
    </div>

    <div class="file-name" id="currentPdfName">
        PDF 없음
    </div>

    <div>
        <label class="label">추출 결과</label>
        <textarea id="resultText" readonly placeholder="PDF에서 추출된 텍스트가 여기에 표시됩니다."></textarea>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<script>
    $(function(){

        let pdfResults = []
        let currentIndex = 0;
        
        function renderPdfResult() {
            if (pdfResults.length > 0) {
                $("#resultText").val(pdfResults[currentIndex].text);
                $("#currentPdfName").text(pdfResults[currentIndex].originalFileName);
                $("#pdfIndex").text((currentIndex + 1) + " / " + pdfResults.length);
            } else {
                $("#resultText").val("");
                $("#currentPdfName").text("PDF 없음");
                $("#pdfIndex").text("0 / 0");
            }
        }

    let keyTimer = null;
    let pressedKey = null;

    function prevPdf() {
        if (currentIndex > 0) {
            currentIndex--;
            renderPdfResult();
        }
    }

    function nextPdf() {
        if (currentIndex < pdfResults.length - 1) {
            currentIndex++;
            renderPdfResult();
        }
    }

    $("#prevBtn").on("click", function(){
        prevPdf();
    });

    $("#nextBtn").on("click", function(){
        nextPdf();
    });

let keyDelayTimer = null;

function moveByKey(key) {
    if (key === "ArrowLeft") {
        prevPdf();
    }

    if (key === "ArrowRight") {
        nextPdf();
    }
}

$(document).on("keydown", function(event){

    if (event.key !== "ArrowLeft" && event.key !== "ArrowRight") {
        return;
    }

    event.preventDefault();

    if (pressedKey === event.key) {
        return;
    }

    pressedKey = event.key;

    moveByKey(event.key);

    keyDelayTimer = setTimeout(function(){

        keyTimer = setInterval(function(){
            moveByKey(pressedKey);
        }, 200);

    }, 500);
});

$(document).on("keyup", function(event){

    if (event.key !== pressedKey) {
        return;
    }

    clearTimeout(keyDelayTimer);
    clearInterval(keyTimer);

    keyDelayTimer = null;
    keyTimer = null;
    pressedKey = null;
});

        $("#pdfFile").on("change",function(){
            if ($("#pdfFile")[0].files.length > 0){
                $("#fileName").text($("#pdfFile")[0].files[0].name);
            } else {
                $("#fileName").text("선택된 파일 없음");
            }
        })

        $("#uploadBtn").on("click",function(){

            const files = $("#pdfFile")[0].files;

            if(!files.length){
                alert("파일을 선택해주세요");
                return;
            }

            const formData = new FormData();
            
            for(let i = 0; i <files.length; i++){
                formData.append("pdfFiles",files[i]);
            }

            $.ajax({
                url: "/pdf/upload",
                type: "POST",
                data: formData,
                processData: false,
                contentType: false,
                success: function(res){
                    pdfResults = res;
                    currentIndex = 0;
                    renderPdfResult();
                },
                error: function(xhr){
                    console.error(xhr);
                    alert("업로드 중 오류가 발생했습니다.");
                }
            });
        });

});
</script>

</body>
</html>