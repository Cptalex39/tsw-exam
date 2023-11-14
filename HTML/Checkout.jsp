<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.Connection, java.sql.Statement, java.sql.ResultSet, java.sql.DriverManager, java.sql.PreparedStatement, java.util.Random, java.sql.SQLException" %>
<!DOCTYPE html>
<html>
<head>
 <title>Checkout</title>
 <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #000;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        .container {
            max-width: 800px;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #4caf50;
        }

        form {
            display: grid;
            grid-gap: 20px;
        }

        label {
            font-size: 16px;
            color: #555;
        }

        input,
        select {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 10px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
        }

        button {
            background-color: #4caf50;
            color: #000;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 18px;
        }

        button:hover {
            background-color: #45a049;
        }
        </style>
</head>
 <body>
        <h2>Checkout</h2>

       <form action="Servlet" method=post>
        <h2>Chiave: <%=application.getAttribute("chiave") %></h2>
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