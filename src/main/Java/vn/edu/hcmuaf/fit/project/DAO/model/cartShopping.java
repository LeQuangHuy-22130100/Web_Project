package vn.edu.hcmuaf.fit.project.DAO.model;

import java.io.Serializable;

public class cartShopping implements Serializable {
    private int cartId;
    private Product productID;
    private User userID;
    private double quanlity;
    private String name;
    private String image;

    public cartShopping() {}

    public cartShopping(Product product, int quanlity) {
        this.productID = product;
        this.quanlity = quanlity;
    }

    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
    }

    public Product getProductID() {
        return productID;
    }

    public void setProductID(Product productID) {
        this.productID = productID;
    }

    public User getUserID() {
        return userID;
    }

    public void setUserID(User userID) {
        this.userID = userID;
    }

    public double getQuanlity() {
        return quanlity;
    }

    public void setQuanlity(double quanlity) {
        this.quanlity = quanlity;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return "cartShopping{" +
                "cartId=" + cartId +
                ", productID=" + productID +
                ", userID=" + userID +
                ", quantity=" + quanlity +
                ", name='" + name + '\'' +
                ", image='" + image + '\'' +
                '}';
    }

//    public void setProductId(Product product) {
//        this.productID = product;
//    }

    public void addQuanlity(int quanlity){
        this.quanlity+=quanlity;
    }

    public double getTotalPrice(){
        return this.quanlity*this.productID.getPrice();
    }
}
