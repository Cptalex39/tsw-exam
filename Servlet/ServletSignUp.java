

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.InvalidKeyException;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Base64;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;

/**
 * Servlet implementation class ServletSignUp
 */
public class ServletSignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletSignUp() {
        super();
        // TODO Auto-generated constructor stub
    }
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 	String url = "jdbc:mysql://localhost:3306/sito";
		    String nickname = request.getParameter("username");
			String email=request.getParameter("email");
			String password = request.getParameter("password");
			String sql;
			
			byte[] encryptedPassword = Base64.getEncoder().encode(password.getBytes());
			//connessione  al database
		try 
		{
		    // Configura la connessione al tuo database
			Connection connection = DriverManager.getConnection(url, "admin", "admin");
			//registrazione
			sql="INSERT INTO utenti(nickname,email,pass) VALUES(?, ?, ?)";
			PreparedStatement statement2 = connection.prepareStatement(sql);
			statement2.setString(1, nickname);
			statement2.setString(2, email);
			statement2.setString(3, new String(encryptedPassword));
			statement2.executeUpdate();
			statement2.close();
			connection.close();
			}
			catch (SQLException e) {
			    e.printStackTrace();
						}
		response.sendRedirect("progetto.jsp");
	     }
	
			
	}