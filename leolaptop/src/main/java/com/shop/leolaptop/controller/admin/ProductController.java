package com.shop.leolaptop.controller.admin;

import com.shop.leolaptop.domain.Product;
import com.shop.leolaptop.dto.product.RequestProductDTO;
import com.shop.leolaptop.dto.product.ResponseProductDTO;
import com.shop.leolaptop.dto.product.UpdateProductDTO;
import com.shop.leolaptop.mapper.ProductMapper;
import com.shop.leolaptop.service.admin.ProductService;
import jakarta.validation.Valid;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/admin/products")
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class ProductController {
    ProductService productService;
    ProductMapper productMapper;

    @GetMapping
    public String getProductPage(Model model, @RequestParam("page") Optional<String> optionalPage) {
        model.addAttribute("contentPage", "/WEB-INF/view/admin/product/table.jsp");
        int page = 1;
        try {
            if(optionalPage.isPresent()) {
                page = Integer.parseInt(optionalPage.get());
            }
        } catch (Exception ignored) {
        }

        Page<Product> products = productService.getAllProductWithPaginate(page);
        List<ResponseProductDTO> productList = products.getContent().stream()
                .map(productMapper::productToResponseProductDto)
                .toList();
        model.addAttribute("totalPages", products.getTotalPages());
        model.addAttribute("page", products.getNumber() + 1);
        model.addAttribute("productList", productList);

        return "admin/layout/layout";
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

        return "admin/layout/layout";
    }

    @PostMapping("/create")
    public String createNewProduct(@ModelAttribute("newProduct") @Valid RequestProductDTO newProduct,
                                   BindingResult bindingResult,
                                   @RequestParam("productFile") MultipartFile img,
                                   Model model) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("contentPage", "/WEB-INF/view/admin/product/create.jsp");
            return "admin/layout/layout";
        }
        productService.createNewProduct(newProduct, img);

        return "redirect:/admin/products";
    }

    @GetMapping("/update/{id}")
    public String getUpdateProductPage(Model model, @PathVariable("id") long id) {
        ResponseProductDTO product = productService.getProductById(id);
        UpdateProductDTO currentProduct = productMapper.responseProductToUpdateProduct(product);
        model.addAttribute("contentPage", "/WEB-INF/view/admin/product/update.jsp");
        model.addAttribute("currentProduct", currentProduct);

        return "admin/layout/layout";
    }

    @PostMapping("/update/{id}")
    public String updateProduct(@ModelAttribute("currentProduct") @Valid UpdateProductDTO currentProduct,
                                BindingResult bindingResult,
                                @RequestParam("productFile") MultipartFile img,
                                @PathVariable("id") long id,
                                Model model) {

        if (bindingResult.hasErrors()) {
            model.addAttribute("contentPage", "/WEB-INF/view/admin/product/update.jsp");
            ResponseProductDTO product = productService.getProductById(id);
            UpdateProductDTO updateProductDTO = productMapper.responseProductToUpdateProduct(product);
            currentProduct.setImage(updateProductDTO.getImage());

            return "admin/layout/layout";
        }
        productService.updateProduct(currentProduct, id, img);

        return "redirect:/admin/products";
    }

    @DeleteMapping("/delete/{id}")
    @ResponseBody
    public ResponseEntity<String> deleteProduct(@PathVariable long id) {
        productService.deleteProduct(id);
        return ResponseEntity.ok("deleted");
    }
}
