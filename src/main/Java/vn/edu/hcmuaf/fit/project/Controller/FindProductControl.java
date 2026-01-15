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
import java.util.List;

@WebServlet(name = "FindNameControl", value = "/FindName")
public class FindProductControl extends HttpServlet {
    @SneakyThrows
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductService productService = new ProductService();

        String keyword = request.getParameter("keyword");
        List<Product> findName = productService.findProductByName(keyword);

        //get all categories
        CategoryService categoryService = new CategoryService();
        List<categories> CategoryData= categoryService.getAll();

        //get all Sizes
        SizeService sizeService = new SizeService();
        List<Sizes> SizeData= sizeService.getAllSize();

        //get all PriceRange
        PriceRangeService priceRangeService = new PriceRangeService();
        List<PriceRange> PriceRangeData = priceRangeService.getAllPriceRange();

        request.setAttribute("ProductControl",findName);
        request.setAttribute("CateProduct",CategoryData);
        request.setAttribute("SizeProduct",SizeData);
        request.setAttribute("PriceProduct", PriceRangeData);
        request.getRequestDispatcher("Product.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
