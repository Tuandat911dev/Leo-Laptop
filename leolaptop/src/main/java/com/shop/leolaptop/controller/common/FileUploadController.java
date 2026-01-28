package com.shop.leolaptop.controller.common;

import com.shop.leolaptop.constant.ImageFolder;
import com.shop.leolaptop.domain.User;
import com.shop.leolaptop.service.common.FileUploadService;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.util.Map;

@Controller
@RequiredArgsConstructor
@FieldDefaults(makeFinal = true, level = AccessLevel.PRIVATE)
@RequestMapping("/upload")
public class FileUploadController {
    FileUploadService fileUploadService;

    @PostMapping("/file")
    @ResponseBody
    public ResponseEntity<Map<String, String>> uploadSingleFile(
            @RequestParam("file") MultipartFile file,
            @RequestParam("folder") ImageFolder folder) {

        String fileName = fileUploadService.handleUploadSingleFile(file, folder);

        if (fileName != null) {
            return ResponseEntity.ok(Map.of(
                    "success", "true",
                    "fileName", fileName
            ));
        } else {
            return ResponseEntity.badRequest().body(Map.of(
                    "success", "false",
                    "message", "Upload failed!"
            ));
        }
    }
}
