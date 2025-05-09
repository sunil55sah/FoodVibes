<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.List, com.food.model.Restaurant, com.food.model.User" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FoodVibe - Your Happiness Delivered!</title>
    <link rel="stylesheet" href="CSS/styles.css">
</head>
<body>
    <header>
        <nav>
            <div class="logo">
                <img src="images/LogoFood.png"class="circular-logo" height="60px" alt="FoodVibes">
            </div>
            <ul>
                <% 
                User user = (User) session.getAttribute("loggedInUser");
                if(user != null) {
                %>
                <li><a>Welcome, <%=user.getUsername()%>!</a></li>
                <li><a href="restaurant">Restaurants</a></li>
                <li><a href="#">About Us</a></li>
                <li><a href="orderHistory">Order History</a></li>
                <li><a href="logout" class="login-btn">Logout</a></li>
                <%
                } else{
                %>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="#">About Us</a></li>
                <li><a href="#">Contact</a></li>
                <li><a href="login.jsp" class="login-btn">Login</a></li>
                <li><a href="signup.jsp" class="signup-btn">SignUp</a></li>  
                <%
                }
                %>
            </ul>
        </nav>
    </header>
    <section class="hero">
        <div class="hero-content animate__animated animate__fadeIn">
            <h1>Craving Delicious Food? Get It Delivered Fast!</h1>
            <p>Over 1000+ top restaurants at your fingertips — Fresh, Hot, and Ready for You!</p>
           <form action="restaurant" id="searchForm">
    <div class="search-box animate__animated animate__fadeInUp">
        <div class="form-group">
            <select required name="city" id="city">
                <option value="" disabled selected>Select City</option>
                <option value="Bengaluru">Bengaluru</option>
                <option value="Mumbai">Mumbai</option>
                <option value="Pune">Pune</option>
                <option value="Hyderabad">Hyderabad</option> <!-- Correct spelling -->
                <option value="Chennai">Chennai</option>
                <option value="Delhi">Delhi</option>
                <option value="Bihar">Bihar</option>
                <option value="Noida">Noida</option>
            </select>
        </div>

        <div class="form-group">
            <input type="text" placeholder="Enter State Name" name="State" id="State">
        </div>

        <div class="form-group">
            <button type="submit" class="show-restaurants">SHOW RESTAURANTS</button>
        </div>
    </div>
</form>


        </div>
<!-- Floating Bubbles and Shooting Stars -->
<div class="floating-bubbles">
    <div class="bubble"></div>
    <div class="bubble"></div>
    <div class="bubble"></div>
    <div class="bubble"></div>
    <div class="bubble"></div>
    <div class="bubble"></div>
    <div class="bubble"></div>

    <!-- Shooting Stars -->
    <div class="shooting-star"></div>
    <div class="shooting-star"></div>
    <div class="shooting-star"></div>
