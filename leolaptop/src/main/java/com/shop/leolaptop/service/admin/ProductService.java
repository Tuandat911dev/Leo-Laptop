package com.shop.leolaptop.service.admin;

import com.shop.leolaptop.constant.ImageFolder;
import com.shop.leolaptop.domain.Product;
import com.shop.leolaptop.dto.product.RequestProductDTO;
import com.shop.leolaptop.dto.product.ResponseProductDTO;
import com.shop.leolaptop.mapper.ProductMapper;
import com.shop.leolaptop.repository.ProductRepository;
import com.shop.leolaptop.service.common.FileUploadService;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Objects;

@Service
@RequiredArgsConstructor
@FieldDefaults(makeFinal = true, level = AccessLevel.PRIVATE)
public class ProductService {
    ProductRepository productRepository;
    ProductMapper productMapper;
    FileUploadService fileUploadService;
    String DEFAULT_IMAGE = "default-product.png";

    public void createNewProduct(RequestProductDTO productDTO, MultipartFile img) {
        Product newProduct = productMapper.requestProductDtoToProduct(productDTO);
        newProduct.setSold(0);
        if(Objects.equals(img.getOriginalFilename(), "")) {
            newProduct.setImage(DEFAULT_IMAGE);
        } else {
            newProduct.setImage(fileUploadService.handleUploadSingleFile(img, ImageFolder.product));
        }

        productRepository.save(newProduct);
    }

    public List<ResponseProductDTO> getAllProduct() {
        List<Product> products = productRepository.findAll();

        return products.stream()
                .map(productMapper::productToResponseProductDto)
                .toList();
    }

    public ResponseProductDTO getProductById(long id) {
        Product product = productRepository.findById(id).orElseThrow(() -> new RuntimeException("Product Not Found"));

        return productMapper.productToResponseProductDto(product);
    }
}
