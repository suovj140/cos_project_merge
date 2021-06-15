package com.example.demo.vo;

import lombok.Data;

@Data
public class CartVO {
    private int cart_id;
    private String user_email;
    private int product_seq;
    private int amount;
}
