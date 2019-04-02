<%@ page import="cart.ShoppingCart" %>
<%@ page import="entity.Product" %>
<%@ page import="entity.Category" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html" pageEncoding="windows-1252" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Expires" CONTENT="0">
        <meta http-equiv="Cache-Control" CONTENT="no-cache">
        <meta http-equiv="Pragma" CONTENT="no-cache">
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>eCommerce Sample</title>
    </head>
    <body>
        
        <%
        List<Category> categories = (List<Category>)request.getAttribute("categories");
        List<Product> products = (List<Product>)request.getAttribute("products");
        ShoppingCart cart = (ShoppingCart) request.getSession().getAttribute("cart");
        %>

        <h3>Products of bakery</h3>
        
        <div>
            <img src="img/cart.gif" alt=""> <%=cart.getNumberOfItems()%> items
            <%
            if (cart.getNumberOfItems() > 0) {
            %>
            <a href="viewcart.do">View Cart</a>
            <%
            }
            %>
        </div>
        
        <%
        if (cart.getNumberOfItems() > 0) {
        %>
        <p>
            <a href="checkout.do">
                Proceed to checkout
            </a>
        </p>
        <%
        }
        %>

       
    <div width="80%" display="inline-block" border="1px solid black">

        <div float="left" display="inline-block">
            <table width="10%" border="1" bordercolordark="#000000" bordercolorlight="#FFFFFF" cellpadding="3" cellspacing="0">

                <% 
                    for (Category category : categories) { 
                %>
                <tr>
                    <td width="14%" valign="center" align="middle">
                        <a href="category.do?categoryid=<%=category.getId()%>">
                            <%=category.getName()%>
                        </a>
                    </td>
                </tr>
                <%
                    }
                %>

            </table>
        </div>
        <div float="left" display="inline-block">
            <table width="50%" border="1" bordercolordark="#000000" bordercolorlight="#FFFFFF" cellpadding="3" cellspacing="0">

                <%

                for(Product product : products){

                %>

                <tr>

                    <td width="14%" valign="center" align="middle">
                        <img src="img/products/<%=product.getName()%>.png"
                                 alt="<%=product.getName()%>" >
                    </td>
                    <td width="14%" valign="center" align="middle">
                        <p><bold><%=product.getName()%></bold></p>
                        <p><%=product.getDescription()%></p>
                    </td>
                    <td width="14%" valign="center" align="middle">
                        <%=product.getPrice()%>
                    </td>
                    <td width="14%" valign="center" align="middle">
                        <a href="neworder.do?productid=<%=product.getId()%>"><button type="button">add to cart</button></a>
                    </td>        

                </tr>

               <% } %>

            </table>
        </div>
       
    </div>
       
    </body>
