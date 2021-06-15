package com.example.demo.service;

import com.example.demo.vo.CartVO;
import com.example.demo.vo.ProductDetailVO;

import java.util.List;

public interface ProductDetailService {

    //상품 정보 모두 출력
    public List<ProductDetailVO> productDetail(int id);

    //장바구니 저장
    public void insertCart(CartVO cart);

}
