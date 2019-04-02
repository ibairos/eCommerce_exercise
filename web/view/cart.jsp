<%@page import="cart.ShoppingCartItem"%>
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
        ShoppingCart cart = (ShoppingCart) request.getSession().getAttribute("cart");
        if (cart.getNumberOfItems() != 0) {
        %>

        <h3>Shopping cart</h3>
        <div style="display:inline-flex; text-align: center">
            <a href="category.do"><button type="button">Continue shopping</button></a>
            <form id="updatecart" action="updatecart.do" method="POST"><input type="submit" value="Update cart"></form>
            <a href="clearcart.do"><button type="button">Clear cart</button></a>
        </div>
        
       
        <table width="50%" border="1" bordercolordark="#000000" bordercolorlight="#FFFFFF" cellpadding="3" cellspacing="0">

            <thead>
                <td width="14%" valign="center" align="middle">Photo</td>
                <td width="14%" valign="center" align="middle">Description</td>
                <td width="14%" valign="center" align="middle">Price</td>
                <td width="14%" valign="center" align="middle">Quantity</td>
            </thead>
            <%

            for(ShoppingCartItem item : cart.getItems()){

            %>

            <tr>

                <td width="14%" valign="center" align="middle">
                    <img src="img/products/<%=item.getProduct().getName()%>.png"
                             alt="<%=item.getProduct().getName()%>" >
                </td>
                <td width="14%" valign="center" align="middle">
                    <p><bold><%=item.getProduct().getName()%></bold></p>
                    <p><%=item.getProduct().getDescription()%></p>
                </td>
                <td width="14%" valign="center" align="middle">
                    <%=item.getProduct().getPrice()%>
                </td>
                <td width="14%" valign="center" align="middle">
                    <input type="text" name="<%=item.getProduct().getId()%>" value="<%=item.getQuantity()%>" form="updatecart" style="width:30px">
                </td>        

            </tr>

           <% } %>

        </table>
           
        <p style="font-weight: bold; font-size: 30;">TOTAL = <%=cart.getTotal()%> € 
        <form action="https://www.paypal.com/cgi-bin/webscr" method="post">
            <input type="hidden" name="cmd" value="_xclick">
            <input type="hidden" name="business" value="ibaitxozk@gmail.com">
            <input type="hidden" name="item_name" value="eCommerce Sample">
            <input type="hidden" name="currency_code" value="EUR">
            <input type="hidden" name="amount" value="<%=cart.getTotal()%>">
            <input type="hidden" name="return" value="checkout.do?success=true">
            <input type="hidden" name="cancel_return" value="checkout.do?success=false">
            <input type="image" src="http://www.paypal.com/en_US/i/btn/x-click-but01.gif" name="submit" alt="Make payments with PayPal - it's fast, free and secure!">
        </form>
        
        <%
        } else {
        %>
        <h3>Shopping cart is empty!</h3>
        <a href="category.do"><button type="button">Continue shopping</button></a>
        <%
        } 
        %>
        
       
    </body>
