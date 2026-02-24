package com.shop.leolaptop.controller.client;

import com.shop.leolaptop.domain.Product;
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
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Optional;

@Controller
@RequiredArgsConstructor
@FieldDefaults(makeFinal = true, level = AccessLevel.PRIVATE)
@RequestMapping("/shop")
public class ShopController {
    ProductService productService;
    ProductMapper productMapper;

    @GetMapping
    public String getShopPage(Model model,
                              @RequestParam("page") Optional<String> optionalPage,
                              @RequestParam("name") Optional<String> optionalName,
                              @RequestParam("minPrice") Optional<String> optionalMinPrice,
                              @RequestParam("maxPrice") Optional<String> optionalMaxPrice,
                              @RequestParam("factory") Optional<String> optionalFactory,
                              @RequestParam("price") Optional<String> optionalPrice
    ) {
        int page = 1;
        String name = "";
        double minPrice = 0;
        double maxPrice = 0;
        String factory = "";
        String price = "";
        try {
            if (optionalPage.isPresent()) {
                page = Integer.parseInt(optionalPage.get());
            }
        } catch (Exception ignore) {
        }

        if (optionalName.isPresent()) {
            name = optionalName.get();
        }

        if (optionalFactory.isPresent()) {
            factory = optionalFactory.get();
        }

        if (optionalPrice.isPresent()) {
            price = optionalPrice.get();
        }

        try {
            if (optionalMinPrice.isPresent()) {
                minPrice = Double.parseDouble(optionalMinPrice.get());
            }
        } catch (Exception ignore) {
        }

        try {
            if (optionalMaxPrice.isPresent()) {
                maxPrice = Double.parseDouble(optionalMaxPrice.get());
            }
        } catch (Exception ignore) {
        }

        Page<Product> products = productService.getProductsWithSpec(page, name, minPrice, maxPrice, factory, price);
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
