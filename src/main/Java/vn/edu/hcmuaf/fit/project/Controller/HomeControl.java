package vn.edu.hcmuaf.fit.project.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.SneakyThrows;
import vn.edu.hcmuaf.fit.project.DAO.model.Product;
import vn.edu.hcmuaf.fit.project.Service.ProductService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "HomePage", value = "/HomePage")
public class HomeControl extends HttpServlet {
    @SneakyThrows
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductService productService = new ProductService();
        List<Product> listnewProduct = productService.getProductsNew();
        request.setAttribute("listnewProduct", listnewProduct);
        request.getRequestDispatcher("HomePage.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
