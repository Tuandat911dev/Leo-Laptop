package com.shop.leolaptop.service.admin;

import com.shop.leolaptop.constant.ImageFolder;
import com.shop.leolaptop.constant.QueryOperator;
import com.shop.leolaptop.constant.SortProduct;
import com.shop.leolaptop.domain.Product;
import com.shop.leolaptop.domain.Product_;
import com.shop.leolaptop.domain.specification.Filter;
import com.shop.leolaptop.dto.product.ProductCriteriaDTO;
import com.shop.leolaptop.dto.product.RequestProductDTO;
import com.shop.leolaptop.dto.product.ResponseProductDTO;
import com.shop.leolaptop.dto.product.UpdateProductDTO;
import com.shop.leolaptop.mapper.ProductMapper;
import com.shop.leolaptop.repository.ProductRepository;
import com.shop.leolaptop.service.common.FileUploadService;
import com.shop.leolaptop.service.specification.ProductSpec;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.Arrays;
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
    ProductSpec productSpec;

    public void createNewProduct(RequestProductDTO productDTO, MultipartFile img) {
        Product newProduct = productMapper.requestProductDtoToProduct(productDTO);
        newProduct.setSold(0);
        if (Objects.equals(img.getOriginalFilename(), "")) {
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

    public Page<Product> getAllProductWithPaginate(int page) {
        PageRequest pageRequest = PageRequest.of(page - 1, 5);

        return productRepository.findAll(pageRequest);
    }

    public boolean isNumeric(String strNum) {
        if (strNum == null) {
            return false;
        }
        try {
            double d = Double.parseDouble(strNum);
        } catch (NumberFormatException ignored) {
            return false;
        }
        return true;
    }

    public Page<Product> getProductsWithSpec(ProductCriteriaDTO productCriteriaDTO) {
        String name = "";
        double minPrice = 0;
        double maxPrice = 0;
        String factories = "";
        String targets = "";
        String priceRange = "";
        String sort = "";
        int page = 1;

        try {
            if (productCriteriaDTO.getPage() != null && productCriteriaDTO.getPage().isPresent()) {
                page = Integer.parseInt(productCriteriaDTO.getPage().get());
            }
        } catch (Exception ignore) {
        }

        if (productCriteriaDTO.getSort() != null && productCriteriaDTO.getSort().isPresent()) {
            sort = productCriteriaDTO.getSort().get();
        }

        if (productCriteriaDTO.getName() != null && productCriteriaDTO.getName().isPresent()) {
            name = productCriteriaDTO.getName().get();
        }

        if (productCriteriaDTO.getFactory() != null && productCriteriaDTO.getFactory().isPresent()) {
            factories = productCriteriaDTO.getFactory().get();
        }

        if (productCriteriaDTO.getTarget() != null && productCriteriaDTO.getTarget().isPresent()) {
            targets = productCriteriaDTO.getTarget().get();
        }

        if (productCriteriaDTO.getPrice() != null && productCriteriaDTO.getPrice().isPresent()) {
            priceRange = productCriteriaDTO.getPrice().get();
        }

        try {
            if (productCriteriaDTO.getMinPrice() != null && productCriteriaDTO.getMinPrice().isPresent()) {
                minPrice = Double.parseDouble(productCriteriaDTO.getMinPrice().get());
            }
        } catch (Exception ignore) {
        }

        try {
            if (productCriteriaDTO.getMaxPrice() != null && productCriteriaDTO.getMaxPrice().isPresent()) {
                maxPrice = Double.parseDouble(productCriteriaDTO.getMaxPrice().get());
            }
        } catch (Exception ignore) {
        }

        PageRequest pageRequest = null;
        if (!sort.isEmpty()) {
            pageRequest = switch (sort) {
                case SortProduct.PRICE_DESC -> PageRequest.of(page - 1, 5, Sort.by(Product_.PRICE).descending());
                case SortProduct.PRICE_ASC -> PageRequest.of(page - 1, 5, Sort.by(Product_.PRICE).ascending());
                case SortProduct.NEW -> PageRequest.of(page - 1, 5, Sort.by(Product_.ID).descending());
                case SortProduct.SOLD -> PageRequest.of(page - 1, 5, Sort.by(Product_.SOLD).descending());
                default -> PageRequest.of(page - 1, 5);
            };
        } else {
            pageRequest = PageRequest.of(page - 1, 5);
        }

        List<Filter> filters = new ArrayList<>();

        if (!name.trim().isEmpty()) {
            filters.add(Filter.builder()
                    .field(Product_.NAME)
                    .operator(QueryOperator.LIKE)
                    .value(name)
                    .build());
        }

        if (minPrice != 0) {
            filters.add(Filter.builder()
                    .field(Product_.PRICE)
                    .operator(QueryOperator.GREATER_THAN)
                    .value(String.valueOf(minPrice))
                    .build());
        }

        if (maxPrice != 0) {
            filters.add(Filter.builder()
                    .field(Product_.PRICE)
                    .operator(QueryOperator.LESS_THAN)
                    .value(String.valueOf(maxPrice))
                    .build());
        }

        if (!factories.isEmpty()) {
            List<String> factoryList = Arrays.asList(factories.split(","));
            filters.add(Filter.builder()
                    .field(Product_.FACTORY)
                    .operator(QueryOperator.IN)
                    .values(factoryList)
                    .build());
        }

        if (!targets.isEmpty()) {
            List<String> targetList = Arrays.asList(targets.split(","));
            filters.add(Filter.builder()
                    .field(Product_.TARGET)
                    .operator(QueryOperator.IN)
                    .values(targetList)
                    .build());
        }

        if (priceRange.contains("-")) {
            String[] parts = priceRange.split("-");
            for (int i = 0; i < parts.length; i++) {
                if (i == 0) {
                    filters.add(Filter.builder().field(Product_.PRICE).operator(QueryOperator.GREATER_THAN).value(parts[i] + "000000").build());
                } else {
                    if (isNumeric(parts[i])) {
                        filters.add(Filter.builder().field(Product_.PRICE).operator(QueryOperator.LESS_THAN).value(parts[i] + "000000").build());
                    }
                }
            }
        }

        return productSpec.getQueryResult(filters, pageRequest);
    }

    public ResponseProductDTO getProductById(long id) {
        Product product = productRepository.findById(id).orElseThrow(() -> new RuntimeException("Product Not Found"));

        return productMapper.productToResponseProductDto(product);
    }

    public void updateProduct(UpdateProductDTO updateProductDTO, long id, MultipartFile img) {
        Product currentProduct = productRepository.findById(id).orElseThrow(() -> new RuntimeException("Product Not " +
                "Found"));

        Product updateProduct = productMapper.updateProductDtoToProduct(updateProductDTO);
        updateProduct.setId(id);
        if (Objects.equals(img.getOriginalFilename(), "")) {
            updateProduct.setImage(currentProduct.getImage());
        } else {
            updateProduct.setImage(fileUploadService.handleUploadSingleFile(img, ImageFolder.product));
        }

        productRepository.save(updateProduct);
    }

    public void deleteProduct(long id) {
        Product currentProduct = productRepository.findById(id).orElseThrow(() -> new RuntimeException("Product Not " +
                "Found"));

        productRepository.delete(currentProduct);
    }
}
