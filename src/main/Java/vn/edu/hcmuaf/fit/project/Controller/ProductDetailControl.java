package vn.edu.hcmuaf.fit.project.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.SneakyThrows;
import vn.edu.hcmuaf.fit.project.DAO.model.PriceRange;
import vn.edu.hcmuaf.fit.project.DAO.model.Product;
import vn.edu.hcmuaf.fit.project.DAO.model.Sizes;
import vn.edu.hcmuaf.fit.project.DAO.model.categories;
import vn.edu.hcmuaf.fit.project.Service.CategoryService;
import vn.edu.hcmuaf.fit.project.Service.PriceRangeService;
import vn.edu.hcmuaf.fit.project.Service.ProductService;
import vn.edu.hcmuaf.fit.project.Service.SizeService;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "ProductDetail", value = "/ProductDetail")
public class ProductDetailControl extends HttpServlet {
    @SneakyThrows
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("ProductID");
        ProductService productService= new ProductService();
        Product ProductDetail= null;
        try {
            ProductDetail = productService.getProductDetail(id);
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        //get all Sizes
        SizeService sizeService = new SizeService();
        List<Sizes> SizeData= sizeService.getAllSize();

        request.setAttribute("ProductDetail",ProductDetail);
        request.setAttribute("SizeProduct",SizeData);
        request.getRequestDispatcher("ProductDetail.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
