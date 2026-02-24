package com.shop.leolaptop.service.specification;

import com.shop.leolaptop.domain.Product;
import com.shop.leolaptop.domain.specification.Filter;
import com.shop.leolaptop.repository.ProductRepository;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

import static com.shop.leolaptop.constant.QueryOperator.*;

@Service
@RequiredArgsConstructor
@FieldDefaults(makeFinal = true, level = AccessLevel.PRIVATE)
public class ProductSpec {
    ProductRepository productRepository;

    private Object castToRequiredType(Class fieldType, String value) {
        if (fieldType.isAssignableFrom(Double.class)) {
            return Double.valueOf(value);
        } else if (fieldType.isAssignableFrom(Integer.class)) {
            return Integer.valueOf(value);
        } else if (Enum.class.isAssignableFrom(fieldType)) {
            return Enum.valueOf(fieldType, value);
        }
        return value;
    }

    private Object castToRequiredType(Class fieldType, List<String> value) {
        List<Object> lists = new ArrayList<>();
        for (String s : value) {
            lists.add(castToRequiredType(fieldType, s));
        }
        return lists;
    }

    private Specification<Product> createSpecification(Filter input) {
        if (input.getOperator().equals(EQUALS)) {
            return (root, query, criteriaBuilder) ->
                    criteriaBuilder.equal(root.get(input.getField()),
                            castToRequiredType(root.get(input.getField()).getJavaType(),
                                    input.getValue()));
        } else if (input.getOperator().equals(NOT_EQUALS)) {
            return (root, query, criteriaBuilder) ->
                    criteriaBuilder.notEqual(root.get(input.getField()),
                            castToRequiredType(root.get(input.getField()).getJavaType(),
                                    input.getValue()));
        } else if (input.getOperator().equals(GREATER_THAN)) {
            return (root, query, criteriaBuilder) ->
                    criteriaBuilder.gt(root.get(input.getField()),
                            (Number) castToRequiredType(
                                    root.get(input.getField()).getJavaType(),
                                    input.getValue()));
        } else if (input.getOperator().equals(LESS_THAN)) {
            return (root, query, criteriaBuilder) ->
                    criteriaBuilder.lt(root.get(input.getField()),
                            (Number) castToRequiredType(
                                    root.get(input.getField()).getJavaType(),
                                    input.getValue()));
        } else if (input.getOperator().equals(LIKE)) {
            return (root, query, criteriaBuilder) ->
                    criteriaBuilder.like(root.get(input.getField()),
                            "%" + input.getValue() + "%");
        } else if (input.getOperator().equals(IN)) {
            return (root, query, criteriaBuilder) ->
                    criteriaBuilder.in(root.get(input.getField()))
                            .value(castToRequiredType(
                                    root.get(input.getField()).getJavaType(),
                                    input.getValues()));
        }
        throw new RuntimeException("Operation not supported yet");
    }

    private Specification<Product> getSpecificationFromFilters(List<Filter> filter) {
        Specification<Product> specification = Specification.unrestricted();
        for (Filter input : filter) {
            specification = specification.and(createSpecification(input));
        }
        return specification;
    }

    public Page<Product> getQueryResult(List<Filter> filters, Pageable pageable) {
        if (!filters.isEmpty()) {
            return productRepository.findAll(getSpecificationFromFilters(filters), pageable);
        } else {
            return productRepository.findAll(pageable);
        }
    }
}
