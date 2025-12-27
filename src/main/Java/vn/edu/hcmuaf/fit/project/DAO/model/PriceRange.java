package vn.edu.hcmuaf.fit.project.DAO.model;

public class PriceRange {
    private int priceID;
    private String priceMin;
    private String priceMax;

    public PriceRange(){}

    public PriceRange(int priceID, String priceMin, String priceMax) {
        this.priceID = priceID;
        this.priceMin = priceMin;
        this.priceMax = priceMax;
    }

    public int getPriceID() {
        return priceID;
    }

    public void setPriceID(int priceID) {
        this.priceID = priceID;
    }

    public String getPriceMin() {
        return priceMin;
    }

    public void setPriceMin(String priceMin) {
        this.priceMin = priceMin;
    }

    public String getPriceMax() {
        return priceMax;
    }

    public void setPriceMax(String priceMax) {
        this.priceMax = priceMax;
    }

    @Override
    public String toString() {
        return "PriceRange{" +
                "priceID=" + priceID +
                ", priceMin='" + priceMin + '\'' +
                ", priceMax='" + priceMax + '\'' +
                '}';
    }
}
