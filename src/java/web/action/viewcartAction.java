package web.action;

import cart.ShoppingCart;
import javax.servlet.http.*;
import model.CategoryModel;
import model.ProductModel;
import web.ViewManager;

public class viewcartAction extends Action {

    CategoryModel categoryModel;
    ProductModel productModel;

    public viewcartAction(CategoryModel categoryModel, ProductModel productModel) {
        this.categoryModel = categoryModel;
        this.productModel = productModel;
    }

    @Override
    public void perform(HttpServletRequest req, HttpServletResponse resp) {
        ShoppingCart cart = (ShoppingCart) req.getSession().getAttribute("cart");
        req.getSession().setAttribute("cart", cart);        
        
        ViewManager.nextView(req, resp, "/view/cart.jsp");
    }
}
