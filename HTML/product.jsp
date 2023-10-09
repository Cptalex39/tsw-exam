<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
   <head>
        <link rel="stylesheet" href="product1.css">
        <script src="product.js" defer></script>
    </head>

    <body>
        <section>
            <div class="cover flex">
                <div class="left">
                    <div class="container">
                        <nav class="main-nav">
                            <img src="img/game-controller-logo.png" class="logo">
                            <ul class="main-menu">
                                <li><a href="shop.jsp">Shop</a></li>
                                   <li><a href="form.html">Support</a></li>
                                <li><a href="login.jsp">Log-in</a></li>
                            </ul>
                            <ul class="right-menu">
                                <li>
                                <a href="#">
                                    <i class="fas fa-search"></i>
                                </a>
                                </li>
                                <li>
                                <a href="#">
                                    <i class="fas fa-shopping-cart"></i>
                                </a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                    <div class="available">
                        <p class="title"><%=application.getAttribute("titolo") %></p>
                        <select id="dropdown">
                            <option value="option1"><%=application.getAttribute("piattaforma") %></option>
                            
                        </select>
                        <div class="div">
                            <h2>Available</h2>
                        </div>
                        <div class="main_image">
                            <img src=<%=application.getAttribute("foto") %> class="slide">
                        </div>
                        <form action=Servlet method=post>
                        <p class="price" ><%=application.getAttribute("prezzo") %></p>
                        <p class="freccia">> -43% ></p>
                        <p class="prezzo"><%=application.getAttribute("sconto") %></p>
						
                        <button class="Add2" type="submit" formaction="Checkout.jsp" name=button1 value=<%=application.getAttribute("chiave") %>>BUY NOW</button>
                        </form>
                    </div>
					
                    <div class="About">
                        <p class="sectionAbout">About the Game</p>
                        <p class="description">
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                        </p>
                        <table class="table">
                            <tr>
                                <td>Installation:</td>
                                <td><a href="#">Tutorial</a></td>
                            </tr>
                            <tr>
                                <td>Release Date:</td>
                                <td>10/02/2023</td>
                            </tr>
                            <tr>
                                <td>Type:</td>
                                <td>Game design</td>
                            </tr>
                        </table>
                    </div>
                    <div class="sectionImg">
                      <!--   <p class="title">Trailer Section</p>
                         <iframe class="video" width="560" height="315" src=<%=application.getAttribute("video") %> frameborder="0" allow="autoplay; encrypted-media" allowfullscreen>
                        </iframe>-->
                    </div>

                    <h2 style="font-size: 2em;">Description</h2>
                    <p class="text"><%=application.getAttribute("descrizione") %></p>
                    <h2 style="font-size: 2em;">Mininum Requirements</h2>
                    <table class="table2">
                        <tr>
                            <td>OS:</td>
                            <td>Windows 10 (Version 1909 or Newer)</td>
                        </tr>
                        <tr>
                            <td>Processor:</td>
                            <td>AMD Ryzen 5 1500X, Intel Core i7-4770K</td>
                        </tr>
                        <tr>
                            <td>Memory:</td>
                            <td>16 GB RAM</td>
                        </tr>
                        <tr>
                            <td>Graphics:</td>
                            <td>AMD Radeon RX 470 (4 GB), AMD Radeon RX 6500 XT (4 GB), NVIDIA GeForce GTX 970 (4 GB), NVIDIA GeForce GTX 1050 Ti (4 GB)</td>
                        </tr>
                        <tr>
                            <td>Storage:</td>
                            <td>100 GB available space</td>
                        </tr>
                    </table>

                    <footer class="footer">
                        <div class="footer-inner">
                            <div><i class="fas fa-globe fa-2x"></i> English (United States)</div>
                            <ul>
                                <li><a href="#">Sitemap</a></li>
                                <li><a href="#">Contact Microsoft</a></li>
                                <li><a href="#">Privacy & cookies</a></li>
                                <li><a href="#">Terms of use</a></li>
                                <li><a href="#">Trademarks</a></li>
                                <li><a href="#">Safety & eco</a></li>
                                <li><a href="#">About our ads</a></li>
                                <li><a href="#">&copy; Microsoft 2020</a></li>
                            </ul>
                        </div>
                    </footer>
                </div>
            </div>
        </section>
    </body>
</html>