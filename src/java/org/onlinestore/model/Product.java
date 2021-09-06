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
public class Product {

    private int productID;
    private String productname;
    private Double oldprice;
    private Double newprice;
    private int unit;
    private String description;
    private int mainCategoryID;
    private int categoryID;         
    private String image;

    public int getMainCategoryID() {
        return mainCategoryID;
    }

    public void setMainCategoryID(int mainCategoryID) {
        this.mainCategoryID = mainCategoryID;
    }

   
    public int getUnit() {
        return unit;
    }

    public void setUnit(int unit) {
        this.unit = unit;
    }

    public Double getOldprice() {
        return oldprice;
    }

    public void setOldprice(Double oldprice) {
        this.oldprice = oldprice;
    }

    public Double getNewprice() {
        return newprice;
    }

    public void setNewprice(Double newprice) {
        this.newprice = newprice;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getProductname() {
        return productname;
    }

    public void setProductname(String productname) {
        this.productname = productname;
    }

   
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

}
