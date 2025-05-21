<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="css/admin-dashboard.css">
</head>

<body>
    <div class="container">
        <div class="navigation">
            <ul>
                <li>
                    <a href="#">
                        <span class="icon">
                            <ion-icon name="shirt-outline"></ion-icon>
                        </span>
                        <span class="title">VaasTra</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span class="icon">
                            <ion-icon name="home-outline"></ion-icon>
                        </span>
                        <span class="title">Dashboard</span>
                    </a>
                </li>
                <li>
                <a href="${pageContext.request.contextPath}/CustomerServlet">
                 <span class="icon">
                 <ion-icon name="people-outline"></ion-icon>
                </span>
                 <span class="title">Customers</span>
               </a>
              </li>

                <li>
   			<a href="${pageContext.request.contextPath}/AdminProductServlet">
       		 <span class="icon">
            <ion-icon name="cube-outline"></ion-icon>
       		 </span>
       		 <span class="title">Products</span>
    	</a>
			</li>
			<li>
                    <a href="${pageContext.request.contextPath}/AdminOrderServlet">
                        <span class="icon">
                            <ion-icon name="cart-outline"></ion-icon>
                        </span>
                        <span class="title">Orders</span>
                    </a>
                </li>

                <li>
                     <a href="${pageContext.request.contextPath}/LogoutServlet">
                        <span class="icon">
                            <ion-icon name="log-out-outline"></ion-icon>
                        </span>
                        <span class="title">Sign Out</span>
                    </a>
                </li>
            </ul>
        </div>

        <div class="main">
            <div class="topbar">
                <div class="toggle">
                    <ion-icon name="menu-outline"></ion-icon>
                </div>

                <div class="search">
                    <label>
                        <input type="text" placeholder="Search here">
                        <ion-icon name="search-outline"></ion-icon>
                    </label>
                </div>

                <div class="user">
                <a href="${pageContext.request.contextPath}/home/admin-profile.jsp" title="Admin Profile Page">
                     <ion-icon name="person-circle-outline" style="font-size: 24px; color: #444;"></ion-icon>
                </a>

                </div>
            </div>

            <div class="cardBox">
                <div class="card">
                    <div>
                        <div class="numbers">2,340</div>
                        <div class="cardName">Total Users</div>
                    </div>
                    <div class="iconBx">
                        <ion-icon name="people-circle-outline"></ion-icon>
                    </div>
                </div>

                <div class="card">
                    <div>
                        <div class="numbers">120</div>
                        <div class="cardName">Orders</div>
                    </div>
                    <div class="iconBx">
                        <ion-icon name="cart-outline"></ion-icon>
                    </div>
                </div>

                <div class="card">
                    <div>
                        <div class="numbers">340</div>
                        <div class="cardName">Reviews</div>
                    </div>
                    <div class="iconBx">
                        <ion-icon name="star-outline"></ion-icon>
                    </div>
                </div>

                <div class="card">
                    <div>
                        <div class="numbers">$10,450</div>
                        <div class="cardName">Earning</div>
                    </div>
                    <div class="iconBx">
                        <ion-icon name="cash-outline"></ion-icon>
                    </div>
                </div>
            </div>

            <div class="details">
                <div class="recentOrders">
                    <div class="cardHeader">
                        <h2>Recent Orders</h2>
                        <a href="#" class="btn">View All</a>
                    </div>

                    <table>
                        <thead>
                            <tr>
                                <td>User ID</td>
                                <td>Product Name</td>
                                <td>Quantity</td>
                                <td>Amount</td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr><td>#U101</td><td>Denim Jacket</td><td>2</td><td>$120</td></tr>
                            <tr><td>#U102</td><td>Summer Dress</td><td>1</td><td>$75</td></tr>
                            <tr><td>#U103</td><td>Leather Boots</td><td>1</td><td>$180</td></tr>
                            <tr><td>#U104</td><td>Graphic T-Shirt</td><td>3</td><td>$90</td></tr>
                        </tbody>
                    </table>
                </div>

                <div class="recentCustomers">
                    <div class="cardHeader">
                        <h2>Recent Customers</h2>
                    </div>

                    <table>
                        <tr>
                            <td width="60px"><div class="imgBx"><img src="images/person-1.jpg" alt=""></div></td>
                            <td><h4> Hania <br> <span>Pakistan</span></h4></td>
                        </tr>
                        <tr>
                            <td width="60px"><div class="imgBx"><img src="images/person-2.jpg" alt=""></div></td>
                            <td><h4>Ravi <br> <span>India</span></h4></td>
                        </tr>
                        <tr>
                            <td width="60px"><div class="imgBx"><img src="images/person-3.png" alt=""></div></td>
                            <td><h4>Sophia <br> <span>UK</span></h4></td>
                        </tr>
                        <tr>
                            <td width="60px"><div class="imgBx"><img src="images/person-4.jpg" alt=""></div></td>
                            <td><h4>John <br> <span>Canada</span></h4></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <script src="admin-dashboard.js"></script>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>

</html>