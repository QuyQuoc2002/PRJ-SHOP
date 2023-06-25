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
 * @author Shado
 */
@Builder
@Getter
@Setter
@ToString
public class Order {
    private int id;
    private String nameContact;
    private String phoneContact;
    private String address;
    private int idAccountDetail;
    private Date orderDate;
    private Date expectedDate;
    private Date doneDate;
    private int idStatus;
    private long total;
}
