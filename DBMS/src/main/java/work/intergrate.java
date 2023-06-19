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

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		   int leng=re.size();
		   String ui=id_in.toString();
		   Integer pla = 2*uid -1;
		   boolean exist = false;
		   System.out.print(re.get(id_in)+"!!!\n\n");
		   System.out.println("Start to check!");
		   if(re.get(id_in).equals(user)) {
			   exist = true;
			   System.out.println("user exist!\n");
			   if(exist=true) {
				   if(re.get(pla).equalsIgnoreCase("full-time")) {
					   place="f";
					   System.out.println("is manager");
				   }else if(re.get(pla).equalsIgnoreCase("part-time")) {
					   place ="p";
					   System.out.println("is part-time");
				   }
			   }else {
				   place = "n";
			   } 
		   }else {
			   place = "n";
		   } 
		return place;
		   
	   }
	

    public intergrate() throws IOException,SQLException{
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.print("get parameter\n");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		System.out.print(re);
		if(request.getParameter("uid")==null  || request.getParameter("uid").trim().isEmpty()) {
//			userid = request.getParameter("uid");
//			request.setAttribute("input_id", userid);
//			request.getRequestDispatcher("login.jsp").forward(request, response);
			
			response.reset();
			response.sendRedirect("login.jsp");
			return;
			
			
		}
			//int uid;
			userid = request.getParameter("uid");
			
			uid = Integer.parseInt(userid);
			
			ServletContext context = getServletContext();
			context.setAttribute("inputid", userid);

			//request.getRequestDispatcher("login.jsp").forward(request, response);
			System.out.println("userid1"+userid);
			int leng=re.size()/2;
			if(uid<=leng) {
				try {
					String status;
					status=check(uid);
					System.out.println("status:"+status);
					if(status.equalsIgnoreCase("p")) {
						HttpSession session1 = request.getSession();
						String value1 ="員工編號"+uid+"你好!" ;
						session1.setAttribute("myValue1", value1);
//						boolean showAlert1 = true;
//						request.setAttribute("showAlert1", showAlert1);
//						String alertMessage1 = "員工編號"+uid+"你好!";
//						request.setAttribute("alertMessage1", alertMessage1);
						
						response.reset();
						response.sendRedirect("userpage.jsp");
						
						//request.getRequestDispatcher("manager_page.jsp").forward(request, response);
						return;
						}
					else if(status.equalsIgnoreCase("f"))  {
						HttpSession session = request.getSession();
						String value ="員工編號"+uid+"你好!" ;
						session.setAttribute("myValue", value);
//						boolean showAlert2 = true;
//						request.setAttribute("showAlert2", showAlert2);
//						String alertMessage2 = "員工編號"+uid+"你好!";
//						request.setAttribute("alertMessage2", alertMessage2);
						
						response.reset();
						response.sendRedirect("manager.jsp");
						
						//request.getRequestDispatcher("manager_page.jsp").forward(request, response);
						return ;
					}else {
//						boolean showAlert=true;
//						HttpSession session2 = request.getSession();
//						HttpSession session3 = request.getSession();
//						String value2 ="請輸入正確的員工編號!" ;
//						session3.setAttribute("showAlert", showAlert);
//						session2.setAttribute("myValue2", value2);
						response.reset();
						response.sendRedirect("login.jsp");
						return;
					}
				} catch (ServletException | SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}else {
//				boolean showAlert=true;
//				HttpSession session2 = request.getSession();
//				String value2 ="請輸入正確的員工編號!" ;
//				session2.setAttribute("showAlert", showAlert);
//				session2.setAttribute("myValue2", value2);
				response.reset();
				response.sendRedirect("login.jsp");
				return;
			}
			
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
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
