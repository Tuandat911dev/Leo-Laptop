package com.shop.leolaptop.controller.admin;

import com.shop.leolaptop.dto.product.RequestProductDTO;
import com.shop.leolaptop.dto.product.ResponseProductDTO;
import com.shop.leolaptop.dto.product.UpdateProductDTO;
import com.shop.leolaptop.mapper.ProductMapper;
import com.shop.leolaptop.service.admin.ProductService;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Controller
@RequestMapping("/admin/products")
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class ProductController {
    ProductService productService;
    ProductMapper productMapper;

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

    @GetMapping("/update/{id}")
    public String getUpdateProductPage(Model model, @PathVariable("id") long id) {
        ResponseProductDTO product = productService.getProductById(id);
        UpdateProductDTO currentProduct = productMapper.responseProductToUpdateProduct(product);
        model.addAttribute("contentPage", "/WEB-INF/view/admin/product/update.jsp");
        model.addAttribute("currentProduct", currentProduct);

        return "/admin/layout/layout";
    }

    @PostMapping("/update/{id}")
    public String updateProduct(@ModelAttribute("currentProduct") UpdateProductDTO currentProduct,
                                @RequestParam("productFile") MultipartFile img, @PathVariable("id") long id) {

        productService.updateProduct(currentProduct, id, img);

        return "redirect:/admin/products";
    }
}
