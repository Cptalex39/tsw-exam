import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.SecureRandom;
import java.security.spec.PKCS8EncodedKeySpec;
import java.util.Base64;
import java.util.Enumeration;

import javax.crypto.Cipher;

import org.apache.catalina.User;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * Servlet implementation class Servlet
 */
public class ServletLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Reindirizza l'utente alla web app
        response.sendRedirect("login.jsp");
    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 // Genera una coppia di chiavi pubblica/privata
		try {
			
			    // Configura la connessione al tuo database
				Class.forName("com.mysql.cj.jdbc.Driver");
				String password = request.getParameter("password");
				String url = "jdbc:mysql://localhost:3306/sito";
			    String nickname = request.getParameter("username");
			    String encrypted = null;
				//connessione al database
				Connection connection = DriverManager.getConnection(url, "admin", "admin");
				String sql="SELECT pass FROM utenti WHERE nickname=?";
			    PreparedStatement statement1 = connection.prepareStatement(sql);
			    statement1.setString(1, nickname);
			    ResultSet rs=statement1.executeQuery();
			    if(rs.next())
			    encrypted=rs.getString("pass");
			    
			    statement1.close();
			    connection.close();
		        byte[] decryptedPassword=Base64.getDecoder().decode(encrypted);	
		        if(nickname.equals("admin") && password.equals(new String(decryptedPassword)))
		        {
		        	//si è autenticato l'ammministratore
		        	RequestDispatcher rd=request.getRequestDispatcher("admin.jsp");
					rd.forward(request, response);
		        }
		        else if (password.equals(new String(decryptedPassword)))
				{
					// L'utente è autenticato, procedi con l'elaborazione della richiesta
					RequestDispatcher rd=request.getRequestDispatcher("progetto.jsp");
					rd.forward(request, response);
				} 
				else 
				{
				    // L'utente non è autenticato, reindirizzalo alla pagina di login o visualizza un messaggio di errore
					request.setAttribute("errorMessage", "Password errata");
					RequestDispatcher rd=request.getRequestDispatcher("login.jsp?error=true");
					rd.forward(request, response);
				}
			    
			}catch (ClassNotFoundException e) {
		        e.printStackTrace(); }
		
		        catch (SQLException e) {
			    e.printStackTrace();
			} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		} 
	}