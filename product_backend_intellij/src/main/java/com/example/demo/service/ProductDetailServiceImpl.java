package com.example.demo.service;

import com.example.demo.mapper.ProductDetailMapper;
import com.example.demo.vo.CartVO;
import com.example.demo.vo.ProductDetailVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductDetailServiceImpl implements ProductDetailService {

    @Autowired
    ProductDetailMapper productMapper;

    //상품 정보 모두 출력
    @Override
    public List<ProductDetailVO> productDetail(int id) {
        return productMapper.productDetail(id);
    }

    //장바구니 저장
    @Override
    public void insertCart(CartVO cart) {
        productMapper.insertCart(cart);
    }


}
