package vn.edu.hcmuaf.fit.project.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.SneakyThrows;
import vn.edu.hcmuaf.fit.project.DAO.model.ShowRoom;
import vn.edu.hcmuaf.fit.project.Service.ShowRoomService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ShowRoomControl", value = "/ShowRoom")
public class ShowRoomControl extends HttpServlet {
    @SneakyThrows
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ShowRoomService serviceSR = new ShowRoomService();
        List<ShowRoom> showRoomData = serviceSR.getAllShowRoom();

        request.setAttribute("ShowRoom", showRoomData);
        request.getRequestDispatcher("ShowRoom.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
