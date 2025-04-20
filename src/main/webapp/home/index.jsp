<!-- index.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>FashionWave - Home</title>
    <link rel="stylesheet" href="style.css">
    <script src="script.js" defer></script>
</head>
<body>
    <header>
        <div class="logo">AasTra</div>
        <nav>
            <ul>
                <li><a href="#">Home</a></li>
                <li><a href="#men">Men</a></li>
                <li><a href="#women">Women</a></li>
                <li><a href="#kids">Kids</a></li>
                <li><a href="login.jsp">Login</a></li>
            </ul>
        </nav>
    </header>

    <section class="hero">
        <div class="hero-content">
            <h1>Discover the Latest Fashion</h1>
            <p>Trendy outfits for Men, Women, and Kids</p>
            <a href="#collection" class="btn">Shop Now</a>
        </div>
    </section>

    <section class="categories" id="collection">
        <div class="category" id="men">
            <h2>Men's Collection</h2>
            <p>Explore the latest in men’s fashion</p>
        </div>
        <div class="category" id="women">
            <h2>Women's Collection</h2>
            <p>Elegant and trendy styles for every woman</p>
        </div>
        <div class="category" id="kids">
            <h2>Kids' Collection</h2>
            <p>Colorful and comfortable wear for kids</p>
        </div>
    </section>

    <footer>
        <p>&copy; 2025 FashionWave. All rights reserved.</p>
    </footer>
</body>
</html>
