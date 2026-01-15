package vn.edu.hcmuaf.fit.project.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
//import jdk.internal.org.jline.terminal.Size;
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

@WebServlet(name = "SizeProduct", value = "/Sizes")
public class SizeControl extends HttpServlet {
    @SneakyThrows
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String Sizerange = request.getParameter("SizeRange");
        ProductService productService = new ProductService();

            String pageIndex = request.getParameter("pageIndex");
            if (pageIndex == null) {
                pageIndex = "1";
            }
            int index = Integer.parseInt(pageIndex);
            int count = productService.countProductSize(Sizerange);
            int endPage = count / 15;
            if (count % 15 != 0) {
                endPage++;
            }
//        // get product by size
        List<Product> ProductData = productService.PageProductsSize(Sizerange,index);

        //get all categories
        CategoryService categoryService = new CategoryService();
        List<categories> CategoryData= categoryService.getAll();

        //get all Sizes
        SizeService sizeService = new SizeService();
        List<Sizes> SizeData= sizeService.getAllSize();

        //get all PriceRange
        PriceRangeService priceRangeService = new PriceRangeService();
        List<PriceRange> PriceRangeData = priceRangeService.getAllPriceRange();

        request.setAttribute("endPage", endPage);
        request.setAttribute("stayPage", index);
        request.setAttribute("SizeRangeID", Sizerange);
        request.setAttribute("ProductControl",ProductData);
        request.setAttribute("CateProduct",CategoryData);
        request.setAttribute("SizeProduct",SizeData);
        request.setAttribute("PriceProduct", PriceRangeData);
        request.getRequestDispatcher("Product.jsp").forward(request,response);
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

}
