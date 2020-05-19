package com.photo.entity;

import javax.persistence.*;
import java.awt.*;
import java.lang.reflect.Array;
import java.util.List;
import java.util.Set;

/**
 * Simple JavaBean domain object that represents a Order.
 *
 * @author Zdornov Maxim
 * @version 1.0
 */

@Entity
@Table(name = "orders")
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @ManyToOne(fetch = FetchType.EAGER)
    private User usersField;

    @Column(name = "typePhoto")
    private String typePhoto;

    @Column(name = "sizePhoto")
    private String sizePhoto;

    @Column(name = "total")
    private String total;

    @Column(name = "comment")
    private String comment;

    @Column(name = "linkOnPhoto")
    private String linkOnPhoto;

    @Column(name = "status")
    private String status;

    public Order() {
    }

    public Order(User usersField, String typePhoto, String sizePhoto,
                 String total, String comment, String linkOnPhoto, String status) {
        this.usersField = usersField;
        this.typePhoto = typePhoto;
        this.sizePhoto = sizePhoto;
        this.total = total;
        this.comment = comment;
        this.linkOnPhoto = linkOnPhoto;
        this.status = status;
    }

    public User getUsers() {
        return usersField;
    }

    public void setUsers(User users) {
        this.usersField = users;
    }

    public String getTypePhoto() {
        return typePhoto;
    }

    public void setTypePhoto(String typePhoto) {
        this.typePhoto = typePhoto;
    }

    public String getSizePhoto() {
        return sizePhoto;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setSizePhoto(String sizePhoto) {
        this.sizePhoto = sizePhoto;
    }

    public String getTotal() {
        return total;
    }

    public void setTotal(String total) {
        this.total = total;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getLinkOnPhoto() {
        return linkOnPhoto;
    }

    public void setLinkOnPhoto(String linkOnPhoto) {
        this.linkOnPhoto = linkOnPhoto;
    }

    public String isStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
