<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>About Vastra</title>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;500;600;700&family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="css/main.css">
     <link rel="stylesheet" href="css/about.css">
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
                    <li><a href="${pageContext.request.contextPath}/ProductServlet">Products</a></li>
                    <li><a href="contact.jsp">Contact</a></li> 
                    <li><a href="about.jsp" class="active">About Us</a></li>
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
                    <img src="images/antim.png" alt="Antim Gurung">
                    <h3>Antim Gurung</h3>
                    <p>Creative Director</p>
                </div>
                
                <div class="team-card">
                    <img src="images/aastha.jpg" alt="Aastha Bhandari">
                    <h3>Aastha Bhandari</h3>
                    <p>Founder & CEO</p>
                </div>

                <div class="team-card">
                    <img src="images/samip.jpeg" alt="Samip Baral">
                    <h3>Samip Baral</h3>
                    <p>Project Leader</p>
                </div>

                <div class="team-card">
                    <img src="images/reshika.JPG" alt="Reshika Adhikari">
                    <h3>Reshika Adhikari</h3>
                    <p>Marketing head</p>
                </div>

                <div class="team-card">
                    <img src="images/sandeep.jpg" alt="Sandeep Poudel">
                    <h3>Sandeep Poudel</h3>
                    <p>Customer Experience Head</p>
                </div>
            </div>
        </section>
    </div>
     

    <script>
        function toggleSearchBar() {
            const searchBar = document.getElementById('searchBar');
            if (searchBar.classList.contains('show')) {
                searchBar.classList.remove('show');
                setTimeout(() => searchBar.style.display = 'none', 300);
            } else {
                searchBar.style.display = 'block';
                setTimeout(() => searchBar.classList.add('show'), 10);
            }
        }

        function goToCart() {
            window.location.href = "cart.jsp";
        }

        function goToUserProfile() {
            window.location.href = "userprofile.jsp";
        }

        // Close search when clicking outside
        document.addEventListener('click', function(event) {
            const searchBar = document.getElementById('searchBar');
            const searchButton = document.querySelector('.icon-button[title="Search"]');
            
            if (!searchBar.contains(event.target) && !searchButton.contains(event.target)) {
                if (searchBar.classList.contains('show')) {
                    searchBar.classList.remove('show');
                    setTimeout(() => searchBar.style.display = 'none', 300);
                }
            }
        });
    </script>
</body>
</html>