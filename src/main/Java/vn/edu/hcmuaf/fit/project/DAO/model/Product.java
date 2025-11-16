package vn.edu.hcmuaf.fit.project.DAO.model;

public class Product {
    private int Id;
    private categories categoryID;
    private String name;
    private String image;
    private double price;
    private String description;
    private int stock;
    private String matarial;
    private Sizes sizeID;

    public Product(){}

    public Product(int Id, categories categoryID, String name, String image, double price, String description, int stock, String matarial, Sizes sizeID) {
        this.Id = Id;
        this.categoryID = categoryID;
        this.name = name;
        this.image = image;
        this.price = price;
        this.description = description;
        this.stock = stock;
        this.matarial = matarial;
        this.sizeID = sizeID;
    }

    public Sizes getSizeID() {
        return sizeID;
    }

    public void setSizeID(Sizes sizeID) {
        this.sizeID = sizeID;
    }

    public int getId() {
        return Id;
    }

    public void setId(int id) {
        this.Id = id;
    }

    public categories getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(categories categoryID) {
        this.categoryID = categoryID;
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

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getMatarial() {
        return matarial;
    }

    public void setMatarial(String matarial) {
        this.matarial = matarial;
    }

    public Sizes getSize() {
        return sizeID;
    }

    public void setSize(Sizes sizeID) {
        this.sizeID = sizeID;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + Id +
                ", categoryID=" + categoryID +
                ", name='" + name + '\'' +
                ", image='" + image + '\'' +
                ", price=" + price +
                ", description='" + description + '\'' +
                ", stock=" + stock +
                ", matarial='" + matarial + '\'' +
                ", size='" + sizeID + '\'' +
                '}';
    }
}
