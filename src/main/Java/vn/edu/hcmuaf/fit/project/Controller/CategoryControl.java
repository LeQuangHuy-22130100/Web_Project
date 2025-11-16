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
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CateProduct", value = "/Categories")
public class CategoryControl extends HttpServlet {
    @SneakyThrows
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String categoryID = request.getParameter("cateID");
        ProductService productService= new ProductService();
            String pageIndex = request.getParameter("pageIndex");
            if (pageIndex == null) {
                pageIndex = "1";
            }
            int index = Integer.parseInt(pageIndex);
            int count = productService.countProductCategory(categoryID);
            int endPage = count / 15;
            if (count % 15 != 0) {
                endPage++;
            }
        List<Product> ProductData= productService.PageProductCategory(categoryID,index);//2index

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
        request.setAttribute("cateID", categoryID);
        request.setAttribute("ProductControl",ProductData);
        request.setAttribute("CateProduct",CategoryData);
        request.setAttribute("SizeProduct",SizeData);
        request.setAttribute("PriceProduct", PriceRangeData);
        request.getRequestDispatcher("Product.jsp").forward(request,response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}