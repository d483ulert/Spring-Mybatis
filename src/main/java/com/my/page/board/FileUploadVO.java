package com.my.page.board;
import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

@Data
public class FileUploadVO{
    private String attachPath; //이미지가 저장될 경로

    private String Filename; //파일이름

    private MultipartFile upload;

    private String CKEditorFuncNum;//CKEditor가 이미지 첨부할때 보내는 데이터
                                    //꼭 대소문자 저렇게 구분해서 줘야 modelAttribute가 인식해서 받아줌 

}