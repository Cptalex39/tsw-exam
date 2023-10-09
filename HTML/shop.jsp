<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.Connection, java.sql.Statement, java.sql.ResultSet, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.SQLException" %>

<!DOCTYPE html>
<html>

<head>
    <link rel="stylesheet" type="text/css" href="shop.css">
    <title>Shop-Page</title>
</head>

<body>

    <div class="container">


            <img src="img/game-controller-logo.png" class="logo">
            
            <ul class="main-menu">
                <li><a href="shop.jsp">Shop</a></li>
                <li><a href="form.html">Support</a></li>
                <li><a href="login.jsp">Log-in</a></li>
            </ul>
                <div class="container-card">
                <%
                	try
                	{
              		    // Configura la connessione al tuo database
              			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/sito", "admin", "admin");
              			String sql1="SELECT * FROM games";
              			PreparedStatement statement1=connection.prepareStatement(sql1);
              			ResultSet rs=statement1.executeQuery();
              			while(rs.next())
              			{
              				String gioco=rs.getString("nome");
              				String piattaforma=rs.getString("piattaforma");
              				String prezzo=rs.getString("prezzo");
              				String foto=rs.getString("foto");
              				String ServletGioco="ServletGioco";
              				String submit="submit";
              				out.println("<form action=Servlet method=post>");
                            out.println(gioco + " ");
                            out.println(piattaforma+ " ");
                            out.println(prezzo+"<button type="+submit+" formaction="+ServletGioco+" name=button1 value="+gioco+">See More</button><bd>");
              			}
              			out.println("</div>");
              			rs.close();
              			statement1.close();
              			connection.close();
              			
              		}
                      catch (SQLException e) {
          			    e.printStackTrace();
          			}
                %>
</div>
			
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
 
</body>

</html>