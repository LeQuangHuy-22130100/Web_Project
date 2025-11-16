package vn.edu.hcmuaf.fit.project.DAO.model;

import java.util.Date;

public class review {
    private int reviewId;
    private Product productID;
    private User userID;
    private String comments;
    private Date date;

    public int getReviewId() {
        return reviewId;
    }

    public void setReviewId(int reviewId) {
        this.reviewId = reviewId;
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

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "review{" +
                "reviewId=" + reviewId +
                ", productID=" + productID +
                ", userID=" + userID +
                ", comments='" + comments + '\'' +
                ", date=" + date +
                '}';
    }
}
