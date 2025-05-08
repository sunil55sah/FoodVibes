<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.List, com.food.model.Menu, com.food.model.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Restaurant Menu</title>
    <link rel="stylesheet" href="CSS/menu.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
</head>
<body>
    <header>
        <nav>
            <img src="images/LogoFood.png"class="circular-logo" height="60px" alt="FoodVibes">
           
            <ul>
                <% 
                User user = (User) session.getAttribute("loggedInUser");
                if(user != null) {
                %>
                <li><a>Welcome, <%=user.getUsername()%>!</a></li>
                <li><a href="restaurant">Restaurants</a></li>
                <li><a href="#">About Us</a></li>
                <li><a href="orderHistory">Order History</a></li>
                <li><a href="cart" id="cart-button" class="cart">
                    <i class="fas fa-shopping-cart"></i> Cart <span id="cart-count">0</span>
                <li><a href="logout" class="login-btn">Logout</a></li>
                </a></li>
                <%
                } else{
                %>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="#">About Us</a></li>
                <li><a href="#">Contact</a></li>
                <li><a href="login.jsp" class="login-btn">Login</a></li>
                <li><a href="signup.jsp" class="signup-btn">SignUp</a></li>
                <li><a href="cart" id="cart-button" class="cart">
                    <i class="fas fa-shopping-cart"></i> Cart <span id="cart-count">0</span>
                </a></li>  
                <%
                }
                %>
            </ul>
        </nav>
    </header>
     <div class="container">
        <h1 class="container-header">Our Menu</h1>
        <div class="menu-list">
            <%
                @SuppressWarnings("unchecked")
                List<Menu> menuList = (List<Menu>) request.getAttribute("menuList");
                System.out.println("Menu List in JSP: " + menuList); // Debug statement
                if (menuList != null && !menuList.isEmpty()) {
                    for (Menu menu : menuList) {
            %>
            <div class="menu-item">
                <img src="images/Foods Images/kfc.avif" alt="Dish-<%= menu.getMenuId() %>">
                <h3><%= menu.getItemName() %></h3>
                <p><%= menu.getDescription() %></p>
                <p>Price: <%= menu.getPrice() %></p>
               <form action="cart" method="post">
    <input type="hidden" name="itemId" value="<%= menu.getMenuId() %>">
    <input type="hidden" class="item-name" value="<%= menu.getItemName() %>">
    <input type="hidden" class="item-price" value="<%= menu.getPrice() %>">
    
    Quantity: 
    <input type="number" name="quantity" value="1" min="1" class="quantity-input">
    
    <button 
        type="submit" 
        class="add-to-cart"
        data-name="<%= menu.getItemName() %>" 
        data-price="<%= menu.getPrice() %>">
        <i class="fas fa-cart-plus"></i> Add to Cart
    </button>
    
    <input type="hidden" name="action" value="add">
</form>

            </div>
            <%
                    }
                } else {
            %>
            <p>No Menu item available.</p>
            <%
                }
            %>
            <!-- Add more menu items as needed -->
        </div>
    </div>
    <script src="JavaScript/menu.js"></script>
</body>
</html>
