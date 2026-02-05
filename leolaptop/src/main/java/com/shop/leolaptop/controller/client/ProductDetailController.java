package com.shop.leolaptop.controller.client;

import com.shop.leolaptop.dto.product.ResponseProductDTO;
import com.shop.leolaptop.service.admin.ProductService;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
@FieldDefaults(makeFinal = true, level = AccessLevel.PRIVATE)
@RequestMapping("/product")
public class ProductDetailController {
    ProductService productService;

    @GetMapping("/{productId}")
    public String getProductDetailPage(@PathVariable("productId") long productId, Model model) {
        ResponseProductDTO product = productService.getProductById(productId);
        List<ResponseProductDTO> productList = productService.getAllProduct();
        model.addAttribute("productList", productList);
        model.addAttribute("contentPage", "/WEB-INF/view/client/page/productDetail.jsp");
        model.addAttribute("product", product);

        return "client/layout/clientLayout";
    }
}
