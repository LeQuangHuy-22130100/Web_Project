package vn.edu.hcmuaf.fit.project.Controller.AdminPage;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.SneakyThrows;
import vn.edu.hcmuaf.fit.project.DAO.model.Product;
import vn.edu.hcmuaf.fit.project.Service.ProductService;

import java.io.IOException;
@WebServlet(name = "addProduct", value = "/addProduct")
public class addProduct extends HttpServlet {
    @SneakyThrows
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        String id = req.getParameter("id");
//        String category = req.getParameter("category");
//        String name = req.getParameter("name");
//        String img = req.getParameter("img");
//        String price = req.getParameter("price");
//        String description = req.getParameter("description");
//        String stock = req.getParameter("stock");
//        String material = req.getParameter("material");
//        String size = req.getParameter("size");
//
//        ProductService productService = new ProductService();
//        productService.addProduct(id,category,name,img, price,description,stock,material,size);
//        resp.sendRedirect("productManagement");
    }

    @SneakyThrows
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        String category = req.getParameter("category");
        String name = req.getParameter("name");
        String img = req.getParameter("img");
        String price = req.getParameter("price");
        String description = req.getParameter("description");
        String stock = req.getParameter("stock");
        String material = req.getParameter("material");
        String size = req.getParameter("size");
        String priceID = req.getParameter("priceID");

        ProductService productService = new ProductService();
        productService.addProduct(id,category,name,img, price,description,stock,material,size,"1");
        resp.sendRedirect("productManagement");
    }
}
