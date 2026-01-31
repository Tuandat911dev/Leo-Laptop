package com.shop.leolaptop.controller.admin;

import com.shop.leolaptop.domain.Product;
import com.shop.leolaptop.dto.product.RequestProductDTO;
import com.shop.leolaptop.dto.product.ResponseProductDTO;
import com.shop.leolaptop.service.admin.ProductService;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/admin/products")
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class ProductController {
    ProductService productService;

    @GetMapping
    public String getProductPage(Model model) {
        model.addAttribute("contentPage", "/WEB-INF/view/admin/product/table.jsp");
        List<ResponseProductDTO> productList = productService.getAllProduct();

        model.addAttribute("productList", productList);

        return "/admin/layout/layout";
    }

    @GetMapping("/{id}")
    @ResponseBody
    public ResponseEntity<ResponseProductDTO> getProductById(@PathVariable("id") long id) {
        ResponseProductDTO product = productService.getProductById(id);

        return ResponseEntity.ok(product);
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
