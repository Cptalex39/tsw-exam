

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Servlet implementation class ServletModificaAdmin
 */
public class ServletEliminaAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletEliminaAdmin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @throws IOException 
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		String url = "jdbc:mysql://localhost:3306/sito";
		String key=request.getParameter("key");
		String sql;
		try 
		{
		    // Configura la connessione al tuo database
			Connection connection = DriverManager.getConnection(url, "admin", "admin");
			//registrazione
			sql="DELETE FROM games WHERE chiave=?";
			PreparedStatement statement2 = connection.prepareStatement(sql);
			statement2.setString(1, key);
			statement2.executeUpdate();
			statement2.close();
			connection.close();
		}
			catch (SQLException e) {
			    e.printStackTrace();
			}
		response.sendRedirect("admin.jsp");
	}
}
