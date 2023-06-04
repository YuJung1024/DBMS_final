package work;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;

public class Connect {
	public static void main(String[] args) {
		String server = "jdbc:mysql://my-database-1.ck5d9adueifx.ap-southeast-2.rds.amazonaws.com/";
		String database = "part-time training system";
		String url = server + database;
		String username = "admin";
		String password = "LN6MVu8Jr38vmyylUBD0";
		Connection connect;
		
    
        try {
            // Create a connection object
            connect= DriverManager.getConnection(url, username, password);
            System.out.println("Connected to the database!");
            Statement stat = connect.createStatement();
			//boolean suc = false;
				String query1,query2;
//				query1 = "SELECT * FROM duty_time;";
				query1 = "SELECT user_id FROM user;";
				query2 = "SELECT grade FROM user;";
				boolean success;
				success =stat.execute(query1);
				boolean exist;
				if(success) {
					ResultSet result = stat.getResultSet();
					ArrayList<String>c=showResultSet(result);
					int i =1;
					if(c.contains(Integer.toString(i))) {
						exist = true;
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
					if(c.contains(p)) {
						isfull = true;
						System.out.println("full-time");
					}else {
						isfull=false;
						System.out.println("part-time");
					}
					result.close();
					}
				}
        } catch (SQLException e) {
            // Handle the connection error
            System.out.println("Connection failed! Error: " + e.getMessage());
        
        }
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


