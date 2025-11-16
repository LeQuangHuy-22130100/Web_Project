package vn.edu.hcmuaf.fit.project.DAO.dao;

import vn.edu.hcmuaf.fit.project.DAO.model.Product;
import vn.edu.hcmuaf.fit.project.DAO.model.cartShopping;
import java.util.ArrayList;
import java.util.List;
import java.util.ArrayList;

public class cartDAO {
    private List<cartShopping> cartItemList;

    public cartDAO() {
        this.cartItemList = new ArrayList<>();
    }

    public  void addCartItem(cartShopping cartItem){
        for (cartShopping cartitem : cartItemList){
            if(cartitem.getProductID().getId()==cartItem.getProductID().getId()){
                cartitem.addQuanlity(1);
                return;
            }
        }
        this.cartItemList.add(cartItem);
    }
    public void removeCartItem(int  id){
        for(cartShopping c :cartItemList){
            if(c.getProductID().getId()==id){
                cartItemList.remove(c);
                return;
            }
        }
    }
    public void updateCartItemQuantity(int id, int quanlity){
        for(cartShopping c : cartItemList){
            if(c.getProductID().getId()==id){
                c.setQuanlity(quanlity);
                return;
            }
        }
    }
    public int getSize(){
        int re= 0;
        for (cartShopping c:cartItemList){
            re +=c.getQuanlity();
        }
        return re;
    }
    public List<cartShopping> getCartItemList(){
        return this.cartItemList;
    }

    public double getTotalPrice() {
        double re = 0;
        for(cartShopping c: cartItemList){
            re+=c.getTotalPrice();
        }
        return  re;
    }
}
