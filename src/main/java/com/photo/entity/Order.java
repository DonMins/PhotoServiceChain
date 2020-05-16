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

    @ManyToMany(cascade = CascadeType.ALL)
    @JoinTable(
            name = "ORDER_USERS",
            joinColumns = { @JoinColumn(name = "id_user") },
            inverseJoinColumns = { @JoinColumn(name = "id_order") }
    )
    private List<User> usersField;

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
    private boolean status;

    public Order(){}

    public List<User> getUsers() {
        return usersField;
    }

    public void setUsers(List<User> users) {
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

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
}
