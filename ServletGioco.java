

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
//import com.google.gson.Gson;

/**
 * Servlet implementation class ServletCarrello
 */
public class ServletGioco extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletGioco() {
        super();
        // TODO Auto-generated constructor stub
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   /* 	
    	List<Games> games=new ArrayList<>();
		
	    String json = convertToJson(games);
	   response.setContentType("application/json");
	   response.setCharacterEncoding("UTF-8");
	   out.write(json);
	   out.close();
        
    	*/
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Enumeration<String> parameterNames = request.getParameterNames();
		PrintWriter out=response.getWriter();
		String paramName = null;
		String buttonValue = null;
		while (parameterNames.hasMoreElements()) 
		{
			 paramName = parameterNames.nextElement();
            // Verifica se il parametro è un pulsante
            if (paramName.startsWith("button")) 
            {
            	 buttonValue = request.getParameter(paramName);
            }
			
		}
		String gioco=buttonValue;
		String url = "jdbc:mysql://localhost:3306/sito";   
	    String sql;
	    String key = null;
		String piattaforma = null;
		String foto=null;
		String video=null;
		String descrizione=null;
		float prezzo = 0;
	    try 
		{
		    // Configura la connessione al tuo database
			Connection connection = DriverManager.getConnection(url, "admin", "admin");
			//registrazione
			sql="SELECT *FROM games WHERE nome=?";
			PreparedStatement statement2 = connection.prepareStatement(sql);
			statement2.setString(1, gioco);
			ResultSet rs=statement2.executeQuery();
			if(rs.next())
			{
				key=rs.getString("chiave");
				gioco=rs.getString("nome");
				piattaforma=rs.getString("piattaforma");
				prezzo=rs.getFloat("prezzo");
				foto=rs.getString("foto");
				video=rs.getString("video");
				descrizione=rs.getString("descrizione");
			}
			statement2.close();
			connection.close();
		}
	    catch (SQLException e) {
		    e.printStackTrace();
		} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    getServletContext().setAttribute("titolo", gioco);
	    getServletContext().setAttribute("piattaforma", piattaforma);
	    getServletContext().setAttribute("prezzo", prezzo);
	    getServletContext().setAttribute("foto", foto);
	    getServletContext().setAttribute("video", video);
	    getServletContext().setAttribute("descrizione", descrizione);
	    getServletContext().setAttribute("chiave", key);
	    float sconto=prezzo*43/100;
	    sconto=prezzo-sconto;
	    getServletContext().setAttribute("sconto", sconto);
	    response.sendRedirect("product.jsp");
	}
	/*class Games
	{
		private String key;
		private String gioco;
		private String piattaforma;
		private float prezzo;
		private String foto;
		private String video;
		public Games(String key, String gioco, String piattaforma, float prezzo, String foto, String video)
		{
			this.key=key;
			this.gioco=gioco;
			this.piattaforma=piattaforma;
			this.prezzo=prezzo;
		}
		public String getkey()
		{
			return key;
		}
		public String getGioco()
		{
			return gioco;
		}
		public String getPiattaforma()
		{
			return piattaforma;
		}
		public float getprezzo()
		{
			return prezzo;
		}
		public String getfoto()
		{
			return foto;
		}
		public String getvideo()
		{
			return video;
		}
	}
	private String convertToJson(List<Games> games) {
		  Gson gson = new Gson();
	        String json = gson.toJson(games);
	        return json;
	
	}*/
}
