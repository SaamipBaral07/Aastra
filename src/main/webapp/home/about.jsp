<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">

    <title>About Vastra</title>

    <link rel="stylesheet" href="css/about.css">
    <link rel="stylesheet" href="css/main.css">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

</head>

<body>
<div class="overlay"></div>
    <div class="wrapper">
      <header>
        <a href="#"><img src="images/small_llogo-1.png" alt="VaasTra Logo" /></a>

        <nav>
          <ul>
            <li><a href="index.jsp">Home</a></li>
            <li><a href="${pageContext.request.contextPath}/ProductServlet" >Products</a></li>
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




<div class="hero-section">

    <div class="overlay">

        <h1>About Vastra</h1>

        <p>Your destination for trendy, traditional, and timeless fashion.</p>

         

    </div>

</div>





<section class="about-content">

    <div class="text-side">

        <h2>This is Vastra!</h2>

        <p>At Vastra, we bring together elegance and comfort. Whether you're shopping for Men, Women, or Kids, our collections offer the perfect mix of modern styles and cultural roots. Our mission is to celebrate fashion with quality, creativity, and confidence.</p>

    </div>



</section>





<section class="values-section">

    <div class="values-container">

        <div class="value-card">

            <h3>Sustainability</h3>

            <p>Eco-friendly practices in all we do</p>

        </div>

        <div class="value-card">

            <h3>Quality</h3>

            <p>Premium materials, impeccable craftsmanship</p>

        </div>

        <div class="value-card">

            <h3>Inclusivity</h3>

            <p>Fashion that celebrates diversity</p>

        </div>

        <div class="value-card">

            <h3>Tradition</h3>

            <p>Honoring our cultural heritage</p>

        </div>

    </div>

</section>



<section class="team-section">

  <div class="quote">

    <h2>Meet the Team</h2>

    <p>"A great team makes a great brand. Together, we bring Vastra to life through passion, creativity, and dedication."</p>

  </div>



  <div class="team-members">

  

    <div class="team-card">

      <img src="images/antim.png" alt="Team Member 2">

      <h3>Antim Gurung</h3>

      <p>Creative Director</p>

    </div>

    

    <div class="team-card">

      <img src="images/aastha.jpg" alt="Team Member 1">

      <h3>Aastha Bhandari</h3>

      <p>Founder & CEO</p>

    </div>



    <div class="team-card">

      <img src="images/samip.jpeg" alt="Team Member 3">

      <h3>Samip Baral</h3>

      <p>Marketing Lead</p>

    </div>



    <div class="team-card">

      <img src="images/reshika.JPG" alt="Team Member 4">

      <h3>Reshika Adhikari</h3>

      <p>Developer</p>

    </div>



    <div class="team-card">

      <img src="images/sandeep.jpg" alt="Team Member 5">

      <h3>Sandeep Poudel</h3>

      <p>Customer Experience Head</p>

    </div>

  </div>

</section>

</div>

</body>



</html>


