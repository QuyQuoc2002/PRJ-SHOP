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
 * @author Shado
 */
@Builder
@Getter
@Setter
@ToString
public class OrderDetail {
    private int id;
    private int idOrder;
    private int idProduct;
    private String nameProduct;
    private int priceProduct;
    private int size;
    private int quantity;
    private int discount;
    private long total;
}
