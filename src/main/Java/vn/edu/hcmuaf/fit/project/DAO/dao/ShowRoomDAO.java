package vn.edu.hcmuaf.fit.project.DAO.dao;

import vn.edu.hcmuaf.fit.project.DAO.db.DBConnect;
import vn.edu.hcmuaf.fit.project.DAO.model.Product;
import vn.edu.hcmuaf.fit.project.DAO.model.ShowRoom;
import vn.edu.hcmuaf.fit.project.DAO.model.Sizes;
import vn.edu.hcmuaf.fit.project.DAO.model.categories;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ShowRoomDAO {
    List<ShowRoom> listshowRooms = new ArrayList<>(); // Dùng cho danh sách
    Statement stmt;

    {
        try {
            stmt = DBConnect.get();
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    ResultSet rs;

    public List<ShowRoom> getAllShowRooms() throws SQLException {
        rs = stmt.executeQuery(
                    "SELECT * FROM showroom"
        );

        // Duyệt qua từng dòng dữ liệu và thêm vào danh sách
        while (rs.next()) {
            ShowRoom showRoom = new ShowRoom();
            showRoom.setId(rs.getInt(1));
            showRoom.setName(rs.getString(2));
            showRoom.setAddress(rs.getString(3));
            showRoom.setHotline(rs.getString(4));
            showRoom.setDescription(rs.getString(5));
            showRoom.setImage(rs.getString(6));
            listshowRooms.add(showRoom);
        }
        rs.close();
        stmt.close();

        return listshowRooms;
    }

    public static void main(String[] args) throws SQLException {
        ShowRoomDAO showRoomDAO = new ShowRoomDAO();
        List<ShowRoom> listsr = showRoomDAO.getAllShowRooms();
        for (ShowRoom showRoom : listsr) {
            System.out.println(showRoom);
        }
    }
}
