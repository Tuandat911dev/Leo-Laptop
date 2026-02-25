package com.shop.leolaptop.controller.client;

import com.shop.leolaptop.domain.Product;
import com.shop.leolaptop.dto.product.ProductCriteriaDTO;
import com.shop.leolaptop.dto.product.ResponseProductDTO;
import com.shop.leolaptop.mapper.ProductMapper;
import com.shop.leolaptop.service.admin.ProductService;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
@FieldDefaults(makeFinal = true, level = AccessLevel.PRIVATE)
@RequestMapping("/shop")
public class ShopController {
    ProductService productService;
    ProductMapper productMapper;

    @GetMapping
    public String getShopPage(Model model,
                              ProductCriteriaDTO productCriteriaDTO
    ) {
        Page<Product> products = productService.getProductsWithSpec(productCriteriaDTO);
        List<ResponseProductDTO> productList = products.getContent().stream()
                .map(productMapper::productToResponseProductDto)
                .toList();

        model.addAttribute("productList", productList);
        model.addAttribute("totalPages", products.getTotalPages());
        model.addAttribute("page", products.getNumber() + 1);
        model.addAttribute("contentPage", "/WEB-INF/view/client/page/shop.jsp");

        return "client/layout/clientLayout";
    }
}
