package vn.edu.hcmuaf.fit.project.DAO.dao;


import vn.edu.hcmuaf.fit.project.DAO.model.orderDetail;
import vn.edu.hcmuaf.fit.project.DAO.db.DBConnect;

import java.sql.*;

public class OrderDetailDAO {
    private static OrderDetailDAO instance;

    private OrderDetailDAO() {}

    public static OrderDetailDAO getInstance() {
        if (instance == null) {
            instance = new OrderDetailDAO();
        }
        return instance;
    }

    /**
     * Lưu chi tiết đơn hàng vào CSDL và trả về mã chi tiết đơn hàng được tạo (order_detail_id)
     */
    public int insertOrderDetail(orderDetail detail) {
        int generatedId = 0;
        String sql = "INSERT INTO order_details (order_id, product_id, quantity, price, guarantee) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = DBConnect.makeConnect();
             PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            // Lấy mã đơn hàng từ đối tượng Order
            ps.setInt(1, detail.getOrderID().getOrderId());
            // Lấy mã sản phẩm từ đối tượng Product (giả sử có phương thức getProductId())
            ps.setInt(2, detail.getProductID().getId());
            ps.setDouble(3, detail.getQuantity());
            ps.setDouble(4, detail.getPrice());
            ps.setString(5, detail.getGuarantee());
            ps.executeUpdate();

            // Lấy mã chi tiết đơn hàng được tạo
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                generatedId = rs.getInt(1);
                detail.setOrderDetailID(generatedId);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return generatedId;
    }
}