</div>






    </section>
    
    <section class="how-it-works">
        <h2>🍔 Fast, Fresh, and Easy!</h2>
       <p>Order your favorite dishes in 4 simple, delicious steps!</p>

        <div class="steps">
            <div class="step">
                <img src="images/step1.png" alt="Search">
                <h3>Search</h3>
                <p> Discover the Best Restaurants Near You</p>
            </div>
            <div class="step">
                <img src="images/step2.png" alt="Choose">
                <h3>Choose</h3>
                <p>Browse Hundreds of Menus and Satisfy Your Cravings</p>
            </div>
            <div class="step">
                <img src="images/step3.png" alt="Pay">
                <h3>Pay</h3>
                <p>Fast, Safe, and Super Easy – Just a Few Clicks Away</p>
            </div>
            <div class="step">
                <img src="images/step4.png" alt="Enjoy">
                <h3>Enjoy</h3>
                <p>Freshly Cooked & Delivered Right to Your Doorstep</p>
            </div>
        </div>
    </section>
    <section class="featured-dishes">
        <h2>Featured Dishes</h2>
        <div class="dishes">
            <div class="dish" class="a">
                <img src="images/pizza.avif" alt="Pizza">
                <h3>Pizza</h3>
                <p>Delicious cheese pizza with fresh ingredients.</p>
            </div>
            <div class="dish" class="b">
                <img src="images/burger.jpg" alt="Burger">
                <h3>Burger</h3>
                <p>Juicy chicken burger with crispy fries.</p>
            </div>
            <div class="dish" class="c">
                <img src="images/Biriyani.jpg" alt="Sushi">
                <h3>Biriyani</h3>
                <p>Fresh Biriyani with Hyderabadi style.</p>
            </div>
        </div>
    </section>
    <section class="restaurants" style="background-color: rgb(255, 253, 253)">
        <h2>Popular Restaurants</h2>
        <div class="restaurant-container">
            <div class="restaurant-item">
                <img src="images/Foods Images/UBQ.avif" alt="Restaurant 1">
                <h3>UBQ by Barbeque Nation</h3>
                <p>North Indian, Barbecue, Biryani</p>
                <span>40-45 mins</span>
            </div>
            <div class="restaurant-item">
                <img src="images/Foods Images/Pizza Hut.avif" alt="Restaurant 1">
                <h3>Pizza Hut</h3>
                <p>Pizzas</p>
                <span>40-45 mins</span>
            </div>
            <div class="restaurant-item">
                <img src="images/Foods Images/wow momo.avif" alt="Restaurant 1">
                <h3>Wow! Momo</h3>
                <p>Tibetan, Healthy Food</p>
                <span>40-45 mins</span>
            </div>
            <div class="restaurant-item">
                <img src="images/Foods Images/Barbeque nation.avif" alt="Restaurant 1">
                <h3>Barbeque Nation</h3>
                <p>North Indian, Barbecue, Biryani</p>
                <span>40-45 mins</span>
            </div>
            <div class="restaurant-item">
                <img src="images/Foods Images/subway.avif" alt="Restaurant 1">
                <h3>Subway</h3>
                <p>Salads,Snacks,Deserts</p>
                <span>40-45 mins</span>
            </div>
            <div class="restaurant-item">
                <img src="images/Foods Images/corner house.avif" alt="Restaurant 1">
                <h3>Corner House Ice Cream</h3>
                <p>Ice Cream, Desearts</p>
                <span>40-45 mins</span>
            </div>
            <div class="restaurant-item">
                <img src="images/Foods Images/mojo pizza.avif" alt="Restaurant 1">
                <h3>MOJO PIZZA - 2X Toppings</h3>
                <p>Pizzas, Italian, Fast Food,Deserts</p>
                <span>40-45 mins</span>
            </div>
            <div class="restaurant-item">
                <img src="images/Foods Images/mcDonalds.avif" alt="Restaurant 1">
                <h3>McDonald's</h3>
                <p>Burger, Beaverages</p>
                <span>40-45 mins</span>
            </div>
            <div class="restaurant-item">
                <img src="images/Foods Images/kfc.avif" alt="Restaurant 1">
                <h3>KFC</h3>
                <p>Burgers, Fast Foods</p>
                <span>40-45 mins</span>
            </div>
            <div class="restaurant-item">
                <img src="images/Foods Images/burgerking.avif" alt="Restaurant 1">
                <h3>Burger King</h3>
                <p>Burgers, Americans</p>
                <span>40-45 mins</span>
            </div>
            <div class="restaurant-item">
                <img src="images/Foods Images/wendy's.avif" alt="Restaurant 1">
                <h3>Wendy's Burger</h3>
                <p>Burgers, American Fast Foods</p>
                <span>40-45 mins</span>
            </div>
            <div class="restaurant-item">
                <img src="images/Foods Images/dominos.avif" alt="Restaurant 1">
                <h3>Domino's Pizza</h3>
                <p>Pizzas, Italian, Pastas</p>
                <span>40-45 mins</span>
            </div>
            <!-- Repeat for other restaurants -->
        </div>
    </section>
    <section class="testimonials">
        <h2>🌟❤️ What Our Customers Are Saying ❤️🌟</h2>
        <div class="testimonial">
            <p>"FoodVibes has completely changed my experience with food delivery! Fast, fresh, and always on time. I can't recommend them enough!"</p>
            <h4>- Sunil kumar sah</h4>
        </div>
        <div class="testimonial">
            <p>"The variety of dishes is amazing, and the quality is top-notch. From my first order, I became a regular customer. 10/10 would recommend!"</p>
            <h4>- Sandeep Bhattarai</h4>
        </div>
    </section>
    <section class="sliding-banner">
    <div class="banner-glow">
        <div class="banner-content">
            <p>🔥 Your First Taste is on Us! Grab <strong>20% OFF</strong> your first order with code <strong>FIRST20</strong> — Don’t miss out!</p>
        </div>
    </div>
</section>

    
    <footer>
        <div class="footer-content">
            <p>&copy; 2025 FoodVibes. Crafted with passion. All Rights Reserved.</p>
            <ul>
                <li><a href="#">Privacy Policy</a></li>
                <li><a href="#">Terms of Service</a></li>
                <li><a href="#">Contact Us</a></li>
            </ul>
        </div>
    </footer>
    <script>
        window.addEventListener('scroll', function() {
            const nav = document.querySelector('nav');
            if (window.scrollY > 50) {
                nav.classList.add('scrolled');
            } else {
                nav.classList.remove('scrolled');
            }
        });

        document.getElementById('searchForm').addEventListener('submit', function(event) {
            const user = '<%=user != null%>';
            if (!user) {
                event.preventDefault();
                alert("Please log in or sign up first.");
                window.location.href = 'login.jsp';
            }
        });
    </script>
    <script src="JavaScript/main.js"></script>
</body>
</html>
