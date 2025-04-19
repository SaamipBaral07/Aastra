<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>VaasTra</title>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Playfair+Display&family=Poppins:wght@200;400;700&display=swap"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="main.css" />
  </head>
  <body>
    <div class="overlay"></div>
    <div class="wrapper">
      <header>
        <a href="#"><img src="images/small_llogo.png" alt="VaasTra Logo" /></a>

        <nav>
          <ul>
            <li><a href="#" class="active">Home</a></li>
            <li><a href="#">Products</a></li>
            <li><a href="#">Categories</a></li>
            <li><a href="#">Contact</a></li>
          </ul>
        </nav>
        <div class="navbar-icons">
  		<button class="icon-button" title="Search">
    	<img src="images/search-icon.jpg" alt="Search" />
  		</button>
  		<button class="icon-button" title="Cart">
    	<img src="images/cart-icon.png" alt="Cart" />
  		</button>
</div>      
      </header>

      <main>
        <div class="left-col">
          <h1>Dress Bold. Stay Real. Be You.</h1>
          <p class="subhead">
  			Wear your vibe, not just a brand — VaasTra makes every outfit count
			</p>

          <div class="cta-btns">
            <a href="#" class="primary-cta">Browse our collection</a>

            <a href="#" class="secondary-cta">
              <span>Latest Added Collection</span>
            </a>
          </div>

          <div class="news">
            <p class="employees">50K</p>
            <p class="details">
              We’re proud to announce that we now employ a workforce of over
              <strong>50,000</strong>. It’s all possible because of you.
            </p>
          </div>
        </div>
        <div class="right-col">
          <div class="card card1">
            <div class="card-details">
              <div>
                <a href="#" class="product-title"> Women Tank Tops</a>
                <p>Authentic Cotton</p>
              </div>
              <p class="product-price">$59.99</p>
            </div>
          </div>
          <div class="card card2">
            <div class="card-details">
              <div>
                <a href="#" class="product-title">Kids Sporty Hoodies</a>
                <p>Unisex Hoddies- GREY</p>
              </div>
              <p class="product-price">$60</p>
            </div>
          </div>
          <div class="card card3">
            <div class="card-details">
              <div>
                <a href="#" class="product-title">Men's Polo-Neck</a>
                <p>Zip Closure T-Shirt</p>
              </div>
              <p class="product-price">$77.77</p>
            </div>
          </div>
        </div>
      </main>
    </div>
    <jsp:include page="footer.jsp" />
    
  </body>
</html>

