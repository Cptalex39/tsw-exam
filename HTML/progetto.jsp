<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
      <head>
        <title>
            Home Page
        </title>
        <link rel="stylesheet" type="text/css" href="home1.css">
        <script src="home.js" defer></script>
    </head>

    <body>
        <div class="menu-btn">
            <i class="fas fa-bars fa-2x"></i>
        </div>

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
            <!-- Showcase -->
        <div> 
           <form action="Servlet" method=post>
            <header class="showcase">
                <h2 style="color: #fff">last release</h2>
                <p style="color: #fff;">Last release of the moment, the sequel of the game hollow knight<br> after 4 years
                    is finally out!!!!</p>
                <button class="btn" type="submit" formaction="ServletGioco" name=button1 value="SilkSong">See More</button>
            </header>
        </form>
        </div>
		<form action="Servlet" method=post>
        <div class="container2">
            <!-- Home cards 1 -->
            <hr>
            <h3 class="services">Services</h3>
            <section class="home-cards">
                <div style="color: #fff;">
                    <img src="img/Gta.jpg" height="150" alt="">
                    <h3>Gta5</h3>
                    
                    <button class="btn" type="submit" formaction="ServletGioco" name=button1 value="gta">See More</button>
                </div>
                <div style="color: #fff;">
                    <img src="img/Acv.jpg" height="150" alt="" />
                    <h3>Assassin's Creed Vallalha</h3>
                    <button class="btn" type="submit" formaction="ServletGioco" name=button1 value="Assassin's credd valallha">See More</button>
                </div>
                <div style="color: #fff;">
                    <img src="img/Gow.jpg" height="150" alt="">
                    <h3>God of war ragnarok</h3>
                    <button class="btn" type="submit" formaction="ServletGioco" name=button1 value="god of war ragnarok">See More</button>
                </div>
                <div style="color: #fff;">
                    <img src="img/ff16.jpg" height="150" alt="" />
                    <h3>Final Fantasy XVI</h3>
                   <button class="btn" type="submit" formaction="ServletGioco" name=button1 value="Final Fantasy XVI">See More</button>
                </div>
            </section>
            <hr>
        </div>
  </form>
        
            <!-- Best-Buy -->
        <div class="container3">
            <form action="Servlet" method="post">
            <section class="Best-Buy">
                <p class="The-best">Game of the moment!!!</p>
                <div class="content">
                    <button class="btn1" name="button2" formaction="ServletGioco" value="StarWars">SEE MORE</button>
                </div>
            </section>
        </form>
                </div>
            </section>
        </div>
            
            <!-- Home cards 2 -->
            <hr style="border-top: 2px solid #fff;">
            <h3 class="categorie">Categories</h3>
            <section class="home-cards">
                <div style="color: #fff;">
                    <img src="img/Arcade.jpg" alt="" />
                    <h3>Arcade</h3>
                    <a href="shop.jsp">Shop Now <i class="fas fa-chevron-right"></i></a>
                </div>
                <div style="color: #fff;">
                    <img src="img/avventura.jpg" alt="" />
                    <h3>Adventure</h3>
                    <a href="shop.jsp">Shop Now <i class="fas fa-chevron-right"></i></a>
                </div>
                <div style="color: #fff;">
                    <img src="img/Azione.jpg" alt="" />
                    <h3>Action</h3>
                    <a href="shop.jsp">Shop Now <i class="fas fa-chevron-right"></i></a>
                </div>
                <div style="color: #fff;">
                    <img src="img/Giocatore-Singolo.jpg" alt="" />
                    <h3>Single Player</h3>
                    <a href="shop.jsp">Shop Now <i class="fas fa-chevron-right"></i></a>
                </div>
                <div style="color: #fff;">
                    <img src="img/FPS.jpg" alt="" />
                    <h3>FPS</h3>
                    <a href="shop.jsp">Shop Now <i class="fas fa-chevron-right"></i></a>
                </div>
                <div style="color: #fff;">
                    <img src="img/PicchiaDuro.jpg" alt="" />
                    <h3>Fighting Game</h3>
                    <a href="shop.jsp">Shop Now <i class="fas fa-chevron-right"></i></a>
                </div>
                <div style="color: #fff;">
                    <img src="img/RPG.jpg" alt="" />
                    <h3>RPG Game</h3>
                    <a href="shop.jsp">Shop Now <i class="fas fa-chevron-right"></i></a>
                </div>
                <div style="color: #fff;">
                    <img src="img/Strategia.jpg" alt="" />
                    <h3>Strategy</h3>
                    <a href="shop.jsp">Shop Now <i class="fas fa-chevron-right"></i></a>
                </div>
            </section>
                
            <!--Sconti della settimana--> 
            <h3 class="categorie">Best Discounts</h3>
            <div class="discount">

                <div class="contenitore">
                    <img src="img/FPS.jpg" class="immagine">
                    <p class="scritta">89.99€</p> <p class="freccia"> -> </p> <p class="scritta">50.99€</p> <p class="freccia"> -> </p> <p class="prezzo"> 35.99€ </p>
                    <button class="btn Bottone">Add to cart</button>
                </div>

            <div class="discount2">

                <div class="contenitore2">
                    <img src="img/Arcade.jpg" class="immagine2">
                    <p class="scritta2"> 89.99€ </p> <p class="freccia2"> <- </p> <p class="scritta2"> 59.99€ </p> <p class="freccia2"> <- </p> <p class="prezzo2"> 35.99€ </p>
                    <button class="btn Bottone">Add to cart</button>
                </div>

            </div>
    </div>
        
        <!-- Footer -->
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
    </body>
</html>