package vn.edu.hcmuaf.fit.project.Service;
import vn.edu.hcmuaf.fit.project.DAO.dao.cartDAO;
import vn.edu.hcmuaf.fit.project.DAO.model.cartShopping;
import java.util.List;

public class CartShoppingService {
    private final cartDAO cartDao;

    public CartShoppingService() {
        this.cartDao = new cartDAO();
    }

    public List<cartShopping> getAllCartItems() {
        return cartDao.getCartItemList();
    }

    public void addCartItem(cartShopping item) {
        cartDao.addCartItem(item);
    }

    public void removeCartItem(int cartId) {
        cartDao.removeCartItem(cartId);
    }

    public void updateCartItemQuantity(int cartId, int newQuantity) {
        cartDao.updateCartItemQuantity(cartId, newQuantity);
    }


}
