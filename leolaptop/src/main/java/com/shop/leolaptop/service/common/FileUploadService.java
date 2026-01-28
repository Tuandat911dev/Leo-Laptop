package com.shop.leolaptop.service.common;

import com.shop.leolaptop.constant.ImageFolder;
import jakarta.servlet.ServletContext;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;

@Slf4j
@Service
@RequiredArgsConstructor
@FieldDefaults(makeFinal = true, level = AccessLevel.PRIVATE)
public class FileUploadService {
    ServletContext servletContext;

    public String handleUploadSingleFile(MultipartFile file, ImageFolder folderName) {
        try {
            byte[] bytes = file.getBytes();
            String rootPath = this.servletContext.getRealPath("/resources/images");
            File dir = new File(rootPath + File.separator + folderName);
            if (!dir.exists()) {
                dir.mkdirs();
            }
            File serverFile = new File(dir.getAbsolutePath() + File.separator +
                    System.currentTimeMillis() + "-" + file.getOriginalFilename());
            BufferedOutputStream stream = new BufferedOutputStream(
                    new FileOutputStream(serverFile));
            stream.write(bytes);
            stream.close();

            return serverFile.getName();
        } catch (Exception e) {
            log.error(e.getMessage());
        }

        return null;
    }
}
