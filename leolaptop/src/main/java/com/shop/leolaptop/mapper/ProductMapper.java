package com.shop.leolaptop.mapper;

import com.shop.leolaptop.domain.Product;
import com.shop.leolaptop.dto.product.RequestProductDTO;
import com.shop.leolaptop.dto.product.ResponseProductDTO;
import com.shop.leolaptop.dto.product.UpdateProductDTO;
import org.springframework.stereotype.Component;

@Component
public class ProductMapper {
    public Product requestProductDtoToProduct(RequestProductDTO productDTO) {
        return Product.builder()
                .name(productDTO.getName())
                .price(productDTO.getPrice())
                .detailDesc(productDTO.getDetailDesc())
                .shortDesc(productDTO.getShortDesc())
                .quantity(productDTO.getQuantity())
                .sold(productDTO.getSold())
                .factory(productDTO.getFactory())
                .target(productDTO.getTarget())
                .build();
    }

    public ResponseProductDTO productToResponseProductDto(Product product) {
        return ResponseProductDTO.builder()
                .id(product.getId())
                .name(product.getName())
                .price(product.getPrice())
                .detailDesc(product.getDetailDesc())
                .shortDesc(product.getShortDesc())
                .quantity(product.getQuantity())
                .sold(product.getSold())
                .factory(product.getFactory())
                .target(product.getTarget())
                .image(product.getImage())
                .build();
    }

    public UpdateProductDTO responseProductToUpdateProduct(ResponseProductDTO responseProductDTO) {
        return UpdateProductDTO.builder()
                .id(responseProductDTO.getId())
                .name(responseProductDTO.getName())
                .price(responseProductDTO.getPrice())
                .detailDesc(responseProductDTO.getDetailDesc())
                .shortDesc(responseProductDTO.getShortDesc())
                .quantity(responseProductDTO.getQuantity())
                .factory(responseProductDTO.getFactory())
                .target(responseProductDTO.getTarget())
                .image(responseProductDTO.getImage())
                .build();
    }

    public Product updateProductDtoToProduct(UpdateProductDTO updateProductDTO) {
        return Product.builder()
                .name(updateProductDTO.getName())
                .price(updateProductDTO.getPrice())
                .detailDesc(updateProductDTO.getDetailDesc())
                .shortDesc(updateProductDTO.getShortDesc())
                .quantity(updateProductDTO.getQuantity())
                .factory(updateProductDTO.getFactory())
                .target(updateProductDTO.getTarget())
                .build();
    }
}
