<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection, java.sql.Statement, java.sql.ResultSet, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.SQLException" %>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="admin.css">
        <script src="admin.js" defer></script>
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
                    
                    <li><a href="progetto.jsp">Home</a></li>
                </ul>
               </nav>
               </div>
        <h1>ADMIN TABLE</h1>
        <form action="Servlet" method=post>
        <div class="container">
            <table>
                <tr>
                    <td>
                    	<p class="intestazione">Chiave</p>
                        <input type="text" name="key">
                    </td>
                    <td>
                    	<p class="intestazione">Nome</p>
                        <input type="text" name="nome">
                    </td>
                </tr>
                
                <tr>
                    <td>
                    	<p class="intestazione">Piattaforma</p>
                        <input type="text" name="piattaforma">
                    </td>
                    <td>
                    	<p class="intestazione">Prezzo</p>
                        <input type="text" name="prezzo">
                    </td>
                </tr>
                 
                  <%
                  try 
          			{
          		    // Configura la connessione al tuo database
          			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/sito", "admin", "admin");
          			String sql1="SELECT * FROM games ORDER BY chiave ASC";
          			PreparedStatement statement1=connection.prepareStatement(sql1);
          			ResultSet rs=statement1.executeQuery();
          			while(rs.next())
          			{
          				String key=rs.getString("chiave");
          				String gioco=rs.getString("nome");
          				String piattaforma=rs.getString("piattaforma");
          				String prezzo=rs.getString("prezzo");
          				String game="game";
          				out.println("<p class="+game+">");
          				out.println("chiave " + key + " ");
                        out.println("nome " + gioco + " ");
                        out.println("piattaforma " + piattaforma+ " ");
                        out.println("prezzo " +prezzo+ "<br>");
                        out.println("</p>");
          			}
          			
          			rs.close();
          			statement1.close();
          			connection.close();
          			
          		}
                  catch (SQLException e) {
      			    e.printStackTrace();
      			}
              %>
            </table>
        </div>
        <button type="submit" class="btn" formaction="ServletAdmin">Invia</button>
       </form>
       <h1>MODIFICA PRODOTTO</h1>
       <form action="Servlet" method="post">
        <div class="container">
            <table>
                <tr>
                    <td>
                    	<p class="intestazione">Chiave</p>
                        <input type="text" name="key">
                    </td>
                    <td>
                    	<p class="intestazione">Prezzo</p>
                        <input type="text" name="prezzo">
                    </td>
                </tr>
                </table>
                </div>
        <button type="submit" class="btn" formaction="ServletModificaAdmin">Invia</button>
        </form>
        <h1>ELIMINA PRODOTTO</h1>
        <form action="Servlet" method="post">
        <div class="container">
            <table>
                <tr>
                    <td>
                    	<p class="intestazione">Chiave</p>
                        <input type="text" name="key">
                    </td>
                </tr>
                </table>
                </div>
        <button type="submit" class="btn" formaction="ServletEliminaAdmin">Invia</button>
        </form>
        <form>
        <h1>PRODOTTI ACQUISTATI</h1>
        <p>
        
        </p>
          	 <%
                  try 
          			{
          		    // Configura la connessione al tuo database
          			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/sito", "admin", "admin");
          			String sql1="SELECT * FROM carrello ORDER BY data_inserimento";
          			PreparedStatement statement1=connection.prepareStatement(sql1);
          			ResultSet rs=statement1.executeQuery();
          			while(rs.next())
          			{
          				String key=rs.getString("chiave");
          				String prezzo=rs.getString("prezzo");
          				String data=rs.getString("data_inserimento");
          				int ordine=rs.getInt("ordine");
          				String game="game";
          				out.println("<p class"+game+">");
          				out.println("ordine "+ ordine +" ");
          				out.println("chiave " + key + " ");
                        out.println("prezzo " +prezzo+ " ");
                        out.println("data inserimento "+data+ "<br>");
                        out.println("</p>");
          			}
          			
          			rs.close();
          			statement1.close();
          			connection.close();
          			
          		}
                  catch (SQLException e) {
      			    e.printStackTrace();
      			}
              %>
        </form>
    </body>
</html>