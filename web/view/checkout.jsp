<%@ page import="java.util.List" %>

    <head>
        <meta http-equiv="Expires" CONTENT="0">
        <meta http-equiv="Cache-Control" CONTENT="no-cache">
        <meta http-equiv="Pragma" CONTENT="no-cache">
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>eCommerce Sample</title>
    </head>
    
    <body>

        <h2 style="margin-bottom: 50px">Welcome to the online home of the Affable Bean Green Grocer</h2>
        <% 
        boolean success = false;
        if (request.getParameter("success") != null) {
            success = Boolean.parseBoolean(request.getParameter("success"));
        }
        if (success) { 
        %>
        <h3>Payment successful!</h3>
        <% 
        } else {
        %>
        <h3>Payment not successful! Want to return to the <a href="viewcart.do">cart</a>?</h3>
        <%
        }
        %>

    </body>
