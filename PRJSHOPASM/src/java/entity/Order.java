/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.sql.Date;
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
public class Order {
    private int orderId;
    private Account account;
    private Date orderCreateDate;
    private Date orderExpectedDate;
    private Date orderDoneDate;
    private String orderNameContact;
    private String orderPhoneContact; 
    private String orderAddressContact;
    private int orderStatusId;
    
}