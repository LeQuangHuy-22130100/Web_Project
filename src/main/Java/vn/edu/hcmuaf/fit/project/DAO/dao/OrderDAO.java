package vn.edu.hcmuaf.fit.project.DAO.dao;


import vn.edu.hcmuaf.fit.project.DAO.model.Order;
import vn.edu.hcmuaf.fit.project.DAO.model.User;
import vn.edu.hcmuaf.fit.project.DAO.db.DBConnect;

import java.sql.*;

public class OrderDAO {
    private static OrderDAO instance;

    private OrderDAO() {}

    public static OrderDAO getInstance() {
        if (instance == null) {
            instance = new OrderDAO();
        }
        return instance;
    }

    /**
     * Lưu đơn hàng vào CSDL và trả về mã đơn hàng được tạo (order_id).
     */
    public int insertOrder(Order order) {
        int generatedId = 0;
        String sql = "INSERT INTO orders (user_id, order_date, status, total_amount) VALUES (?, ?, ?, ?)";
        try (Connection conn = DBConnect.get().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            // Giả sử đối tượng User có phương thức getUserId()
            ps.setInt(1, order.getUserID().getId());
            // Chuyển java.util.Date sang java.sql.Timestamp
            ps.setTimestamp(2, new Timestamp(order.getOrderDate().getTime()));
            ps.setString(3, order.getStatus());
            ps.setDouble(4, order.getTotalAmount());
            ps.executeUpdate();

            // Lấy mã đơn hàng được tạo tự động
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                generatedId = rs.getInt(1);
                order.setOrderId(generatedId);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return generatedId;
    }

    /**
     * Lấy đơn hàng theo mã đơn hàng
     */
    public Order getOrderById(int orderId) {
        Order order = null;
        String sql = "SELECT * FROM orders WHERE order_id = ?";
        try (Connection conn = DBConnect.get().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, orderId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                order = new Order();
                order.setOrderId(rs.getInt("order_id"));
                // Ví dụ: lấy user thông qua user_id; cần có UserDAO để lấy thông tin người dùng
                // order.setUserID(UserDAO.getInstance().getUserById(rs.getInt("user_id")));
                // Hoặc bạn tự tạo đối tượng User theo cách khác:
                // User user = new User();
                // user.setUserId(rs.getInt("user_id"));
                // order.setUserID(user);
                order.setOrderDate(rs.getTimestamp("order_date"));
                order.setStatus(rs.getString("status"));
                order.setTotalAmount(rs.getDouble("total_amount"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return order;
    }
}