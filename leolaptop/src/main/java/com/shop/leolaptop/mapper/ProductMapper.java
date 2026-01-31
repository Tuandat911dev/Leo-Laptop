package com.shop.leolaptop.mapper;

import com.shop.leolaptop.domain.Product;
import com.shop.leolaptop.dto.product.RequestProductDTO;
import com.shop.leolaptop.dto.product.ResponseProductDTO;
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
}
