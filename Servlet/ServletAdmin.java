

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.cj.protocol.Resultset;

/**
 * Servlet implementation class SerlveltAdmin
 */
public class ServletAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletAdmin() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String url = "jdbc:mysql://localhost:3306/sito";
		String key=request.getParameter("key");
	    String gioco = request.getParameter("nome");
		String piattaforma=request.getParameter("piattaforma");
		String prezzo = request.getParameter("prezzo");
		String sql;
		try 
		{
		    // Configura la connessione al tuo database
			Connection connection = DriverManager.getConnection(url, "admin", "admin");
			//registrazione
			sql="INSERT INTO games(chiave, nome, piattaforma, prezzo, foto, video) VALUES(?, ?, ?, ?, '', '')";
			PreparedStatement statement2 = connection.prepareStatement(sql);
			statement2.setString(1, key);
			statement2.setString(2, gioco);
			statement2.setString(3, piattaforma);
			statement2.setFloat(4, Float.valueOf(prezzo));
			statement2.executeUpdate();
			statement2.close();
			connection.close();
		}
			catch (SQLException e) {
			    e.printStackTrace();
			}
		getServletContext().setAttribute("chiave", key);
		getServletContext().setAttribute("titolo", gioco);
	    getServletContext().setAttribute("piattaforma", piattaforma);
	    getServletContext().setAttribute("prezzo", prezzo);
		response.sendRedirect("progetto.jsp");
	}
}
