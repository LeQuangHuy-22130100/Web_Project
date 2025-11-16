package vn.edu.hcmuaf.fit.project.DAO.model;

public class Sizes {
    private int sizeID;
    private String size;

    public Sizes() {}

    public Sizes(int sizeID, String size) {
        this.sizeID = sizeID;
        this.size = size;
    }

    public int getSizeID() {
        return sizeID;
    }

    public void setSizeID(int sizeID) {
        this.sizeID = sizeID;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    @Override
    public String toString() {
        return "Sizes{" +
                "sizeID=" + sizeID +
                ", size='" + size + '\'' +
                '}';
    }
}
