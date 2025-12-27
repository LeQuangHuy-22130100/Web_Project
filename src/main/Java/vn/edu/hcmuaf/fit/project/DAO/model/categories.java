package vn.edu.hcmuaf.fit.project.DAO.model;

public class categories {
    private int categoryId;
    private String name;

    public categories(){

    }

    public categories(int categoryId, String name) {
        this.categoryId = categoryId;
        this.name = name;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public String getName() {
        return name;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "categories{" +
                "categoryId=" + categoryId +
                ", name='" + name + '\'' +
                '}';
    }
}
