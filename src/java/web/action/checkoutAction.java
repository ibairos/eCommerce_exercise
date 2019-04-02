package web.action;

import cart.ShoppingCart;
import entity.Category;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.CategoryModel;
import model.ProductModel;
import web.ViewManager;

public class checkoutAction extends Action {

    @Override
    public void perform(HttpServletRequest req, HttpServletResponse resp) {
        boolean success = false;
        if (req.getParameter("success") != null) {
            success = Boolean.parseBoolean(req.getParameter("success"));
        }
        if (success) {
            req.getSession().setAttribute("cart", new ShoppingCart());
        }
        ViewManager.nextView(req, resp, "/view/checkout.jsp");
    }
}














