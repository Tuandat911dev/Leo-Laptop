package com.shop.leolaptop.controller.admin;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/products")
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class ProductController {

    @GetMapping
    public String getProductPage(Model model) {
        model.addAttribute("contentPage", "/WEB-INF/view/admin/product/table.jsp");
        return "/admin/layout/layout";
    }
    @GetMapping("/create")
    public String getCreateProductPage(Model model) {
        model.addAttribute("contentPage", "/WEB-INF/view/admin/product/create.jsp");
        model.addAttribute("newProduct", new RequestProductDTO());

        return "/admin/layout/layout";
    }

    @PostMapping("/create")
    public String createNewProduct(@ModelAttribute("newProduct") RequestProductDTO newProduct,
                                   @RequestParam("productFile") MultipartFile img) {

        productService.createNewProduct(newProduct, img);

        return "redirect:/admin/products";
    }
}
