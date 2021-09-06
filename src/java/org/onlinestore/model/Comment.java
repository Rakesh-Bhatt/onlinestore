/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.onlinestore.model;

/**
 *
 * @author CIT
 */
public class Comment {
    private int CommentID;
     private int productID;
     private String name;
     private String email;
     private String comment;

    public int getCommentID() {
        return CommentID;
    }

    public void setCommentID(int CommentID) {
        this.CommentID = CommentID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }
    
}
