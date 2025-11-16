package vn.edu.hcmuaf.fit.project.Service;

import vn.edu.hcmuaf.fit.project.DAO.dao.ShowRoomDAO;
import vn.edu.hcmuaf.fit.project.DAO.model.ShowRoom;

import java.sql.SQLException;
import java.util.List;

public class ShowRoomService {
    ShowRoomDAO showRoomDAO = new ShowRoomDAO();

    public List<ShowRoom> getAllShowRoom() throws SQLException {
        return showRoomDAO.getAllShowRooms();
    }
}
