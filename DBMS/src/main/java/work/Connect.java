package work;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.ServletException;

public class Connect {

	static Connection connect1;
	Statement stat1;
	public static void main(String[] args) {
		Connection connect;
		Statement stat ;
//	public Connect() {
		String server = "jdbc:mysql://my-database-1.ck5d9adueifx.ap-southeast-2.rds.amazonaws.com/";
		String database = "part-time training system";
		String url = server + database;
		String username = "admin";
		String password = "LN6MVu8Jr38vmyylUBD0";
		//Connection connect;
		
    
        try {
            // Create a connection object
            connect= DriverManager.getConnection(url, username, password);
            System.out.println("Connected to the database!");
            stat = connect.createStatement();
            try {
            	
				connect1=connect;
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			//boolean suc = false;
				String query1,query2;
//				query1 = "SELECT * FROM duty_time;";
				query1 = "SELECT user_id FROM user;";
				query2 = "SELECT grade FROM user;";
				boolean success;
				success =stat.execute(query1);
				boolean exist;
				String [][] re;
				int index = 0;
				if(success) {
					ResultSet result = stat.getResultSet();
					ArrayList<String>c=showResultSet(result);
					re = new String [c.size()][2];
					int i =1;
					for(int j =0;j<c.size();j++) {
						re[j][1]=c.get(j);
					}
					if(c.contains(Integer.toString(i))) {
						exist = true;
						index= c.indexOf(i);
					}else {
						exist=false;
					}
					result.close();
				}
				
				boolean success2;
				success2 =stat.execute(query2);
				String p = "full-time";
				boolean isfull;
				if(exist=true) {
					if(success2) {
					ResultSet result = stat.getResultSet();
					ArrayList<String>c=showResultSet(result);
					if(c.get(index).equals("full-time")) {
						isfull = true;
						System.out.println("full-time");
//						place = "f";
					}else {
						isfull=false;
						System.out.println("part-time");
//						place = "p";
					}
					result.close();
					}
				}
        } catch (SQLException e) {
            // Handle the connection error
            System.out.println("Connection failed! Error: " + e.getMessage());
        
        }
	}
	public String check(int uid) throws ServletException, SQLException {
		   String place="a";
		   if(connect1!=null) {
			   System.out.println("Connected to the database!");
			   stat1=connect1.createStatement();
			   String query1,query2;
				query1 = "SELECT user_id FROM user;";
				query2 = "SELECT grade FROM user;";
				boolean success;
				success =stat1.execute(query1);
				boolean exist;
				String [][]re;
				int index=0;
				if(success) {
					ResultSet result = stat1.getResultSet();
					ArrayList<String>c=showResultSet(result);
					re = new String [c.size()][2];
					int i =uid;
					for(int j =0;j<c.size();j++) {
						re[j][1]=c.get(j);
					}
					if(c.contains(Integer.toString(i))) {
						exist = true;
						index= c.indexOf(i);
					}else {
						exist=false;
					}
					result.close();
				}
				boolean success2;
				success2 =stat1.execute(query2);
//				String p = "full-time";
				boolean isfull;
				if(exist=true) {
					if(success2) {
					ResultSet result = stat1.getResultSet();
					ArrayList<String>c=showResultSet(result);
					if(c.get(index).equals("full-time")) {
						isfull = true;
						System.out.println("full-time");
						place = "f";
					}else {
						isfull=false;
						System.out.println("part-time");
						place = "p";
					}
					result.close();
					}
				}
		   } 
		return place;
		   
	   }
	
	
	private static ArrayList showResultSet(ResultSet result)throws SQLException {
		// TODO Auto-generated method stub
		ArrayList<String> cid =new ArrayList<String>();
		ResultSetMetaData metadata = result.getMetaData();
		int columnCount = metadata.getColumnCount();
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


