/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 *
 * @author DELL
 */
@Builder
@Getter
@Setter
@ToString
public class Product {
    private int productId;
    private String productName;
    private String productImg;
    private int productPrice;
    private String productDescription;
    private int categoryId;
    private boolean productIsFeatured;
    private boolean productIsRecent;
    private boolean productDeleted;
}
