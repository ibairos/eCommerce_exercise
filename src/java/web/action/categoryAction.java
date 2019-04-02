package web.action;

import cart.ShoppingCart;
import javax.servlet.http.*;
import model.CategoryModel;
import model.ProductModel;
import web.ViewManager;

public class categoryAction extends Action {

    CategoryModel categoryModel;
    ProductModel productModel;

    public categoryAction(CategoryModel categoryModel, ProductModel productModel) {
        this.categoryModel = categoryModel;
        this.productModel = productModel;
    }

    @Override
    public void perform(HttpServletRequest req, HttpServletResponse resp) {
        req.setAttribute("categories", categoryModel.retrieveAll());
        String category = req.getParameter("categoryid");
        int categoryid = 1;
        if (category != null) {
            categoryid = Integer.parseInt(category);
        }
        req.getSession().setAttribute("categoryid", categoryid);
        
        req.setAttribute("categoryname", categoryModel.retrieve(categoryid).getName());
        req.setAttribute("products", productModel.retrieveCategory(categoryModel.retrieve(categoryid)));
        if (req.getSession().getAttribute("cart") == null) {
            req.getSession().setAttribute("cart", new ShoppingCart());
        }
        ViewManager.nextView(req, resp, "/view/category.jsp");
    }
}
























