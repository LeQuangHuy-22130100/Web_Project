package vn.edu.hcmuaf.fit.project.Controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import lombok.SneakyThrows;
import vn.edu.hcmuaf.fit.project.DAO.model.PriceRange;
import vn.edu.hcmuaf.fit.project.DAO.model.Product;
import vn.edu.hcmuaf.fit.project.DAO.model.Sizes;
import vn.edu.hcmuaf.fit.project.DAO.model.categories;
import vn.edu.hcmuaf.fit.project.Service.PriceRangeService;
import vn.edu.hcmuaf.fit.project.Service.ProductService;
import vn.edu.hcmuaf.fit.project.Service.CategoryService;
import vn.edu.hcmuaf.fit.project.Service.SizeService;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ProductControl", value = "/Products")
public class ProductControl extends HttpServlet {
    @SneakyThrows
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductService productService = new ProductService();
        String pageIndex = request.getParameter("pageIndex");
        if (pageIndex == null) {
            pageIndex = "1";
        }
        int index = Integer.parseInt(pageIndex);
        int count = productService.countProduct();
        int endPage = count / 15;
        if (count % 15 != 0) {
            endPage++;
        }

        List<Product> ProductData = productService.PageProducts(index);

        CategoryService categoryService = new CategoryService();
        List<categories> CategoryData = categoryService.getAll();

        SizeService sizeService = new SizeService();
        List<Sizes> SizeData = sizeService.getAllSize();

        PriceRangeService priceRangeService = new PriceRangeService();
        List<PriceRange> PriceRangeData = priceRangeService.getAllPriceRange();

        request.setAttribute("endPage", endPage);
        request.setAttribute("stayPage", index);
        request.setAttribute("ProductControl", ProductData);
        request.setAttribute("CateProduct", CategoryData);
        request.setAttribute("SizeProduct", SizeData);
        request.setAttribute("PriceProduct", PriceRangeData);

        request.getRequestDispatcher("Product.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
