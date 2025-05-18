<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Contact Us | Vastra</title>
    <link rel="stylesheet" type="text/css" href="css/contact.css">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Playfair+Display&family=Poppins:wght@200;400;700&display=swap"
      rel="stylesheet"
    />
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Font Awesome CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>

<body>
<div class="overlay"></div>
    <div class="wrapper">
      <header>
        <a href="#"><img src="images/small_llogo-1.png" alt="VaasTra Logo" /></a>

        <nav>
          <ul>
            <li><a href="index.jsp">Home</a></li>
            <li><a href="product.jsp" >Products</a></li>
            <li><a href="#" class=active>Contact</a></li> 
            <li><a href="about.jsp">About Us</a></li>
            <li><a href="#"></a></li>
          </ul>
        </nav>

	<div class="navbar-icons">
  		<button class="icon-button" title="Search" onclick="toggleSearchBar()">
    		<img src="images/search-icon.jpg" alt="Search" />
  		</button>
  		<button class="icon-button" title="Cart" onclick="goToCart()">
   			 <img src="images/cart-icon.png" alt="Cart" />
  		</button>
  		<button class="icon-button" title="User Profile" onclick="goToUserProfile()">
   		 <img src="images/user-icon1.png" alt="User" />
  		</button>
	</div>

        <div class="search-bar-container" id="searchBar">
          <input type="text" placeholder="Search..." />
        </div>
      </header>


<div class="contact-container">
    <h1>Contact Us</h1>
    <p class="intro">
        Have questions, suggestions, or need support? Reach out to us. We'd love to hear from you!
    </p>

    <div class="info-grid">
    <!-- Location -->
	    <div class="info-card">
	        <h2><i class="fa-solid fa-location-dot" ></i>   Our Location</h2>
	        <p>Street no. 13, Lakeside, Pokhara</p>
	    </div>

    <!-- Call Us -->
	    <div class="info-card">
	        <h2><i class="fa-solid fa-phone-volume" ></i>   Call Us</h2>
	        <p>+977 9816634461</p>
	    </div>

    <!-- Email -->
	    <div class="info-card">
	        <h2><i class="fa-solid fa-envelope" ></i>   Email</h2>
	        <p>vastra.clo@gmail.com</p>
	    </div>

    <!-- Ask a Question -->
	    <div class="info-card">
	        <h2><i class="fa-solid fa-envelope-circle-check" ></i>        Ask a Question</h2>
	        <p>Fill out our form and we'll get back to you within 24 hours.</p>
	        <a href="ask-question.jsp" class="ask-btn">Get Started</a>
	    </div>
	</div>


    <div class="brand-description">
        <h2>About Vastra</h2>
        <p>
            Vastra is your go-to destination for contemporary and traditional fashion. We offer a wide variety of clothing for Men, Women, and Kids crafted with style, comfort, and culture in mind. At Vastra, fashion meets authenticity.
        </p>
        </div>
     <!-- Google Map -->
<div class="map-container">
	<h2><i class="fa-solid fa-map-location-dot"></i> Find Us on the Map</h2>
    <iframe 
        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1757.9800442439412!2d83.95744705889692!3d28.208525160276185!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3995951ea0ca76dd%3A0xa130b41a9c9ba9ef!2sStreet%20No.%2013%2C%20Pokhara%2033700!5e0!3m2!1sen!2snp!4v1745248517883!5m2!1sen!2snp" 
        width="100%" 
        height="300" 
        style="border:0; border-radius: 10px; margin-top: 10px;" 
        allowfullscreen="" 
        loading="lazy">
    </iframe>
</div>
 
</div>
</div>

</body>
</html>
