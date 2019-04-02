package web.action;

import cart.ShoppingCart;
import entity.Category;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.CategoryModel;
import model.ProductModel;
import web.ViewManager;

public class neworderAction extends Action {

    CategoryModel categoryModel;
    ProductModel productModel;

    public neworderAction(CategoryModel categoryModel, ProductModel productModel) {
        this.categoryModel = categoryModel;
        this.productModel = productModel;
    }

    @Override
    public void perform(HttpServletRequest req, HttpServletResponse resp) {
        int productid = Integer.parseInt(req.getParameter("productid"));
        ShoppingCart cart = (ShoppingCart) req.getSession().getAttribute("cart");
        cart.addItem(productModel.retrieve(productid));
        
        req.getSession().setAttribute("cart", cart);
        int categoryid = 1;
        if (req.getSession().getAttribute("categoryid") != null) {
            categoryid = (Integer) req.getSession().getAttribute("categoryid");
        }
        Category cat = categoryModel.retrieve(categoryid);
        req.setAttribute("products", productModel.retrieveCategory(cat));
        req.setAttribute("categories", categoryModel.retrieveAll());
        req.setAttribute("categoryname", cat.getName());

        ViewManager.nextView(req, resp, "/view/category.jsp");
    }
}







