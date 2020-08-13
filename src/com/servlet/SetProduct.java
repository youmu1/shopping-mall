package com.servlet;
import com.Dao.IProductDAO;
import com.pojo.Product;
import com.jspsmart.upload.SmartUpload;
import com.mpl.ProductImpl;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/setproduct")
public class SetProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        SmartUpload smartUpload = new SmartUpload();
        //初始化上传操作
        smartUpload.initialize(this.getServletConfig(), req, resp);
        Product product = new Product();
        IProductDAO iProductDAO = new ProductImpl();
        try {
            smartUpload.upload();
            String name = smartUpload.getRequest().getParameter("name");
            String description = smartUpload.getRequest().getParameter("description");
            int price = Integer.parseInt(smartUpload.getRequest().getParameter("price"));
            int stock = Integer.parseInt(smartUpload.getRequest().getParameter("stock"));
            int cate1 = Integer.parseInt(smartUpload.getRequest().getParameter("cate1"));
            int cate2 = Integer.parseInt(smartUpload.getRequest().getParameter("cate2"));
            int cate3 = Integer.parseInt(smartUpload.getRequest().getParameter("cate3"));
            String fileName = smartUpload.getFiles().getFile(0).getFileName();
            product.setName(name);
            product.setDescription(description);
            product.setPrice(price);
            product.setStock(stock);
            product.setCategoryLevel1Id(cate1);
            product.setCategoryLevel2Id(cate2);
            product.setCategoryLevel3Id(cate3);
            product.setFileName(fileName);
            iProductDAO.addProduct(product);
            smartUpload.save("D:\\image_text");

            resp.sendRedirect("setProduct.jsp");
        } catch (Exception throwables) {
            throwables.printStackTrace();
        }
    }
}
