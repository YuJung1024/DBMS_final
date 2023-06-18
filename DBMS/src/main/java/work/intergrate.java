package work;

import java.io.IOException;
import java.net.UnknownHostException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map.Entry;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.ArrayList;

import java.io.File;
import java.io.FileReader;
import java.io.FileNotFoundException;
import java.util.Scanner;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;


/**
 * Servlet implementation class intergrate
 */
@WebServlet("/intergrate")
public class intergrate extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public int uid ;   
	
    /**
     * @see HttpServlet#HttpServlet()
     */
	public Connection conn;
	public Statement stat;
	public String userid;
	public ArrayList<String> re = new ArrayList<String>();
//	public Connect connect= new Connect();
	
	   public void init() throws ServletException {
	        try {
	        	String connectionURL = "jdbc:mysql://my-database-1.ck5d9adueifx.ap-southeast-2.rds.amazonaws.com/part-time training system"; 
	        	Connection connection=null;
	 	       
	        	Class.forName("com.mysql.jdbc.Driver").newInstance(); 
	            // Create a connection object
	        	connection = DriverManager.getConnection(connectionURL, "admin", "LN6MVu8Jr38vmyylUBD0");
	        	if(!connection.isClosed()) {
	        		System.out.println("Connected to the database!");
	        		conn=connection;
	        		stat=conn.createStatement();
	 	    	 
	 	    	 String query;
	 	    	 query ="SELECT user_id,grade FROM user;";
	 	    	 boolean success;
	 	    	 success  = stat.execute(query);
	 	    	 if(success) {
	 	    		 ResultSet result = stat.getResultSet();
	 	    		 re=showResultSet(result);
	 	    		 System.out.print(re);
	 	    		 result.close();
	 	    		 connection.close();
	 	    	 }
	 	      }
	        } catch (SQLException e) {
	            // Handle the connection error
	            System.out.println("Connection failed! Error: " + e.getMessage());
	        } catch (InstantiationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
	    }
	   public String check(Integer uid) throws ServletException, SQLException {
		   String place="a";
		   String user=uid.toString();
		   Integer id_in=2*uid-2;
		   
		   String ui=id_in.toString();
		   Integer pla = 2*uid -1;
		   boolean exist = false;
		   System.out.print(re.get(id_in)+"!!!\n\n");
		   System.out.println("Start to check!");
		   if(re.get(id_in).equals(user)) {
			   exist = true;
			   System.out.println("user exist!\n");
			   if(re.get(pla).equalsIgnoreCase("full-time")) {
				   place="f";
				   System.out.println("is manager");
			   }else if(re.get(pla).equalsIgnoreCase("part-time")) {
				   place ="p";
				   System.out.println("is part-time");
			   }
		   }
		return place;
		   
	   }
	

//	   public void getinput(String input) {
//		   userid=input;
//		   System.out.println(userid);
//	   }
	
    public intergrate() throws IOException,SQLException{
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.print("get parameter\n");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		System.out.print(re);
		if(request.getParameter("uid")== null) {
			userid = request.getParameter("uid");
			request.setAttribute("input_id", userid);
			request.getRequestDispatcher("login.jsp").forward(request, response);
			System.out.print(userid);
			return;
			
			
		}
			int uid;
			userid = request.getParameter("uid");
			request.setAttribute("input_id", userid);
			uid = Integer.parseInt(userid);
			//request.getRequestDispatcher("login.jsp").forward(request, response);
			System.out.println("userid1"+userid);
			try {
				String status;
				status=check(uid);
				System.out.println("status:"+status);
				if(status.equalsIgnoreCase("p")) {
					response.reset();
					response.sendRedirect("userpage.jsp");
					
					//request.getRequestDispatcher("userpage.jsp").forward(request, response);
					return;
					}
				else if(status.equalsIgnoreCase("f"))  {
					response.reset();
					response.sendRedirect("manager.jsp");
					
					//request.getRequestDispatcher("manager.jsp").forward(request, response);
					return ;
				}else {
					return;
				}
			} catch (ServletException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		// TODO Auto-generated method stub
		doGet(request, response);
		
	}
	
	   private static ArrayList<String> showResultSet(ResultSet result)throws SQLException {
			// TODO Auto-generated method stub
			ArrayList<String> cid =new ArrayList<String>();
			String[][] c;
			ResultSetMetaData metadata = result.getMetaData();
			int columnCount = metadata.getColumnCount();
			c = new String[columnCount][2];
			for(int i = 1;i<=columnCount;i++) {
				System.out.printf("%15s",metadata.getColumnLabel(i));
			}
			System.out.println();
			
			while(result.next()) {
				for(int j = 1;j<=columnCount;j++) {
					cid.add(result.getString(j));
					System.out.printf("%15s",result.getString(j));
				}
				System.out.println();
			}
			return cid;
		}
}
