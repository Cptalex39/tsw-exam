<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.Connection, java.sql.Statement, java.sql.ResultSet, java.sql.DriverManager, java.sql.PreparedStatement, java.util.Random, java.sql.SQLException" %>
<!DOCTYPE html>
<html>
<head>
 <title>Checkout</title>
</head>
 <body>
        <h1>Checkout</h1>

       <form action="Servlet" method=post>
        <p><%=application.getAttribute("chiave") %></p>
        <%
        Random r= new Random();
        String url = "jdbc:mysql://localhost:3306/sito";   
        String key=(String)application.getAttribute("chiave");
        String sql;
        int ordine=r.nextInt();
        for(;;)
        {
        	if(ordine>0)
        		break;
        	else
        	ordine=r.nextInt();
        }
        float prezzo=0;
            getServletContext().setAttribute("chiave", key);
         try 
    		{
    		    // Configura la connessione al tuo database
    			Connection connection = DriverManager.getConnection(url, "admin", "admin");
    			sql="SELECT prezzo FROM games WHERE chiave=?";
    			PreparedStatement statement2 = connection.prepareStatement(sql);
    			statement2.setString(1, key);
    			ResultSet rs=statement2.executeQuery();
    			if(rs.next())
    			{
    				prezzo=rs.getFloat("prezzo");
    			}
    			statement2.close();
    			connection.close();
    		}
    	    catch (SQLException e) {
    		    e.printStackTrace();
    		} 
        	
    		try 
    		{
    		    // Configura la connessione al tuo database
    			Connection connection = DriverManager.getConnection(url, "admin", "admin");
    			//registrazione
    			sql="INSERT INTO carrello(ordine, chiave, prezzo) VALUES(?, ?, ?)";
    			PreparedStatement statement2 = connection.prepareStatement(sql);
    			statement2.setInt(1, ordine);
    			statement2.setString(2, key);
    			statement2.setFloat(3, Float.valueOf(prezzo));
    			statement2.executeUpdate();
    			statement2.close();
    			connection.close();
    		}
    			catch (SQLException e) {
    			    e.printStackTrace();
    			}
        %>
        	
        <button type="submit" formaction="progetto.jsp">home</button>
        </form>
        </body>
</html>