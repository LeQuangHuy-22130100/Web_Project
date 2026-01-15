package vn.edu.hcmuaf.fit.project.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.SneakyThrows;
import vn.edu.hcmuaf.fit.project.DAO.dao.cartDAO;
import vn.edu.hcmuaf.fit.project.DAO.model.Product;
import vn.edu.hcmuaf.fit.project.DAO.model.cartShopping;
import vn.edu.hcmuaf.fit.project.Service.CartShoppingService;
import vn.edu.hcmuaf.fit.project.Service.ProductService;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "CartShopping", value = "/CartShopping")
public class CartShoppingControl extends HttpServlet {
    private final CartShoppingService cartService = new CartShoppingService();
    private final ProductService productService = new ProductService();

    @SneakyThrows
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<cartShopping> cartItems = cartService.getAllCartItems();
        request.setAttribute("cartItems", cartItems);
        request.getRequestDispatcher("CartShopping.jsp").forward(request, response);
    }

    @SneakyThrows
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            response.sendRedirect("CartShopping.jsp");
            return;
        }

        switch (action) {
            case "add":
                addCartItem(request);
                break;
            case "remove":
                removeCartItem(request);
                break;
            case "update":
                updateCartItem(request);
                break;
        }
        response.sendRedirect("CartShopping");
    }

    private void addCartItem(HttpServletRequest request) throws SQLException, ClassNotFoundException {
        String productId = request.getParameter("productId");
        String quantityParam = request.getParameter("quantity"); // Lấy số lượng từ request
        int quantity = 1; // Giá trị mặc định nếu không có tham số quantity

        // Kiểm tra và chuyển đổi tham số quantity
        try {
            if (quantityParam != null && !quantityParam.isEmpty()) {
                quantity = Integer.parseInt(quantityParam);
            }
        } catch (NumberFormatException e) {
            System.out.println("Số lượng không hợp lệ, đặt về mặc định là 1");
        }

        // Tìm sản phẩm theo ID
        Product product = productService.findById(productId);

        // Ghi log để kiểm tra trạng thái product
        if (product == null) {
            System.out.println("Sản phẩm không tồn tại với ID: " + productId);
            return; // Nếu sản phẩm null, dừng lại
        }

        System.out.println("Đã tìm thấy sản phẩm: " + product.getName());

        // Tạo đối tượng cartShopping với số lượng linh hoạt
        cartShopping cartItem = new cartShopping(product, quantity);

        // Thêm sản phẩm vào giỏ hàng
        cartService.addCartItem(cartItem);
    }



    private void removeCartItem(HttpServletRequest request) {
        int productId = Integer.parseInt(request.getParameter("productId"));
        cartService.removeCartItem(productId);
    }

    private void updateCartItem(HttpServletRequest request) {
        int productId = Integer.parseInt(request.getParameter("productId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        cartService.updateCartItemQuantity(productId, quantity);
    }
}
